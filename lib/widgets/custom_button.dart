import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String txt1;
  final Color bg, textColor;
  final VoidCallback onPressed;

  const CustomButton({
    super.key,
    required this.txt1,
    required this.bg,
    required this.textColor,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        foregroundColor: textColor,
        backgroundColor: bg,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(4)),
        ),
        minimumSize: const Size(double.infinity, 40),
      ),
      child: Text(
        txt1,
        style: TextStyle(
          color: textColor,
          fontSize: 16,
          fontFamily: "Poppins",
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
