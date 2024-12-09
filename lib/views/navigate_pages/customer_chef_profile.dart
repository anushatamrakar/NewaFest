import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:newafest/controller/chef_controller.dart';
import 'package:newafest/utility/loader.dart';
import 'package:newafest/views/view_recipe/view_recipe.dart';
import 'package:newafest/widgets/custom_button.dart';
import 'package:newafest/widgets/custom_header.dart';

import '../subscription/subscribe.dart';

class ChefCustomerProfilePage extends StatefulWidget {
  final String uid, route;

  const ChefCustomerProfilePage({super.key, required this.uid, required this.route});

  @override
  State<ChefCustomerProfilePage> createState() => _ChefCustomerProfilePageState();
}

class _ChefCustomerProfilePageState extends State<ChefCustomerProfilePage> {
  int _selectedTabIndex = 0;
  bool isFollowing = false;
  bool isLoading = true;
  Map<String, dynamic>? chefData;
  List<Map<String, dynamic>> chefRecipe = [];
  File? _image;
  final picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    fetchChefData();
  }

  Future<void> fetchChefData() async {
    setState(() {
      isLoading = true;
    });
    try {
      final data = await ChefController().getChefProfile(widget.uid);
      chefRecipe = await ChefController().getChefRecipes(widget.uid) ?? [];
      setState(() {
        chefData = (data.isNotEmpty && data[0]['user'] != null) ? data[0]['user'] : {};
      });
    } catch (e) {
      print("Error fetching chef data: $e");
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final base64Image = chefData?['image'] ?? '';

    Uint8List? imageBytes;
    if (base64Image.isNotEmpty) {
      try {
        imageBytes = base64Decode(base64Image);
      } catch (e) {
        print("Error decoding Base64: $e");
        imageBytes = null;
      }
    }

    return isLoading
        ? const NewaFestLoader()
        : Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            CustomHeader(
              title: chefData?['fullName'] ?? 'Unknown Chef',
              route: widget.route,
            ),
            const SizedBox(height: 50),
            Center(
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 50,
                    foregroundImage: imageBytes != null
                        ? MemoryImage(imageBytes)
                        : const AssetImage('assets/applogo.png') as ImageProvider,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    chefData?['fullName'] ?? 'Unknown Chef',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins',
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                      'Followers ',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Poppins',
                        ),
                      ),
                      const SizedBox(width: 5,),
                      Text(
                        chefData?['follower'] ?? '10',
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Poppins',
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        isFollowing = !isFollowing;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff701714),
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text(isFollowing ? "Unfollow" : "Follow"),
                  ),
                  const SizedBox(width: 15),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>  Subscribe( route: widget.route,),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff701714),
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text("Subscribe"),
                  ),
                  const SizedBox(width: 15),

                ],
              ),
            ),
            const SizedBox(height: 30),
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
            Expanded(
              child: _buildTabContent(),
            ),
          ],
        ),
      ),
    );
  }

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
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildTabContent() {
    switch (_selectedTabIndex) {
      case 0:
        return SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "A dedicated chef with a love for preserving and sharing the rich culinary heritage of Newari cuisine.",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14, color: Colors.black54, fontFamily: 'Poppins'),
              ),
              const SizedBox(height: 25),
              _buildInfoRow("Full Name", chefData?['fullName'] ?? 'N/A'),
              _buildInfoRow("Email", chefData?['email'] ?? 'N/A'),
              _buildInfoRow("Phone", chefData?['phone'] ?? 'N/A'),
              _buildInfoRow("Experience", chefData?['experience'] ?? 'N/A'),

            ],
          ),
        );
      case 1:
        return GridView.builder(
          padding: const EdgeInsets.all(10),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemCount: chefRecipe.length,
          itemBuilder: (context, index) {
            final recipe = chefRecipe[index]['recipe'];
            final base64Image = recipe['image'] ?? '';
            Uint8List? imageBytes;
            if (base64Image.isNotEmpty) {
              try {
                imageBytes = base64Decode(base64Image);
              } catch (e) {
                imageBytes = null;
              }
            }

            return GestureDetector(

                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ViewRecipe(id: recipe['id'], route: widget.route,),
                    ),
                  );

              },
              child: Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                      ),
                      child: imageBytes != null
                          ? Image.memory(imageBytes, height: 120, width: double.infinity, fit: BoxFit.cover)
                          : Image.asset('assets/applogo.png', height: 120, width: double.infinity, fit: BoxFit.cover),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
                      child: Text(
                        recipe['foodName'] ?? 'No Name',
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Poppins',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      case 2:
        return const Center(
          child: Text("Reviews content coming soon!", style: TextStyle(fontFamily: 'Poppins')),
        );
      default:
        return Container();
    }
  }

  Widget _buildInfoRow(String title, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600, fontFamily: 'Poppins', color: Colors.black87),
        ),
        Text(
          value,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400, fontFamily: 'Poppins', color: Colors.black54),
        ),
      ],
    );
  }
}
