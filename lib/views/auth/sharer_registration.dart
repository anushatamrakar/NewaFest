import 'package:flutter/material.dart';
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
      style: const TextStyle(
        fontSize: 15,
        fontFamily: "Poppins",
        fontWeight: FontWeight.w400,
      ),
      decoration: InputDecoration(
        labelText: "Fullname",
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

  Widget number() {
    return TextField(
      style: const TextStyle(
        fontSize: 15,
        fontFamily: "Poppins",
        fontWeight: FontWeight.w400,
      ),
      decoration: InputDecoration(
        labelText: "Phone Number",
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

  Widget password() {
    bool obscureText = true;

    return StatefulBuilder(
      builder: (BuildContext context, StateSetter setState) {
        return TextField(
          obscureText: obscureText, // Hides the password
          style: const TextStyle(
            fontSize: 15,
            fontFamily: "Poppins",
            fontWeight: FontWeight.w400,
          ),
          decoration: InputDecoration(
            labelText: "Password",
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
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
            const Padding(
              padding: EdgeInsets.only(right: 28, left: 28),
              child: CustomButton(txt1: "Sign up"),
            ),
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
    );
  }
}
