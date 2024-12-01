import 'package:flutter/material.dart';
import 'package:newafest/widgets/custom_banner.dart';
import 'package:newafest/widgets/custom_button.dart';

import '../../widgets/custom_divider.dart';
import '../../widgets/custom_social_icon.dart';

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
  Widget _email() {
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
          Padding(
              padding: const EdgeInsets.all(28),
              child: Column(
                children: [
                  Container(
                    //Textfield start
                    padding: const EdgeInsets.all(0),
                    child: Column(
                      children: [
                        _email(),
                        const SizedBox(height: 25),
                        _password()
                      ],
                    ),
                  ),
                  const SizedBox(height:15),
                  const Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "Forgot Password?",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            fontFamily: "Poppins",
                            color: Colors.grey,
                          ),
                        ),
                      ]),
                  const SizedBox(height:15),
                  const CustomButton(txt1: "Login"),
                  const SizedBox(height:15),
                  const CustomDivider(divider1: "or login with"),
                  const SizedBox(height:15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomOutlinedButton(icon: const Icon(Icons.facebook), text: 'Google',onPressed: (){}, textColor: Colors.black, ),
                      const SizedBox(width:25),
                      CustomOutlinedButton(icon: const Icon(Icons.facebook), text: 'Facebook',onPressed: (){}, textColor: Colors.blue,)
                    ],
                  )
                 ],
              ))
        ],
      ),
    ));
  }
}
