import 'package:flutter/material.dart';
import 'package:newafest/widgets/custom_button.dart';

import '../../widgets/custom_add_recipe/custom_add_button.dart';

class AddRecipe2 extends StatefulWidget {
  const AddRecipe2({super.key});

  @override
  State<AddRecipe2> createState() => _AddRecipe2State();
}

class _AddRecipe2State extends State<AddRecipe2> {
  final OutlineInputBorder border = const OutlineInputBorder(
    borderSide: BorderSide(
      width: 1.5,
      style: BorderStyle.solid,
      color: Colors.grey,
    ),
    borderRadius: BorderRadius.all(Radius.circular(5)),
  );

  Widget _ingredient() {
    return TextField(
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

  Widget _quantity() {
    return TextField(
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                  child: SingleChildScrollView(
                child: Column(
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
                    _ingredient(),
                    const SizedBox(height: 15),
                    _quantity(),
                    const SizedBox(height: 15),
                    CustomOutlinedAddButton(
                        icon: const Icon(Icons.add),
                        text: "Ingredients",
                        onPressed: () {}),
                  ],
                ),
              )),
              CustomButton(
                txt1: "Continue",
                bg: const Color(0xff701714),
                textColor: Colors.white,
                onPressed: () {
                  Navigator.pushNamed(context, "/add_recipe3");
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
