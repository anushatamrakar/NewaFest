import 'package:flutter/material.dart';

class MyAccount extends StatefulWidget {
  const MyAccount({super.key});

  @override
  State<MyAccount> createState() => _MyAccountState();
}

class _MyAccountState extends State<MyAccount> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: Column(
            children: [
              const SizedBox(height: 30),
              const CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/bara.jpg'),
              ),
              const SizedBox(height: 20),
              const Text(
                "Anusha Tamrakar",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Poppins',
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 5),
              const Text(
                "anushatamrakar",
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: 'Poppins',
                  color: Colors.black54,
                ),
              ),
              const SizedBox(height: 30),
              _buildMenuOption(
                icon: Icons.edit,
                title: "Edit account",
                onTap: () {
                },
              ),
              const SizedBox(height: 24),
              _buildMenuOption(
                icon: Icons.settings,
                title: "Settings",
                onTap: () {
                },
              ),
              const SizedBox(height: 24),
              _buildMenuOption(
                icon: Icons.help_outline,
                title: "Help and support",
                onTap: () {
                },
              ),
              const SizedBox(height: 24),
              _buildMenuOption(
                icon: Icons.logout,
                title: "Log out",
                onTap: () {
                },
              ),
            ],
          ),
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
    );
  }
}
