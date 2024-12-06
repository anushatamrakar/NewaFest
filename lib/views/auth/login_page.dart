import 'package:flutter/material.dart';
import 'package:newafest/services/authentication.dart';
import 'package:newafest/utility/loader.dart';
import 'package:newafest/validator/validation.dart';
import 'package:newafest/widgets/custom_banner.dart';
import 'package:newafest/widgets/custom_button.dart';
import 'package:newafest/widgets/custom_tbutton.dart';

import '../../widgets/custom_divider.dart';
import '../../widgets/custom_social_icon.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final String text1 = "Sign in";
  final String text2 = "Sign in to your account";
  final _formKey = GlobalKey<FormState>();
  String email='';
  String password='';
  String? passErr, emailErr;
  final Authentication _auth= Authentication();
  final OutlineInputBorder border = const OutlineInputBorder(
    borderSide: BorderSide(
      width: 1.5,
      style: BorderStyle.solid,
      color: Colors.grey,
    ),
    borderRadius: BorderRadius.all(Radius.circular(5)),
  );
 bool isDone=false;
 bool isLoading=false;
  Widget _email() {
    return TextField(
      style: const TextStyle(
        fontSize: 15,
        fontFamily: "Poppins",
        fontWeight: FontWeight.w400,
      ),
      onChanged: (value){
        setState(() {
          email=value;
        });
      },
      decoration: InputDecoration(
        labelText: "Email or Phone",
        filled: true,
        helperText: isDone ? SignUpValidation.validateEmailAddress(email) : null,
        helperStyle: const TextStyle(
            color: Colors.red,
            fontFamily: 'poppins',
            fontStyle: FontStyle.italic),
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

  Widget _password() {
    return TextField(
      obscureText: true,
      style: const TextStyle(
        fontSize: 15,
        fontFamily: "Poppins",
        fontWeight: FontWeight.w400,
      ),
      onChanged: (value){
        setState(() {
          password=value;
        });
      },
      decoration: InputDecoration(
        labelText: "Password",
        filled: true,
        helperText: isDone ? SignUpValidation.validatePassword(password) : null,
        helperStyle: const TextStyle(
            color: Colors.red,
            fontFamily: 'poppins',
            fontStyle: FontStyle.italic),
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
    return isLoading? const NewaFestLoader():  Scaffold(
        resizeToAvoidBottomInset: true,
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(0),
            child: Form(
              key: _formKey,
              child: Container(
                width: double.infinity,
                child: Column(
                  children: [
                    CustomBanner(text1: text1, text2: text2),
                    Padding(
                      padding: const EdgeInsets.all(28),
                      child: Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(0),
                            child: Column(
                              children: [
                                _email(),
                                const SizedBox(height: 25),
                                _password(),
                              ],
                            ),
                          ),
                          const SizedBox(height: 15),
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
                            ],
                          ),
                          const SizedBox(height: 15),
                          CustomButton(txt1: "Login", bg: const Color(0xff701714), textColor: Colors.white, onPressed: () async {
                            setState(() {
                              isDone = true;
                            });
                            if (_formKey.currentState!.validate()) {
                              setState(() {
                                isLoading = true;
                              });
                              dynamic result = await _auth
                                  .signIn(
                                  context, email, password);
                              if (result == null) {
                                setState(() {
                                  isLoading = false;
                                });
                              } else {
                                setState(() {
                                  isLoading = false;
                                });
                                Navigator.pushNamed(
                                    context, '/wrapper');
                              }
                            }
                          }),
                          const SizedBox(height: 15),
                          const CustomDivider(divider1: "or login with"),
                          const SizedBox(height: 15),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomOutlinedButton(
                                icon: const Icon(Icons.facebook),
                                text: 'Google',
                                onPressed: () {},
                                textColor: Colors.black,
                              ),
                              const SizedBox(width: 25),
                              CustomOutlinedButton(
                                icon: const Icon(Icons.facebook),
                                text: 'Facebook',
                                onPressed: () {},
                                textColor: Colors.blueGrey,
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          CustomTextButton(
                            text: "Don't have an account?",
                            onPressed: () {
                              Navigator.pushNamed(context, "/home");
                            },
                            btn_1: "Sign up",
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
