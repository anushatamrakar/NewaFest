import 'package:flutter/material.dart';
import 'package:newafest/services/authentication.dart';
import 'package:newafest/utility/loader.dart';
import 'package:newafest/validator/validation.dart';
import 'package:newafest/widgets/custom_banner.dart';
import 'package:newafest/widgets/custom_button.dart';
import 'package:newafest/widgets/custom_divider.dart';
import '../../widgets/custom_social_icon.dart';
import '../../widgets/custom_tbutton.dart';

class UserRegistration extends StatefulWidget {
  const UserRegistration({super.key});

  @override
  State<UserRegistration> createState() => _UserRegistrationState();
}

class _UserRegistrationState extends State<UserRegistration> {
  final OutlineInputBorder border = const OutlineInputBorder(
    borderSide: BorderSide(
      width: 1.5,
      style: BorderStyle.solid,
      color: Colors.grey,
    ),
    borderRadius: BorderRadius.all(Radius.circular(5)),
  );
 String fullName='',phone='',emailId='',passcode='';
  final Authentication _auth= Authentication();
  final _formKey = GlobalKey<FormState>();
bool isDone=false,isLoading=false;
  Widget name() {
    return TextField(
      onChanged: (e){setState(() {
        fullName=e;
      });},
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
      style: const TextStyle(
        fontSize: 15,
        fontFamily: "Poppins",
        fontWeight: FontWeight.w400,
      ),
      onChanged: (e){setState(() {
        phone=e;
      });},
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
        helperText: isDone ? SignUpValidation.validateEmailAddress(emailId) : null,
        helperStyle: const TextStyle(
            color: Colors.red,
            fontFamily: 'poppins',
            fontStyle: FontStyle.italic),
        focusedBorder: border,
        enabledBorder: border,
        labelStyle: const TextStyle(
          color: Colors.grey,
          fontSize: 15,
          fontFamily: "Poppins",
          fontWeight: FontWeight.w400,
        ),
      ),
      onChanged: (e){setState(() {
        emailId=e;
      });},
    );
  }

  Widget _password() {
    return TextField(
      onChanged: (e){setState(() {
        passcode=e;
      });},
      obscureText: true,
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
    return isLoading ? const NewaFestLoader() :Scaffold(
      body:SafeArea(child: SingleChildScrollView(
        padding: const EdgeInsets.all(0),
        child:  Container(
          width: double.infinity,
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const CustomBanner(text1: "Sign up", text2: "Create your own account"),
                Padding(
                  padding: const EdgeInsets.all(28),
                  child: Column(
                    children: [
                      name(),
                      const SizedBox(height: 15),
                      number(),
                      const SizedBox(height: 15),
                      _email(),
                      const SizedBox(height: 15),
                      _password(),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 28, left: 28),
                  child: CustomButton(txt1: "Sign up",bg: const Color(0xff701714), textColor: Colors.white, onPressed:   () async {
                    setState(() {
                      isDone = true;
                    });
                    if (_formKey.currentState!.validate()) {
                      setState(() {
                        isLoading = true;
                      });
                      dynamic result = await _auth
                          .registrationProcess(context, emailId, passcode, fullName, phone, 'customer', '', emailId, '');

                      setState(() {
                        isLoading = false;
                      });
                      Navigator.pushReplacementNamed(
                          context, '/login');
                    }
                  }),
                ),
                const SizedBox(height: 15),
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
                      textColor: Colors.blueGrey,
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                CustomTextButton(text: "Already have an account?", onPressed: (){
                  Navigator.pushNamed(context, "/login");
                }, btn_1: "Login",)
              ],
            ),
          ),
        ),
      )),
    );
  }
}
