import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:newafest/services/recipe_sharer.dart';
import 'package:newafest/utility/display_message.dart';
import 'package:newafest/utility/loader.dart';
import 'package:newafest/widgets/custom_app_header.dart';
import 'package:newafest/widgets/custom_button.dart';

class EditProfile extends StatefulWidget {
  final Map<String, dynamic>? userData;
  const EditProfile({super.key, this.userData});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _fullnameController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final picker = ImagePicker();
  File? _image;
  String _base64Image = "";
  bool isLoading = false;
  bool obscureText = true;

  final border = const OutlineInputBorder(
    borderSide: BorderSide(
      width: 1.5,
      style: BorderStyle.solid,
      color: Colors.grey,
    ),
    borderRadius: BorderRadius.all(Radius.circular(5)),
  );

  @override
  void initState() {
    super.initState();
    if (widget.userData != null) {
      _fullnameController.text = widget.userData!['fullName'] ?? '';
      _usernameController.text = widget.userData!['username'] ?? '';
      _emailController.text = widget.userData!['email'] ?? '';
      _phoneController.text = widget.userData!['phone'] ?? '';
      _passwordController.text = widget.userData!['password'] ?? '';
    }
  }
  Future uploadImg() async {
    final XFile? pickedImage2 =
    await picker.pickImage(source: ImageSource.gallery);
    if (pickedImage2 != null) {
      final bytes = await pickedImage2.readAsBytes();
      setState(() {
        _image = File(pickedImage2.path);
        _base64Image = base64Encode(bytes);

      });
    } else {
      print('no img selected');
    }
  }


  Future<void> _updateProfile() async {
    if (_formKey.currentState!.validate()) {
      setState(() => isLoading = true);

      try {
        await RecipeService().updateChefProfile(
          context,
          widget.userData!['id'],
          {
            'email': _emailController.text.trim(),
            'password': _passwordController.text.trim(),
            'fullName': _fullnameController.text.trim(),
            'phone': _phoneController.text.trim(),
            'image': _base64Image,
            'username': _usernameController.text.trim(),
            'role':'sharer'

          },
        );

        DisplayMessage.displayMessage(
          context,
          'Account Updated Successfully',
          AlertType.success,
        );

        Navigator.pushReplacementNamed(context, '/chef_profile');
      } catch (e) {
        DisplayMessage.displayMessage(
          context,
          'Error updating profile: $e',
          AlertType.error,
        );
      } finally {
        setState(() => isLoading = false);
      }
    }
  }

  Widget profilePicture() {
    final base64Image =
        widget.userData?['image'] ?? ''; // Use the correct key here

    Uint8List? imageBytes;
    if (base64Image.isNotEmpty) {
      try {
        imageBytes = base64Decode(base64Image);
      } catch (e) {
        print("Error decoding Base64: $e");
        imageBytes = null;
      }
    }
    return Column(
      children: [
        Stack(
          children: [
            CircleAvatar(
              radius: 50,
              foregroundImage:
              imageBytes != null ? MemoryImage(imageBytes) : const AssetImage('assets/bara.jpg') as ImageProvider,
              backgroundColor: Colors.grey[200],
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: GestureDetector(
                onTap: uploadImg,
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

  Widget textField({
    required String label,
    required TextEditingController controller,
    TextInputType keyboardType = TextInputType.text,
    String? Function(String?)? validator,
    bool obscureText = false,
    Widget? suffixIcon,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
      validator: validator,
      style: const TextStyle(
        fontSize: 15,
        fontFamily: "Poppins",
        fontWeight: FontWeight.w400,
      ),
      decoration: InputDecoration(
        labelText: label,
        filled: true,
        fillColor: Colors.white,
        suffixIcon: suffixIcon,
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
    return isLoading? const NewaFestLoader() :Scaffold(
      body: Column(
        children: [
          const CustomAppHeader(title: 'Edit Profile'),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(28),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    profilePicture(),
                    const SizedBox(height: 20),
                    textField(
                      label: "Full Name",
                      controller: _fullnameController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your full name';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 15),
                    textField(
                      label: "Username",
                      controller: _usernameController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your username';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 15),
                    textField(
                      label: "Email",
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email';
                        }
                        if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                          return 'Enter a valid email';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 15),
                    textField(
                      label: "Phone Number",
                      controller: _phoneController,
                      keyboardType: TextInputType.phone,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your phone number';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 15),
                    textField(
                      label: "Password",
                      controller: _passwordController,
                      obscureText: obscureText,
                      suffixIcon: IconButton(
                        icon: Icon(
                          obscureText ? Icons.visibility_off_outlined : Icons.visibility_outlined,
                        ),
                        onPressed: () {
                          setState(() => obscureText = !obscureText);
                        },
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 25),
                    CustomButton(txt1: 'Update Profile', bg: const Color(0xff701714), textColor: Colors.white, onPressed: _updateProfile),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
