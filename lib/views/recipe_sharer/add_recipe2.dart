import 'package:flutter/material.dart';
import 'package:newafest/widgets/custom_button.dart';
import 'package:newafest/widgets/custom_social_icon.dart';

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

  Widget _steps() {
    return TextField(
      minLines: 1,
      maxLines: null,
      style: const TextStyle(
        fontSize: 14,
        fontFamily: "Poppins",
        fontWeight: FontWeight.w400,
      ),
      decoration: InputDecoration(
        labelText: "First Step",
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
          padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 8),
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
              _ingredient(),
              const SizedBox(height: 15),
              _quantity(),
              const SizedBox(height: 15),
              CustomOutlinedButton(
                  icon: const Icon(Icons.add),
                  text: "Ingredients",
                  onPressed: () {}),
              const SizedBox(height: 15),
              const Text(
                "Steps",
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  fontFamily: "Poppins",
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 15),
              _steps(),
              const SizedBox(height: 15),
              CustomOutlinedButton(
                  icon: const Icon(Icons.add), text: "Steps", onPressed: () {}),
              CustomButton(
                  txt1: "Save",
                  bg: const Color(0xff701714),
                  textColor: Colors.white,
                  onPressed: () {},
                ),
                ],
          ),
        ),
      ),
    );
  }
}
