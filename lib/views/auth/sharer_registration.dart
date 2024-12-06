import 'package:flutter/material.dart';
import 'package:newafest/services/authentication.dart';
import 'package:newafest/utility/loader.dart';
import 'package:newafest/validator/validation.dart';
import 'package:newafest/widgets/custom_banner.dart';
import 'package:newafest/widgets/custom_button.dart';
import 'package:newafest/widgets/custom_divider.dart';
import '../../widgets/custom_social_icon.dart';

class SharerRegistration extends StatefulWidget {
  const SharerRegistration({super.key});

  @override
  State<SharerRegistration> createState() => _SharerRegistrationState();
}

class _SharerRegistrationState extends State<SharerRegistration> {
  String fullName = '',
      phone = '',
      emailId = '',
      passcode = '',
      experiences = '';
  final Authentication _auth = Authentication();
  bool isLoading = false, isDone = false;

  final _formKey = GlobalKey<FormState>();
  final border = const OutlineInputBorder(
    borderSide: BorderSide(
      width: 1.5,
      style: BorderStyle.solid,
      color: Colors.grey,
    ),
    borderRadius: BorderRadius.all(Radius.circular(5)),
  );

  Widget name() {
    return TextField(
      onChanged: (e) {
        setState(() {
          fullName = e;
        });
      },
      style: const TextStyle(
        fontSize: 15,
        fontFamily: "Poppins",
        fontWeight: FontWeight.w400,
      ),
      decoration: InputDecoration(
        labelText: "Fullname",
        filled: true,
        helperText: isDone ? SignUpValidation.validateFullName(fullName) : null,
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

  Widget number() {
    return TextField(
      onChanged: (e) {
        setState(() {
          phone = e;
        });
      },
      style: const TextStyle(
        fontSize: 15,
        fontFamily: "Poppins",
        fontWeight: FontWeight.w400,
      ),
      decoration: InputDecoration(
        labelText: "Phone Number",
        filled: true,
        helperText: isDone ? SignUpValidation.validatePhoneNumber(phone) : null,
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

  Widget email() {
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
        helperText: isDone ? SignUpValidation.validateEmailAddress(emailId) : null,
        helperStyle: const TextStyle(
            color: Colors.red,
            fontFamily: 'poppins',
            fontStyle: FontStyle.italic),
        enabledBorder: border,
        labelStyle: const TextStyle(
          color: Colors.grey,
          fontSize: 15,
          fontFamily: "Poppins",
          fontWeight: FontWeight.w400,
        ),
      ),
      onChanged: (e) {
        setState(() {
          emailId = e;
        });
      },
    );
  }

  Widget password() {
    bool obscureText = true;

    return StatefulBuilder(
      builder: (BuildContext context, StateSetter setState) {
        return TextField(
          onChanged: (e) {
            setState(() {
              passcode = e;
            });
          },
          obscureText: obscureText, // Hides the password
          style: const TextStyle(
            fontSize: 15,
            fontFamily: "Poppins",
            fontWeight: FontWeight.w400,
          ),
          decoration: InputDecoration(
            labelText: "Password",
            helperText: isDone ? SignUpValidation.validatePassword(passcode) : null,
            helperStyle: const TextStyle(
                color: Colors.red,
                fontFamily: 'poppins',
                fontStyle: FontStyle.italic),
            filled: true,
            fillColor: Colors.white,
            suffixIcon: IconButton(
              icon: Icon(
                obscureText
                    ? Icons.visibility_off_outlined
                    : Icons.visibility_outlined,
              ),
              onPressed: () {
                setState(() {
                  obscureText = !obscureText; // Toggle visibility
                });
              },
            ),
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
      },
    );
  }

  Widget experience() {
    return TextField(
      style: const TextStyle(
        fontSize: 15,
        fontFamily: "Poppins",
        fontWeight: FontWeight.w400,
      ),
      decoration: InputDecoration(
        labelText: "Experience",
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
      onChanged: (e) {
        setState(() {
          experiences = e;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return isLoading? const NewaFestLoader(): Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(0),
          child: Container(
            width: double.infinity,
            child: Column(
              children: [
                const CustomBanner(
                    text1: "Sign up", text2: "Create your own account"),
                Padding(
                  padding: const EdgeInsets.all(28),
                  child: Column(
                    children: [
                      name(),
                      const SizedBox(height: 15),
                      number(),
                      const SizedBox(height: 15),
                      email(),
                      const SizedBox(height: 15),
                      password(),
                      const SizedBox(height: 15),
                      experience(),
                    ],
                  ),
                ),
                const CustomDivider(divider1: "or Sign up with"),
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
                      textColor: Colors.blue,
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.only(right: 28, left: 28),
                  child: CustomButton(
                      txt1: "Sign up",
                      bg: const Color(0xff701714),
                      textColor: Colors.white,
                    onPressed: () async {
                      setState(() {
                        isDone = true;
                        isLoading = true;
                      });
                      print('Email ID: $emailId');
                      print('Passcode: $passcode');
                      print('Full Name: $fullName');
                      print('Phone: $phone');
                      print('Experiences: $experiences');

                      dynamic result = await _auth.registrationProcess(
                        context,
                        emailId,
                        passcode,
                        fullName,
                        phone,
                        'sharer',
                        '',
                        emailId,
                        experiences,
                      );

                      setState(() {
                        isLoading = false;
                      });
                      Navigator.pushReplacementNamed(context, '/login');
                    },

                  ),),
                const Text(
                  "Already have an account? Login",
                  style: TextStyle(
                    fontSize: 12,
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w400,
                    color: Colors.grey,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
