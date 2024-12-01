import 'package:flutter/material.dart';
import '../../widgets/custom_add_recipe/custom_add_button.dart';
import '../../widgets/custom_button.dart';

class AddRecipe3 extends StatefulWidget {
  const AddRecipe3({super.key});

  @override
  State<AddRecipe3> createState() => _AddRecipe3State();
}

class _AddRecipe3State extends State<AddRecipe3> {
  @override
  final OutlineInputBorder border = const OutlineInputBorder(
    borderSide: BorderSide(
      width: 1.5,
      style: BorderStyle.solid,
      color: Colors.grey,
    ),
    borderRadius: BorderRadius.all(Radius.circular(5)),
  );

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

  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
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
                    CustomOutlinedAddButton(
                        icon: const Icon(Icons.add), text: "Steps", onPressed: () {}),
                    const SizedBox(height: 15),
                  ],
                ),
              ),
            ),
            CustomButton(
              txt1: "Save",
              bg: const Color(0xff701714),
              textColor: Colors.white,
              onPressed: () {},
            ),
          ],
        ),
      )),
    );
  }
}
