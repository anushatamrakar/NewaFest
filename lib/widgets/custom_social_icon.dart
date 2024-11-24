import 'package:flutter/material.dart';

class CustomOutlinedButton extends StatelessWidget {
  final Icon icon;
  final String text;
  final VoidCallback onPressed;
  final Color textColor;


  const CustomOutlinedButton({
    super.key,
    required this.icon,
    required this.text,
    required this.onPressed,
    this.textColor = Colors.black,

  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      onPressed: onPressed,
      icon: icon,
      label: Text(
        text,
        style: TextStyle(
          color: textColor,
          fontFamily: 'Poppins',
          fontSize: 12,
          fontWeight: FontWeight.w400,
        ),
      ),
      style: OutlinedButton.styleFrom(
        foregroundColor: textColor,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(5)),
        ),
        fixedSize: const Size(double.infinity, 30),
      ),
    );
  }
}
