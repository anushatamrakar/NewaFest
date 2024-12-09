import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:newafest/controller/chef_controller.dart';
import 'package:newafest/models/user_model.dart';
import 'package:newafest/services/authentication.dart';
import 'package:newafest/utility/display_message.dart';
import 'package:newafest/views/recipe_sharer/general_edit_profile.dart';
import 'package:newafest/widgets/custom_app_header.dart';
import 'package:provider/provider.dart';

class MyAccount extends StatefulWidget {
  const MyAccount({super.key});

  @override
  State<MyAccount> createState() => _MyAccountState();
}

class _MyAccountState extends State<MyAccount> {
  bool isLoadingUser = true;
  Map<String, dynamic>? userData;

  @override
  void initState() {
    super.initState();
    fetchUserData();
  }

  Future<void> fetchUserData() async {
    try {
      final user = Provider.of<UserModel?>(context, listen: false);
      if (user != null) {
        final data = await ChefController().getUserData(user.uid);
        print(data);
        setState(() {
          userData = data.isNotEmpty ? data[0]['user'] : null;
          isLoadingUser = false;
        });
      }
    } catch (e) {
      print("Error fetching user data: $e");
      setState(() {
        isLoadingUser = false;
      });
    } finally {
      setState(() {
        isLoadingUser = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final base64Image = userData?['image'] ?? '';
    Uint8List? imageBytes;

    if (base64Image.isNotEmpty) {
      try {
        imageBytes = base64Decode(base64Image);
      } catch (e) {
        print("Error decoding Base64: $e");
      }
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: isLoadingUser
            ? const Center(child: CircularProgressIndicator())
            : Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const CustomAppHeader(title: 'My Account'),
            const SizedBox(height: 30),
            CircleAvatar(
              foregroundImage: imageBytes != null
                  ? MemoryImage(imageBytes)
                  : const AssetImage('assets/applogo.png'),
              maxRadius: 50,
            ),
            const SizedBox(height: 20),
            Text(
              userData?['fullName'] ?? "Unknown User",
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                fontFamily: 'Poppins',
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              userData?['email'] ?? "No email available",
              style: const TextStyle(
                fontSize: 14,
                fontFamily: 'Poppins',
                color: Colors.black54,
              ),
            ),
            const SizedBox(height: 30),
            _buildMenuOption(
              icon: Icons.edit,
              title: "Edit Account",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => GeneralEditProfile(userData:userData),
                  ),
                );
              },
            ),
            const Divider(height: 24, thickness: 1),
            _buildMenuOption(
              icon: Icons.settings,
              title: "Settings",
              onTap: () {
                // Navigate to settings page
              },
            ),
            const Divider(height: 24, thickness: 1),
            _buildMenuOption(
              icon: Icons.help_outline,
              title: "Help and Support",
              onTap: () {
                // Navigate to help and support page
              },
            ),
            const Divider(height: 24, thickness: 1),
            _buildMenuOption(
              icon: Icons.logout,
              title: "Log Out",
              onTap: ()async {
                await Authentication()
                    .signOut(context);
                DisplayMessage.displayMessage(
                  context,
                  "Logout successfull",
                  AlertType.success,
                );},
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuOption({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[200],
                shape: BoxShape.circle,
              ),
              padding: const EdgeInsets.all(10),
              child: Icon(
                icon,
                color: Colors.black87,
              ),
            ),
            const SizedBox(width: 20),
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                fontFamily: 'Poppins',
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
