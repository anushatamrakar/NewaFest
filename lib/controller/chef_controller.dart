
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ChefController {
  Future<List<Map<String, dynamic>>> getChefProfile(String? uid) async {
    try {

      final QuerySnapshot userSnapshot = await FirebaseFirestore.instance
          .collection('sharer')
          .where(FieldPath.documentId, isEqualTo: uid)
          .get();

      if (userSnapshot.docs.isEmpty) {
        return [];
      }

      final data = userSnapshot.docs.first.data() as Map<String, dynamic>;
      return [
        {
          'user': {...data, 'id': userSnapshot.docs.first.id},
        }
      ];
    } catch (e) {
      throw Exception("Failed to fetch user data: $e");
    }
  }
  Future<List<Map<String, dynamic>>> getRecipeDetails(String uid) async {
    try {

      final QuerySnapshot userSnapshot = await FirebaseFirestore.instance
          .collection('recipes')
          .where(FieldPath.documentId, isEqualTo: uid)
          .get();

      if (userSnapshot.docs.isEmpty) {
        return [];
      }

      final data = userSnapshot.docs.first.data() as Map<String, dynamic>;
      return [
        {
          'recipes': {...data, 'id': userSnapshot.docs.first.id},
        }
      ];
    } catch (e) {
      throw Exception("Failed to fetch user data: $e");
    }
  }
  Future<List<Map<String, dynamic>>> getUserData(String? uid) async {
    try {

      final QuerySnapshot userSnapshot = await FirebaseFirestore.instance
          .collection('customer')
          .where(FieldPath.documentId, isEqualTo: uid)
          .get();

      if (userSnapshot.docs.isEmpty) {
        return [];
      }

      final data = userSnapshot.docs.first.data() as Map<String, dynamic>;
      return [
        {
          'user': {...data, 'id': userSnapshot.docs.first.id},
        }
      ];
    } catch (e) {
      throw Exception("Failed to fetch user data: $e");
    }
  }
  Future<List<Map<String, dynamic>>> getChefRecipes(String? uid) async {
    try {
      final QuerySnapshot userSnapshot = await FirebaseFirestore.instance
          .collection('recipes')
          .where('sharerId', isEqualTo: uid)
          .get();

      if (userSnapshot.docs.isEmpty) {
        return [];
      }

      List<Map<String, dynamic>> recipes = userSnapshot.docs.map((doc) {
        return {
          'recipe': {
            ...doc.data() as Map<String, dynamic>,
            'id': doc.id,  // Add the document ID to the recipe data
          }
        };
      }).toList();

      // Return the list of recipes
      return recipes;
    } catch (e) {
      throw Exception("Failed to fetch user recipes: $e");
    }
  }
  Future<List<Map<String, dynamic>>> getChefs() async {
    try {
      final QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('sharer')
          .get();

      if (querySnapshot.docs.isEmpty) {
        return [];
      }

      return querySnapshot.docs.map((doc) {
        final recipeData = doc.data() as Map<String, dynamic>;
        return {...recipeData, 'id': doc.id};  // Add the doc ID to the data
      }).toList();
    } catch (e) {
      throw Exception("Failed to fetch chef by category: $e");
    }
  }
  Future<List<Map<String, dynamic>>> getRecipe() async {
    try {
      final QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('recipes')
          .get();

      if (querySnapshot.docs.isEmpty) {
        return [];
      }

      return querySnapshot.docs.map((doc) {
        final recipeData = doc.data() as Map<String, dynamic>;
        return {...recipeData, 'id': doc.id};  // Add the doc ID to the data
      }).toList();
    } catch (e) {
      throw Exception("Failed to fetch chef by category: $e");
    }
  }


  Future<List<Map<String, dynamic>>> getRecipeWithSharer() async {
    try {
      final QuerySnapshot recSnap = await FirebaseFirestore.instance
          .collection('recipes')
          .get();

      final sharerIds = recSnap.docs
          .map((doc) => doc['sharerId'] as String)
          .toSet();

      final QuerySnapshot sharerSnapshot = await FirebaseFirestore.instance
          .collection('sharer')
          .where(FieldPath.documentId, whereIn: sharerIds.toList())
          .get();

      final sharerMap = {
        for (var doc in sharerSnapshot.docs) doc.id: doc.data() as Map<String, dynamic>
      };

      return recSnap.docs.map((share) {
        final recipeData = share.data() as Map<String, dynamic>;
        final sharerId = recipeData['sharerId'];
        final sharerData = sharerMap[sharerId];
        return {
          'recipe': {...recipeData, 'id': share.id},
          'sharer': sharerData,
        };
      }).toList();
    } catch (e) {
      throw Exception("Failed to fetch chef with farmer data: $e");
    }
  }

}

