
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:newafest/utility/display_message.dart';


class RecipeController {
  Future<void> addRecipeToFirebase(BuildContext context, Map<String, dynamic> recipeData) async {
    try {
      final FirebaseFirestore fireStore = FirebaseFirestore.instance;

      // Adding the recipe to Firestore
      await fireStore.collection('recipes').add(recipeData);

      // Display success message
      DisplayMessage.displayMessage(
        context,
        "Recipe added successfully!",
        AlertType.success,
      );
      print("Recipe added successfully!");
    } catch (e) {
      // Display error message
      DisplayMessage.displayMessage(
        context,
        "Recipe added un-successfully!",
        AlertType.error,
      );
      throw Exception("Failed to add recipe");
    }
  }

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


}