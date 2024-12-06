
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:newafest/utility/display_message.dart';


class RecipeController {
  Future<void> addRecipe(
      BuildContext context,
      String coverPhoto,
      String category,
      String foodName,
      String description,
      String duration,
      String sharerId, {
        required List<Map<String, dynamic>> ingredients,
        required List<Map<String, dynamic>> steps,
        Map<String, dynamic>? members,
      }) async {
    try {
      // Validate required fields
      final requiredFields = {
        "Cover Photo": coverPhoto,
        "Category": category,
        "Food Name": foodName,
        "Description": description,
        "Duration": duration,
        "Sharer ID": sharerId,
      };

      for (var entry in requiredFields.entries) {
        if (entry.value.isEmpty) {
          throw Exception('${entry.key} must be filled.');
        }
      }

      // Add recipe to Firestore
      await FirebaseFirestore.instance.collection('recipes').add({
        'coverPhoto': coverPhoto,
        'category': category,
        'foodName': foodName,
        'description': description,
        'duration': duration,
        'sharerId': sharerId,
        'ingredients': ingredients,
        'steps': steps,
        'members': members ?? {},
      });

      // Display success message
      DisplayMessage.displayMessage(
        context,
        "Recipe added successfully!",
        AlertType.success,
      );
    } catch (e) {
      print("Error in addRecipe: $e");
      DisplayMessage.displayMessage(
        context,
        "Failed to add Recipe: ${e.toString()}",
        AlertType.error,
      );
    }
  }
  //
  // Future<List<Map<String, dynamic>>> getUserByID(String uid) async {
  //
  //   try {
  //     final DocumentSnapshot userSnapshot = await FirebaseFirestore.instance
  //         .collection('users')
  //         .doc(uid)
  //         .get();
  //
  //     if (!userSnapshot.exists) {
  //       return [];
  //     }
  //
  //     final data = userSnapshot.data() as Map<String, dynamic>;
  //     return [
  //       {
  //         'user': {...data, 'id': userSnapshot.id},
  //       }
  //     ];
  //   } catch (e) {
  //     throw Exception("Failed to fetch user data: $e");
  //   }
  // }
  //
  // Future<List<Map<String, dynamic>>> getSellerByID(String uid) async {
  //   try {
  //
  //     final QuerySnapshot userSnapshot = await FirebaseFirestore.instance
  //         .collection('users')
  //         .where(FieldPath.documentId, isEqualTo: uid)
  //         .where('role', isEqualTo: 'seller')
  //         .get();
  //
  //     if (userSnapshot.docs.isEmpty) {
  //       return [];
  //     }
  //
  //     final data = userSnapshot.docs.first.data() as Map<String, dynamic>;
  //     return [
  //       {
  //         'user': {...data, 'id': userSnapshot.docs.first.id},
  //       }
  //     ];
  //   } catch (e) {
  //     throw Exception("Failed to fetch user data: $e");
  //   }
  // }
  //
  //
  // Future<List<Map<String, dynamic>>> getAllRecipesWithUser() async {
  //   try {
  //     final QuerySnapshot RecipeSnapshot = await FirebaseFirestore.instance
  //         .collection('Recipes')
  //         .get();
  //
  //     final userIds = RecipeSnapshot.docs
  //         .map((doc) => doc['createdBy'] as String)
  //         .toSet();
  //
  //     final QuerySnapshot userSnapshot = await FirebaseFirestore.instance
  //         .collection('users')
  //         .where(FieldPath.documentId, whereIn: userIds.toList())
  //         .get();
  //
  //     final userMap = {
  //       for (var doc in userSnapshot.docs) doc.id: doc.data() as Map<String, dynamic>
  //     };
  //
  //     return RecipeSnapshot.docs.map((RecipeDoc) {
  //       final RecipeData = RecipeDoc.data() as Map<String, dynamic>;
  //       final userId = RecipeData['created_by'];
  //       final userData = userMap[userId];
  //       return {
  //         'Recipe': {...RecipeData, 'id': RecipeDoc.id},
  //         'user': userData,
  //       };
  //     }).toList();
  //   } catch (e) {
  //     throw Exception("Failed to fetch Recipes with user data: $e");
  //   }
  // }
  // Future<List<Map<String, dynamic>>> getRecipesById(String? id) async {
  //   try {
  //     final DocumentSnapshot RecipeSnapshot = await FirebaseFirestore.instance
  //         .collection('Recipes')
  //         .doc(id)
  //         .get();
  //
  //     if (!RecipeSnapshot.exists) {
  //       return [];
  //     }
  //
  //     final RecipeData = RecipeSnapshot.data() as Map<String, dynamic>;
  //     return [
  //       {
  //         'Recipe': {...RecipeData, 'id': RecipeSnapshot.id},
  //       }
  //     ];
  //   } catch (e) {
  //     throw Exception("Failed to fetch Recipe data: $e");
  //   }
  // }
  // // Future<List<Map<String, dynamic>>> getAllRecipesCatWithUsers(String category) async {
  // //   try {
  // //     final QuerySnapshot RecipeSnapshot = await FirebaseFirestore.instance
  // //         .collection('Recipes')
  // //         .where('category', isEqualTo: category)
  // //         .get();
  // //
  // //     final userIds = RecipeSnapshot.docs
  // //         .map((doc) => doc['user_id'] as String)
  // //         .toSet();
  // //
  // //     final QuerySnapshot userSnapshot = await FirebaseFirestore.instance
  // //         .collection('users')
  // //         .where(FieldPath.documentId, whereIn: userIds.toList())
  // //         .get();
  // //
  // //     final userMap = {
  // //       for (var doc in userSnapshot.docs) doc.id: doc.data() as Map<String, dynamic>
  // //     };
  // //
  // //     return RecipeSnapshot.docs.map((RecipeDoc) {
  // //       final RecipeData = RecipeDoc.data() as Map<String, dynamic>;
  // //       final userId = RecipeData['user_id'];
  // //       final userData = userMap[userId];
  // //       return {
  // //         'Recipe': {...RecipeData, 'id': RecipeDoc.id},
  // //         'user': userData,
  // //       };
  // //     }).toList();
  // //   } catch (e) {
  // //     throw Exception("Failed to fetch Recipes with user data: $e");
  // //   }
  // // }
  // Future<List<Map<String, dynamic>>> getRecipesByCategory(String category) async {
  //   try {
  //     final QuerySnapshot querySnapshot = await FirebaseFirestore.instance
  //         .collection('Recipes')
  //         .where('category', isEqualTo: category)  // Filter by category
  //         .get();
  //
  //     if (querySnapshot.docs.isEmpty) {
  //       return [];
  //     }
  //
  //     return querySnapshot.docs.map((doc) {
  //       final RecipeData = doc.data() as Map<String, dynamic>;
  //       return {...RecipeData, 'id': doc.id};  // Add the doc ID to the data
  //     }).toList();
  //   } catch (e) {
  //     throw Exception("Failed to fetch Recipes by category: $e");
  //   }
  // }
  //
  //
  //
  //
  // Future<List<Map<String, dynamic>>> getRecipesByCategoryAndUserWithDetails(
  //     String category, String userId) async {
  //   try {
  //
  //     print(userId);
  //     final QuerySnapshot RecipeSnapshot = await FirebaseFirestore.instance
  //         .collection('Recipes')
  //         .where('category', isEqualTo: category)
  //         .where('createdBy', isEqualTo: userId)
  //         .get();
  //
  //     if (RecipeSnapshot.docs.isEmpty) {
  //       return [];
  //     }
  //
  //     final DocumentSnapshot userDoc = await FirebaseFirestore.instance
  //         .collection('users')
  //         .doc(userId)
  //         .get();
  //
  //     if (!userDoc.exists) {
  //       throw Exception('user with ID $userId does not exist.');
  //     }
  //
  //     final userData = userDoc.data() as Map<String, dynamic>;
  //
  //     return RecipeSnapshot.docs.map((RecipeDoc) {
  //       final RecipeData = RecipeDoc.data() as Map<String, dynamic>;
  //       return {
  //         'Recipe': {...RecipeData, 'id': RecipeDoc.id},
  //         'user': {...userData, 'id': userDoc.id},
  //       };
  //     }).toList();
  //   } catch (e) {
  //     throw Exception("Failed to fetch Recipes and user data: $e");
  //   }
  // }
  //
  // // Future<Map<String, dynamic>?> getRecipeByuserAndRecipeId(
  // //     String RecipeId, String userId) async {
  // //   try {
  // //     final querySnapshot = await FirebaseFirestore.instance
  // //         .collection('Recipes')
  // //         .where(FieldPath.documentId, isEqualTo: RecipeId)
  // //         .where('user_id', isEqualTo: userId)
  // //         .get();
  // //     if (querySnapshot.docs.isEmpty) {
  // //       throw Exception("No matching Recipe found for user with ID $userId.");
  // //     }
  // //     final RecipeDoc = querySnapshot.docs.first;
  // //     final RecipeData = RecipeDoc.data();
  // //     if (RecipeData['user_id'] != userId) {
  // //       throw Exception("Recipe does not belong to user with ID $userId.");
  // //     }
  // //     final userSnapshot = await FirebaseFirestore.instance
  // //         .collection('users')
  // //         .doc(userId)
  // //         .get();
  // //
  // //     if (!userSnapshot.exists) {
  // //       throw Exception("user with ID $userId does not exist.");
  // //     }
  // //     final userData = userSnapshot.data() as Map<String, dynamic>;
  // //     return {
  // //       'Recipe': {...RecipeData, 'id': RecipeDoc.id},
  // //       'user': {...userData, 'id': userSnapshot.id},
  // //     };
  // //   } catch (e) {
  // //     throw Exception("Failed to fetch Recipe and user data: $e");
  // //   }
  // // }
  // Future updateRecipe(
  //     BuildContext context, String RecipeId, Map<String, dynamic> updates) async {
  //   try {
  //
  //     DocumentReference RecipeDocRef =
  //     FirebaseFirestore.instance.collection('Recipes').doc(RecipeId);
  //
  //
  //     await RecipeDocRef.update(updates);
  //
  //     DisplayMessage.displayMessage(
  //       context,
  //       "Recipe updated successfully!",
  //       AlertType.success,
  //     );
  //   } catch (e) {
  //     // Handle and display error alert
  //     DisplayMessage.displayMessage(
  //       context,
  //       "Error updating recipe profile: ${e.toString()}",
  //       AlertType.error,
  //     );
  //   }
  // }
  //

}