import 'package:flutter/material.dart';
import 'package:newafest/widgets/custom_add_recipe/food_category.dart';
import 'package:newafest/widgets/custom_add_recipe/image_upload.dart';

class AddRecipe extends StatefulWidget {
  const AddRecipe({super.key});

  @override
  State<AddRecipe> createState() => _AddRecipeState();
}

class _AddRecipeState extends State<AddRecipe> {
  final OutlineInputBorder border = const OutlineInputBorder(
    borderSide: BorderSide(
      width: 1.5,
      style: BorderStyle.solid,
      color: Colors.grey,
    ),
    borderRadius: BorderRadius.all(Radius.circular(5)),
  );

  Widget _foodName() {
    return TextField(
      maxLines: 1,
      style: const TextStyle(
        fontSize: 14,
        fontFamily: "Poppins",
        fontWeight: FontWeight.w400,
      ),
      decoration: InputDecoration(
        labelText: "Enter food name",
        filled: true,
        fillColor: Colors.white,
        focusedBorder: border,
        enabledBorder: border,
        labelStyle: const TextStyle(
          color: Colors.grey,
          fontSize: 14,
          fontFamily: "Poppins",
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }

  // Description input field
  Widget _description() {
    return TextField(
      minLines: 5,
      maxLines:null,
      style: const TextStyle(
        fontSize: 14,
        fontFamily: "Poppins",
        fontWeight: FontWeight.w400,
      ),
      decoration: InputDecoration(
        labelText: "Tell a little about your food",
        filled: true,
        fillColor: Colors.white,
        focusedBorder: border,
        enabledBorder: border,
        labelStyle: const TextStyle(
          color: Colors.grey,
          fontSize: 14,
          fontFamily: "Poppins",
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }

  double _currentValue = 60;
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal:15, vertical:12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const ImageUpload(),
                const SizedBox(height: 20),
                const FoodCategory(),
                const SizedBox(height: 20),
                const Text(
                  "Food Name",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    fontFamily: "Poppins",
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 10),
                _foodName(),
                const SizedBox(height: 20),
                const Text(
                  "Description",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    fontFamily: "Poppins",
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 10),
                _description(),
                const SizedBox(height: 20),
                const Text(
                  "Cooking Duration (in minutes)",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    fontFamily: "Poppins",
                    color: Colors.black,
                  ),
                ),
                Slider(
                  value: _currentValue,
                  min: 0, // Minimum value of the slider
                  max: 60, // Maximum value of the slider
                  divisions: 6, // Number of steps
                  label: _currentValue.round().toString(), // Label showing the current value
                  activeColor: const Color(0xff701714), // Color for the active part of the slider
                  inactiveColor: Colors.grey, // Color for the inactive part of the slider
                  onChanged: (double newValue) {
                    setState(() {
                      _currentValue = newValue; // Update the value when the slider is moved
                    });
                  },
                ),
              ],
            ),
          )
        ),
    );
  }
}

