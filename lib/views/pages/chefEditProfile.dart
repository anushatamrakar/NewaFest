import 'package:flutter/material.dart';

class ChefEditProfilePage extends StatefulWidget {
  const ChefEditProfilePage({Key? key}) : super(key: key);

  @override
  _ChefEditProfilePageState createState() => _ChefEditProfilePageState();
}

class _ChefEditProfilePageState extends State<ChefEditProfilePage> {
  int _selectedTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.arrow_back),
        actions: const [Icon(Icons.more_vert)],
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        children: [
          // Profile picture and name
          const Center(
            child: Column(
              children: [
                const CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage('kiki.jpg'),
                ),
                const SizedBox(height: 10),
                const Text(
                  "Krisha Maharjan",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          // Message and Follow buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Message button
              ElevatedButton.icon(
                onPressed: () {
                  // Handle message button action
                  print("Add recipe button pressed");
                },
                icon: const Icon(Icons.add),
                label: const Text("Add recipe"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                    side: const BorderSide(color: Colors.red),
                  ),
                ),
              ),
              const SizedBox(width: 15),
              // Follow/Unfollow button
              ElevatedButton(
                onPressed: () {
                  setState(() {
                  });
                },
                child: const Text("Edit Profile"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                    side: const BorderSide(color: Colors.red),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          // Tabs
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildTab("ABOUT", 0),
              _buildTab("RECIPES", 1),
              _buildTab("REVIEWS", 2),
            ],
          ),
          const SizedBox(height: 10),
          // Tab content
          Expanded(
            child: _buildTabContent(),
          ),
        ],
      ),
    );
  }

  // Helper method to build tabs
  Widget _buildTab(String title, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedTabIndex = index;
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        child: Column(
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: _selectedTabIndex == index ? FontWeight.bold : FontWeight.normal,
                color: _selectedTabIndex == index ? Colors.red : Colors.grey,
              ),
            ),
            if (_selectedTabIndex == index)
              Container(
                margin: const EdgeInsets.only(top: 5),
                height: 2,
                width: 30,
                color: Colors.red,
              )
          ],
        ),
      ),
    );
  }

  // Helper method to build tab content
  Widget _buildTabContent() {
    switch (_selectedTabIndex) {
      case 0:
        return const Padding(
          padding: EdgeInsets.all(20),
          child: Text(
            "A dedicated chef with a love for preserving and sharing the rich culinary heritage of Newari cuisine. Specializing in authentic recipes.",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 14, color: Colors.black54),
          ),
        );
      case 1:
        return const Center(child: Text("Recipes content coming soon!"));
      case 2:
        return const Center(child: Text("Reviews content coming soon!"));
      default:
        return Container();
    }
  }
}
