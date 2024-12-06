import 'package:cloud_firestore/cloud_firestore.dart';

class UserDatabase {
  final String uid;

  UserDatabase({required this.uid});

  final CollectionReference userCollection =
  FirebaseFirestore.instance.collection('users');

  Future<void> updateUser({
    required String email,
    required String password,
    required String role,
  }) async {
    try {
      await userCollection.doc(uid).set({
        'email': email,
        'role': role,
        'password':password,
      });
    } catch (e) {
      print("Error updating user data: $e");
      rethrow;
    }
  }
}