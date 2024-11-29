import 'package:flutter/material.dart';
class CustomButton extends StatelessWidget {
  final String txt1;
  const CustomButton({super.key, required this.txt1, required Color bg, required Color textColor, required Null Function() onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: const Color(0xff701714),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(4)),
            ),
            minimumSize: const Size(double.infinity,40)
        ),
        child: Text(
          txt1,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontFamily: "Poppins",
            fontWeight: FontWeight.w600,
          ),
        ));
  }
}
