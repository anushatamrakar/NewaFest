import 'package:cloud_firestore/cloud_firestore.dart';

class CustDatabase {
  final String uid;

  CustDatabase({required this.uid});

  final CollectionReference userCollection =
  FirebaseFirestore.instance.collection('customer');

  Future<void> updateUser({
    required String fullName,
    required String email,
    required String username,
    required String phone,
    required String img,
    required String password,
    required String role,
  }) async {
    try {
      await userCollection.doc(uid).set({
        'email': email,
        'role': role,
        'password':password,
        'username': username,
        'phone': phone,
        'image': img,
        'fullName':fullName,

      });
    } catch (e) {
      print("Error updating customer data: $e");
      rethrow;
    }
  }
}