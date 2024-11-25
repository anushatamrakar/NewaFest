import 'package:flutter/material.dart';
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
      body: SafeArea(child:  Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.only(left:10),
              child:const Column( children: [CustomOpening(),
              Text("Newari feast and festivals", style: TextStyle(
                fontFamily: "Poppins",
                fontSize: 25,
                fontWeight: FontWeight.w400,
                color: Colors.white,
              ),)],),)
          ],
        ),
      ),)
    );
  }
}
