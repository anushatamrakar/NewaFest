import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:newafest/utility/display_message.dart';

class RecipeService {
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
      if (foodName.isEmpty || category.isEmpty || description.isEmpty) {
        throw Exception('All fields must be filled.');
      }

      // Add recipe to Firestore
      await FirebaseFirestore.instance.collection('recipes').add({
        'coverPhoto': coverPhoto,
        'category': category,
        'foodName': foodName,
        'description': description,
        'duration': duration,
        'sharerId': sharerId,
        'ingredients': ingredients, // List of maps for ingredients
        'steps': steps,             // List of maps for steps
        'members': members ?? {},   // Optional members
      });

      // Show success message
      DisplayMessage.displayMessage(
        context,
        "Recipe added successfully!",
        AlertType.success,
      );
    } catch (e) {
      // Handle and display errors
      print("Error in addRecipe: $e");
      DisplayMessage.displayMessage(
        context,
        "Failed to add Recipe: ${e.toString()}",
        AlertType.error,
      );
    }
  }
}
