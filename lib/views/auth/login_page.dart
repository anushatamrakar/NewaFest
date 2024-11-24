import 'package:flutter/material.dart';
import 'package:newafest/widgets/custom_banner.dart';

class LoginPage extends StatelessWidget {
  final text1 = "Sign in";
  final text2 = "Sign in to your account";
  const LoginPage({super.key});
  final border = const OutlineInputBorder(
    borderSide: BorderSide(
      width: 1.5,
      style: BorderStyle.solid,
      color: Colors.grey,
    ),
    borderRadius: BorderRadius.all(Radius.circular(5)),
  );

  //initialising email textfield
  Widget _email(){
    return TextField(
      style: const TextStyle(
        fontSize: 15,
        fontFamily: "Poppins",
        fontWeight: FontWeight.w400,
      ),
      decoration: InputDecoration(
        labelText: "Email or Phone",
        filled: true,
        fillColor: Colors.white,
        focusedBorder: border,
        enabledBorder: border,
        labelStyle: const TextStyle(
          color: Colors.grey,
          fontSize: 15,
          fontFamily: "Poppins",
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }

  //initialising password text field
  Widget _password() {
    return TextField(
      style: const TextStyle(
        fontSize: 15,
        fontFamily: "Poppins",
        fontWeight: FontWeight.w400,
      ),
      decoration: InputDecoration(
        labelText: "Password",
        filled: true,
        fillColor: Colors.white,
        suffixIcon: const Icon(Icons.visibility_off_outlined),
        focusedBorder: border,
        enabledBorder: border,
        labelStyle: const TextStyle(
          color: Colors.grey,
          fontSize: 15,
          fontFamily: "Poppins",
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      padding: const EdgeInsets.all(0),
      width: double.infinity,
      child: Column(
        //mainAxisAlignment: MainAxisAlignment.,
        //crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          CustomBanner(text1: text1, text2: text2),
          Container(
            //Textfield start
            padding: const EdgeInsets.all(28),
            child: Column(
              children: [_email(), const SizedBox(height: 30), _password()],
            ),
          ),
         const Row(
            mainAxisAlignment:  MainAxisAlignment.end,
            children:[  Text("Forgot Password?", style: TextStyle(
              fontSize: 8,
              fontWeight: FontWeight.w400,
              fontFamily: "Poppins",
              color: Colors.grey,
            ),),
          ])
        ],
      ),
    ));
  }
}
