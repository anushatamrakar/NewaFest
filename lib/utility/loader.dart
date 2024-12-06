import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class NewaFestLoader extends StatelessWidget {
  const NewaFestLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xff701714),
      child: Center(
          child: Container(
            padding: const EdgeInsets.only(bottom: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/applogo.png',
                  width: 220,
                  height: 220,
                ),
                const SizedBox(height:20),
                const SpinKitChasingDots(color: Colors.white54, size: 40.0)
              ],
            ),
          )),
    );
  }
}