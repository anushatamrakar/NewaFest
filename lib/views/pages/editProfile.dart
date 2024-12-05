import 'package:flutter/material.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final border = const OutlineInputBorder(
    borderSide: BorderSide(
      width: 1.5,
      style: BorderStyle.solid,
      color: Colors.grey,
    ),
    borderRadius: BorderRadius.all(Radius.circular(5)),
  );

  Widget profilePicture() {
    return Column(
      children: [
        Stack(
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: const AssetImage('assets/kiki.jpg'),
              backgroundColor: Colors.grey[200],
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: GestureDetector(
                onTap: () {
                  // Action for editing the profile picture
                  print("Edit profile picture clicked");
                },
                child: Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey[300],
                  ),
                  child: const Icon(
                    Icons.camera_alt_outlined,
                    size: 20,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        const Text(
          "Change Profile Picture",
          style: TextStyle(
            fontSize: 14,
            fontFamily: "Poppins",
            fontWeight: FontWeight.w400,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }

  Widget fullNameField() {
    return TextField(
      style: const TextStyle(
        fontSize: 15,
        fontFamily: "Poppins",
        fontWeight: FontWeight.w400,
      ),
      decoration: InputDecoration(
        labelText: "Full Name",
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

  Widget usernameField() {
    return TextField(
      style: const TextStyle(
        fontSize: 15,
        fontFamily: "Poppins",
        fontWeight: FontWeight.w400,
      ),
      decoration: InputDecoration(
        labelText: "Username",
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

  Widget aboutField() {
    return TextField(
      style: const TextStyle(
        fontSize: 15,
        fontFamily: "Poppins",
        fontWeight: FontWeight.w400,
      ),
      decoration: InputDecoration(
        labelText: "About",
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

  Widget experienceField() {
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

  Widget emailField() {
    return TextField(
      style: const TextStyle(
        fontSize: 15,
        fontFamily: "Poppins",
        fontWeight: FontWeight.w400,
      ),
      decoration: InputDecoration(
        labelText: "Email",
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

  Widget phoneNumberField() {
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

  Widget passwordField() {
    bool obscureText = true;

    return StatefulBuilder(
      builder: (BuildContext context, StateSetter setState) {
        return TextField(
          obscureText: obscureText,
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
                  obscureText = !obscureText;
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

  Widget saveButton() {
    return ElevatedButton(
      onPressed: () {
        print("Save button pressed");
      },
      child: const Text("Save Changes"),
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xff701714),
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
      ),
    );
  }

  Widget logoutButton() {
    return ElevatedButton(
      onPressed: () {
        print("Logout button pressed");
      },
      child: const Text("Logout"),
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xff701714),
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(28),
        child: Column(
          children: [
            profilePicture(),
            const SizedBox(height: 20),
            fullNameField(),
            const SizedBox(height: 15),
            usernameField(),
            const SizedBox(height: 15),
            aboutField(),
            const SizedBox(height: 15),
            experienceField(),
            const SizedBox(height: 15),
            emailField(),
            const SizedBox(height: 15),
            phoneNumberField(),
            const SizedBox(height: 15),
            passwordField(),
            const SizedBox(height: 25),
            saveButton(),
            const SizedBox(height: 25),
            logoutButton(),
          ],
        ),
      ),
    );
  }
}
