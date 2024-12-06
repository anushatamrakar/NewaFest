import 'package:cloud_firestore/cloud_firestore.dart';

class SharerDatabase {
  final String uid;

  SharerDatabase({required this.uid});

  final CollectionReference userCollection =
  FirebaseFirestore.instance.collection('sharer');

  Future<void> updateUser({
    required String fullName,
    required String email,
    required String username,
    required String phone,
    required String img,
    required String password,
    required String role,
    required String experience,
     Map<String, dynamic>? follower,
     Map<String, dynamic> ?subscribers,

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
        'experience': experience,
        'subscriber': subscribers,
        'followers':follower,

      });
    } catch (e) {
      print("Error updating sharer data: $e");
      rethrow;
    }
  }
}