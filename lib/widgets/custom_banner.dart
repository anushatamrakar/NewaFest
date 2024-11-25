import 'package:flutter/material.dart';

class CustomBanner extends StatefulWidget {
  final String text1;
  final String text2;

  // Constructor to accept the text1 and text2 values
  const CustomBanner({
    super.key,
    required this.text1,
    required this.text2,
  });

  @override
  State<CustomBanner> createState() => _CustomBannerState();
}

class _CustomBannerState extends State<CustomBanner> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(0),
      width: double.infinity,
      height: 220,
      child: Stack(
        children: [
          const Image(
            image: AssetImage('assets/logobg.jpeg'),
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Positioned(
            bottom: 50,
            left: 20,
            child: Text(
              widget.text1,  // Access the text values from the widget
              style: const TextStyle(
                color: Colors.white,
                fontSize: 50,
                fontWeight: FontWeight.w600,
                fontFamily: "Poppins",
              ),
            ),
          ),
          Positioned(
            bottom: 30,
            left: 20,
            child: Text(
              widget.text2,  // Access the text values from the widget
              style: const TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.w400,
                fontFamily: "Poppins",
              ),
            ),
          ),
        ],
      ),
    );
  }
}
