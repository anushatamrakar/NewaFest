import 'package:flutter/material.dart';

class CustomOutlinedAddButton extends StatefulWidget {
  final Icon icon;
  final String text;
  final VoidCallback onPressed;
  final Color textColor;

  const CustomOutlinedAddButton({
    super.key,
    required this.icon,
    required this.text,
    required this.onPressed,
    this.textColor = Colors.black,
  });

  @override
  State<CustomOutlinedAddButton> createState() => _CustomOutlinedAddButtonState();
}

class _CustomOutlinedAddButtonState extends State<CustomOutlinedAddButton> {
  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      onPressed: widget.onPressed,
      icon: widget.icon,
      label: Text(
        widget.text,
        style: const TextStyle(
          color: Colors.black,
          fontFamily: 'Poppins',
          fontSize: 12,
          fontWeight: FontWeight.w400,
        ),
      ),
      style: OutlinedButton.styleFrom(
        foregroundColor: widget.textColor,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(5)),
        ),
        minimumSize: const Size(double.infinity, 40),
      ),
    );
  }
}
