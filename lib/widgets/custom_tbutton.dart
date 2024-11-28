import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  final String text, btn_1;
  final VoidCallback onPressed;

  const CustomTextButton({
    super.key,
    required this.text,
    required this.onPressed, required this.btn_1,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text,
          style: const TextStyle(
            fontSize: 12,
            fontFamily: "Poppins",
            fontWeight: FontWeight.w400,
            color: Colors.grey,
          ),
        ),
        TextButton(
          onPressed: onPressed,
          style: TextButton.styleFrom(
            padding: EdgeInsets.zero,
          ),
          child: Text(
            btn_1,
            style: const TextStyle(
              fontSize: 12,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}
