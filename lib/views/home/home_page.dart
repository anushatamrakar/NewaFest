import 'package:flutter/material.dart';
import 'package:newafest/widgets/custom_button.dart';
import 'package:newafest/widgets/custom_opening.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff701714),
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child:
        Container(
          margin: const EdgeInsets.only(left: 10),
          padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.all(0),
              ),
              const Column(
                children: [
                  CustomOpening(),
                  SizedBox(height: 25),
                  Text(
                    "Newari feasts and festival",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: "Poppins",
                      fontSize: 25,
                      fontWeight: FontWeight.w400,
                      color: Colors.white70,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
              Column(
                children: [
                  CustomButton(txt1: "Join as Chef", bg: Colors.white, textColor: const Color(0xff701714), onPressed: () { Navigator.pushNamed(context, "/sharer_register"); },),
                  CustomButton(txt1: "Explore recipes", bg: Colors.white, textColor: const Color(0xff701714), onPressed: () { Navigator.pushNamed(context, "/register"); },)
                ],
              )],
          ),
        ),

      ),
    );
  }
}