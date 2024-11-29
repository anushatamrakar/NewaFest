import 'package:flutter/material.dart';
import 'dart:async';

import '../../widgets/custom_opening.dart';

class OpeningPage extends StatefulWidget {
  const OpeningPage({super.key});

  @override
  State<OpeningPage> createState() => _OpeningPageState();
}

class _OpeningPageState extends State<OpeningPage> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, '/login');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF701714),
      body: SafeArea(
        child: Center(
          child: Container(
            margin: const EdgeInsets.only(bottom:130),
            child:const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomOpening(),
                SizedBox(height: 20), // Add spacing between widgets
                Text(
                  "NewaFest",
                  style: TextStyle(
                    fontFamily: "Poppins",
                    fontSize: 40,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ],
            ) ,
          ),
        ),
      ),
    );
  }
}