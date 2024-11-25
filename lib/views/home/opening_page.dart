import 'package:flutter/material.dart';
import 'package:newafest/widgets/custom_opening.dart';

class OpeningPage extends StatelessWidget {
  const OpeningPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff701714),
      resizeToAvoidBottomInset: false,
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

