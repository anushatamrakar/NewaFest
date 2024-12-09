import 'package:flutter/material.dart';
import 'package:newafest/widgets/custom_button.dart';
import 'package:newafest/widgets/custom_header.dart';
import '../../widgets/custom_add_recipe/custom_add_button.dart';

class AddRecipe2 extends StatefulWidget {
  const AddRecipe2({super.key});

  @override
  State<AddRecipe2> createState() => _AddRecipe2State();
}

class _AddRecipe2State extends State<AddRecipe2> {
  final List<Map<String, String>> _ingredientsList = [];
  final TextEditingController _ingredientController = TextEditingController();
  final TextEditingController _quantityController = TextEditingController();

  final OutlineInputBorder border = const OutlineInputBorder(
    borderSide: BorderSide(
      width: 1.5,
      style: BorderStyle.solid,
      color: Colors.grey,
    ),
    borderRadius: BorderRadius.all(Radius.circular(5)),
  );

  Widget _ingredientTextField() {
    return TextField(
      controller: _ingredientController,
      maxLines: 1,
      style: const TextStyle(
        fontSize: 14,
        fontFamily: "Poppins",
        fontWeight: FontWeight.w400,
      ),
      decoration: InputDecoration(
        labelText: "Ingredient",
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

  Widget _quantityTextField() {
    return TextField(
      controller: _quantityController,
      maxLines: 1,
      style: const TextStyle(
        fontSize: 14,
        fontFamily: "Poppins",
        fontWeight: FontWeight.w400,
      ),
      decoration: InputDecoration(
        labelText: "Quantity",
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

  void _addIngredient() {
    final ingredient = _ingredientController.text.trim();
    final quantity = _quantityController.text.trim();

    if (ingredient.isNotEmpty && quantity.isNotEmpty) {
      setState(() {
        _ingredientsList.add({'ingredient': ingredient, 'quantity': quantity});
        _ingredientController.clear();
        _quantityController.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(

          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomHeader(title: 'Add Ingredients', route: '/add_recipe'),

              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Ingredients",
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          fontFamily: "Poppins",
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 15),
                      _ingredientTextField(),
                      const SizedBox(height: 15),
                      _quantityTextField(),
                      const SizedBox(height: 15),
                      CustomOutlinedAddButton(
                        icon: const Icon(Icons.add),
                        text: "Add Ingredient",
                        onPressed: _addIngredient,
                      ),
                      const SizedBox(height: 15),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: _ingredientsList.length,
                        itemBuilder: (context, index) {
                          final ingredient = _ingredientsList[index];
                          return Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey, width: 1), // Border color and width
                              borderRadius: BorderRadius.circular(5), // Optional rounded corners
                              color: Colors.white, // Optional background color
                            ),
                            margin: const EdgeInsets.symmetric(vertical: 5), // Spacing between tiles
                            child: ListTile(
                              title: Text(
                                ingredient['ingredient']!,
                                style: const TextStyle(
                                  fontFamily: "Poppins",
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              subtitle: Text(
                                "Quantity: ${ingredient['quantity']!}",
                                style: const TextStyle(
                                  fontFamily: "Poppins",
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                              trailing: IconButton(
                                icon: const Icon(Icons.delete, color: Colors.red),
                                onPressed: () {
                                  setState(() {
                                    _ingredientsList.removeAt(index);
                                  });
                                },
                              ),
                            ),
                          );

                        },
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),

                child: CustomButton(
                  onPressed: () {
                    final Map<String, dynamic>? data =
                    ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;


                    if (data != null) {
                      final combinedData = {
                        'foodName': data['foodName'],
                        'category': data['category'] ?? '',
                        'slider': data['_currentValue'] ?? '',
                        'description': data['description'] ?? '',
                        'duration': data['duration'],
                        'image':data['image'],
                        'ingredients': _ingredientsList,
                      };

                      Navigator.pushNamed(context, "/add_recipe3", arguments: combinedData);
                    }
                  },
                  txt1: "Continue",
                  bg: const Color(0xff701714),
                  textColor: Colors.white,

                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
