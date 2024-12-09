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

      // Check if the recipe already exists using foodName or sharerId
      final existingRecipe = await FirebaseFirestore.instance
          .collection('recipes')
          .where('foodName', isEqualTo: foodName)
          .where('sharerId', isEqualTo: sharerId)
          .get();

      if (existingRecipe.docs.isNotEmpty) {
        throw Exception('This recipe already exists.');
      }

      // Add the new recipe to Firestore
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
  Future<void> updateCustomerProfile(
      BuildContext context, String customerId, Map<String, dynamic> updates) async {
    try {
      DocumentReference customerDocRef =
      FirebaseFirestore.instance.collection('customer').doc(customerId);
      await customerDocRef.update(updates);

      // Show success alert
      DisplayMessage.displayMessage(
        context,
        "Customer profile updated successfully!",
        AlertType.success,
      );
    } catch (e) {
      // Handle and display error alert
      DisplayMessage.displayMessage(
        context,
        "Error updating customer profile: ${e.toString()}",
        AlertType.error,
      );
    }
  }
  Future<void> updateChefProfile(
      BuildContext context, String customerId, Map<String, dynamic> updates) async {
    try {
      DocumentReference customerDocRef =
      FirebaseFirestore.instance.collection('sharer').doc(customerId);
      await customerDocRef.update(updates);

      // Show success alert
      DisplayMessage.displayMessage(
        context,
        "Customer profile updated successfully!",
        AlertType.success,
      );
    } catch (e) {
      // Handle and display error alert
      DisplayMessage.displayMessage(
        context,
        "Error updating customer profile: ${e.toString()}",
        AlertType.error,
      );
    }
  }
}
