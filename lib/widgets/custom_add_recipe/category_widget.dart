import 'package:flutter/material.dart';

class CustomCategoryButton extends StatefulWidget {
  final VoidCallback onPressed;
  final Icon icon;
  final String txt1;
  const CustomCategoryButton({super.key, required this.onPressed, required this.icon, required this.txt1});

  @override
  State<CustomCategoryButton> createState() => _CustomCategoryButtonState();
}

class _CustomCategoryButtonState extends State<CustomCategoryButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: widget.onPressed,
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: const Color(0xff701714),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        fixedSize: const Size(double.infinity, 40),
      ),
      icon: widget.icon,
      label: Text(
        widget.txt1,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 13,
          fontFamily: "Poppins",
          fontWeight: FontWeight.w600,
        ),
      ),
    );;
  }
}
