import 'package:flutter/material.dart';

class CustomOpening extends StatefulWidget {
  const CustomOpening({super.key});

  @override
  State<CustomOpening> createState() => _CustomOpeningState();
}

class _CustomOpeningState extends State<CustomOpening> {
  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: 200, // Define the width of the image
      child: const Image(
        image: AssetImage('assets/applogo.png'),
        fit: BoxFit.cover,
      ),
    );
  }
}
