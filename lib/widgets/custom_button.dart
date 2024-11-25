import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  final String txt1;

  const CustomButton({super.key, required this.txt1});

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        // Implement button action or dynamic changes here
      },
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: const Color(0xff701714),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(4)),
        ),
        minimumSize: const Size(double.infinity, 40),
      ),
      child: Text(
        widget.txt1,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontFamily: "Poppins",
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
