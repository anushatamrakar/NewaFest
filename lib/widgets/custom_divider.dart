import 'package:flutter/material.dart';
class CustomDivider extends StatelessWidget {
  final String divider1;
  const CustomDivider({super.key, required this.divider1});

  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        const Expanded(
          child: Divider(
            thickness: 1, // Line thickness
            color: Colors.grey, // Line color
            endIndent: 10, // Space between line and text
          ),
        ),
        Text(
          divider1,
          style: const TextStyle(
            color: Colors.grey, // Text color
            fontSize: 14, // Font size
          ),
        ),
        const Expanded(
          child: Divider(
            thickness: 1.5, // Line thickness
            color: Colors.grey, // Line color
            indent: 10, // Space between line and text
          ),
        ),
      ],
    );
  }
}
