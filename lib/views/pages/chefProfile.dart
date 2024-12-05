import 'package:flutter/material.dart';

class ChefProfilePage extends StatefulWidget {
  const ChefProfilePage({super.key});

  @override
  State<ChefProfilePage> createState() => _ChefProfilePageState();
}

class _ChefProfilePageState extends State<ChefProfilePage> {
  int _selectedTabIndex = 0;
  bool isFollowing = false; // Tracks the Follow/Unfollow state

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
                CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage('assets/kiki.jpg'),
                ),
                SizedBox(height: 10),
                Text(
                  "Krisha Maharjan",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Poppins', // Ensured font consistency
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),

          // Followers, Following, Subscribers Section
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildProfileStat("Followers", "1.2K"),
              _divider(),
              _buildProfileStat("Subscribers", "800"),
            ],
          ),
          const SizedBox(height: 20),

          // Message, Follow, and Subscription buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Follow/Unfollow button
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    isFollowing = !isFollowing; // Toggle follow state
                  });
                },
                child: Text(isFollowing ? "Unfollow" : "Follow"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff701714),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10), // Larger padding
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                    side: const BorderSide(color: Colors.red),
                  ),
                ),
              ),
              const SizedBox(width: 15),

              // Subscription button
              ElevatedButton(
                onPressed: () {
                  // Handle subscription button action
                  print("Subscription button pressed");
                },
                child: const Text("Subscribe"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff701714),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                    side: const BorderSide(color: Colors.red),
                  ),
                ),
              ),
              const SizedBox(width: 15),

              // Message button
              ElevatedButton(
                onPressed: () {
                  // Handle message button action
                  print("Message button pressed");
                },
                child: const Icon(Icons.message),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff701714),
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
          const SizedBox(height: 30),

          // Tabs
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildTab("ABOUT", 0),
              const SizedBox(width: 35),
              _buildTab("RECIPES", 1),
              const SizedBox(width: 35),
              _buildTab("REVIEWS", 2),
            ],
          ),
          const SizedBox(height: 5),

          // Tab content
          Expanded(
            child: _buildTabContent(),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileStat(String label, String count) {
    return Column(
      children: [
        Text(
          count,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            fontFamily: 'Poppins',
          ),
        ),
        const SizedBox(height: 5),
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            color: Colors.grey,
            fontFamily: 'Poppins',
          ),
        ),
      ],
    );
  }
  // Divider between stats
  Widget _divider() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: VerticalDivider(
        thickness: 1,
        color: Colors.grey,
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
                fontFamily: 'Poppins',
                color: _selectedTabIndex == index ? const Color(0xff701714) : Colors.grey,
              ),
            ),
            if (_selectedTabIndex == index)
              Container(
                margin: const EdgeInsets.only(top: 5),
                height: 2,
                width: 30,
                color: const Color(0xff701714),
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
            style: TextStyle(
              fontSize: 14,
              color: Colors.black54,
              fontFamily: 'Poppins',
            ),
          ),
        );
      case 1:
        return const Center(child: Text("Recipes content coming soon!", style: TextStyle(fontFamily: 'Poppins')));
      case 2:
        return const Center(child: Text("Reviews content coming soon!", style: TextStyle(fontFamily: 'Poppins')));
      default:
        return Container();
    }
  }
}
