import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:newafest/models/user_model.dart';
import 'package:newafest/services/customer_database.dart';
import 'package:newafest/services/sharer_database.dart';
import 'package:newafest/services/user_database.dart';
import 'package:newafest/utility/display_message.dart';

class Authentication {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  UserModel? _userFromFirebaseUser(User? user, Map<String, dynamic>? userData) {
    return user != null && userData != null
        ? UserModel(
      uid: user.uid,
      email: userData['email'] ?? '',
      password: '',
      role: userData['role'] ?? '',
    )
        : null;
  }

  Stream<UserModel?> get user {
    return _auth.authStateChanges().asyncMap((User? user) async {
      if (user == null) return null;

      // Fetch user data from Firestore
      DocumentSnapshot userDoc = await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .get();

      if (!userDoc.exists) return null;

      Map<String, dynamic> userData = userDoc.data() as Map<String, dynamic>;
      return _userFromFirebaseUser(user, userData);
    });
  }

  Future registrationProcess(BuildContext context,
      String email,
      String password,
      String fullName,
      String phone,
      String role,
      String? img,
      String? username,
      String? experience,) async {
    try {
      // Register the user
      UserCredential result = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      User? user = result.user;


      // Update data in Firestore based on role
      if (role == 'sharer') {
        await SharerDatabase(uid: user!.uid).updateUser(
          fullName: fullName,
          email: email,
          phone: phone,
          role: role,
          experience: experience ?? '',
          img: img ?? "",
          username: username ?? '',
          password: password,

        );
      } else if (role == 'customer') {
        await CustDatabase(uid: user!.uid).updateUser(
          fullName: fullName,
          email: email,
          phone: phone,
          role: role,

          img: img ?? "",
          username: username ?? '',
          password: password,

        );
      }

      // Update generic user data
      await UserDatabase(uid: user!.uid).updateUser(
        email: email,
        password: password,
        role: role,
      );

      print("User registered successfully as $role: ${user.uid}");
    } catch (e) {
      DisplayMessage.displayMessage(
        context,
        "Login failed! Please try again!",
        AlertType.error,
      );
    }
  }

  Future<UserModel?> signIn(BuildContext context, String email,
      String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      User? user = result.user;

      if (user == null) {DisplayMessage.displayMessage(
        context,
        "Login failed! Please try again!",
        AlertType.error,
      );
      return null;
      }

      DocumentSnapshot userDoc = await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .get();

      if (!userDoc.exists) {
        DisplayMessage.displayMessage(
          context,
          "User not found!!",
          AlertType.error,
        );
        return null;
      }

      Map<String, dynamic> data = userDoc.data() as Map<String, dynamic>;
      return _userFromFirebaseUser(user, data);
    } catch (e) {
      DisplayMessage.displayMessage(
        context,
        "Error during login: ${e.toString()}",
        AlertType.error,
      );
      return null;
    }
  }

  Future<void> signOut() async {
    await _auth.signOut();
    print("User signed out successfully.");
  }

  Future passwordReset(BuildContext context, email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email.trim());
      DisplayMessage.displayMessage(
        context,
        'Email verification has been sent to your Gmail account!',
        AlertType.success,
      );
    } catch (e) {
      DisplayMessage.displayMessage(
        context,
        "Email doesnot exist",
        AlertType.error,
      );
    }
  }

  Future<void> updateCustomerImage(BuildContext context, String customerId,
      String imageUrl) async {
    try {
      DocumentReference userDocRef = FirebaseFirestore.instance.collection(
          'customers').doc(customerId);
      await userDocRef.update({
        'image': imageUrl,
      });
      DisplayMessage.displayMessage(
        context,
        "customer image updated successfully!",
        AlertType.success,
      );
    } catch (e) {
      DisplayMessage.displayMessage(
        context,
        "Error updating customer image: ${e.toString()}",
        AlertType.error,
      );
    }
  }


}