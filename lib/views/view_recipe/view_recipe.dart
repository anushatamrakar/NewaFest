import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:newafest/controller/chef_controller.dart';
import 'package:newafest/widgets/custom_header.dart';

class ViewRecipe extends StatefulWidget {
  final String id,route;
  const ViewRecipe({super.key, required this.id, required this.route});

  @override
  State<ViewRecipe> createState() => _ViewRecipeState();
}

class _ViewRecipeState extends State<ViewRecipe> {
  Map<String, dynamic>? recipeData;
  int _selectedTabIndex = 0;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    fetchUserData();
  }

  Future<void> fetchUserData() async {
    try {
      setState(() {
        isLoading = true;
      });
      final data = await ChefController().getRecipeDetails(widget.id);
      setState(() {
        recipeData = data.isNotEmpty ? data[0]['recipes'] : null;
        isLoading = false;
      });
    } catch (e) {
      print("Error fetching user data: $e");
      setState(() {
        isLoading = false;
      });
    }
  }

  Widget _buildTab(String title, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedTabIndex = index;
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        child: Column(
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: _selectedTabIndex == index
                    ? FontWeight.w600
                    : FontWeight.normal,
                fontFamily: 'Poppins',
                color: _selectedTabIndex == index
                    ? const Color(0xff701714)
                    : Colors.grey,
              ),
            ),
            if (_selectedTabIndex == index)
              Container(
                margin: const EdgeInsets.only(top: 5),
                height: 2,
                width: 20,
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
        final ingredients = recipeData?['ingredients'] as List<dynamic>? ?? [];
        return ingredients.isNotEmpty
            ? ListView.builder(
          itemCount: ingredients.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            final ingredient =
            ingredients[index] as Map<String, dynamic>;
            return Container(
              margin: const EdgeInsets.symmetric(
                  vertical: 4, horizontal: 8),
              decoration: BoxDecoration(
                border: Border.all(color: const Color(0xff701714)),
                borderRadius: BorderRadius.circular(8),
              ),
              child: ListTile(
                leading: const Icon(Icons.check_circle,
                    color: Colors.green),
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      ingredient['ingredient'] ?? '',
                      style: const TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 14,
                        color: Colors.black87,
                      ),
                    ),
                    Text(
                      ingredient['quantity'] ?? '',
                      style: const TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 14,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        )
            : const Center(
          child: Text(
            "No ingredients available.",
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 14,
              color: Colors.grey,
            ),
          ),
        );
      case 1:
        final steps = recipeData?['steps'] as List<dynamic>? ?? [];
        return steps.isNotEmpty
            ? ListView.builder(
          itemCount: steps.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return Container(
              margin: const EdgeInsets.symmetric(
                  vertical: 4, horizontal: 8),
              decoration: BoxDecoration(
                border: Border.all(color: const Color(0xff701714)),
                borderRadius: BorderRadius.circular(8),
              ),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: const Color(0xff701714),
                  child: Text(
                    '${index + 1}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontFamily: 'Poppins',
                    ),
                  ),
                ),
                title: Text(
                  steps[index].toString(),
                  style: const TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 14,
                    color: Colors.black87,
                  ),
                ),
              ),
            );
          },
        )
            : const Center(
          child: Text(
            "No steps available.",
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 14,
              color: Colors.grey,
            ),
          ),
        );
      case 2:
        return const Center(
          child: Text(
            "Subscribe content coming soon!",
            style: TextStyle(fontFamily: 'Poppins'),
          ),
        );
      default:
        return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    final base64Image = recipeData?['image'] ?? '';
    Uint8List? imageBytes;
    if (base64Image.isNotEmpty) {
      try {
        imageBytes = base64Decode(base64Image);
      } catch (e) {
        print("Error decoding Base64: $e");
        imageBytes = null;
      }
    }

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            CustomHeader(title: recipeData?['foodName'] ?? '', route: widget.route),
            Expanded(
              child: isLoading
                  ? const Center(
                child: CircularProgressIndicator(),
              )
                  : SingleChildScrollView(
                child: Column(
                  children: [
                    Image(
                      image: imageBytes != null
                          ? MemoryImage(imageBytes)
                          : const AssetImage('assets/applogo.png')
                      as ImageProvider,
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            recipeData?['foodName'] ?? '',
                            style: const TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 24,
                              fontFamily: "Poppins",
                              color: Color(0xff701714),
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            recipeData?['description'] ?? '',
                            style: const TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                              fontFamily: "Poppins",
                              color: Colors.black54,
                            ),
                          ),
                          const SizedBox(height: 15),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  const Icon(Icons.timer,
                                      color: Colors.grey, size: 20),
                                  const SizedBox(width: 4),
                                  Text(
                                    recipeData?['slider']
                                        .toString() ??
                                        'N/A',
                                    style: const TextStyle(
                                      fontSize: 14,
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(width: 30),
                              const Row(
                                children: [
                                  Icon(Icons.local_fire_department,
                                      color: Colors.orange, size: 20),
                                  SizedBox(width: 4),
                                  Text(
                                    "150 Kcal",
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(width: 30),
                              const Row(
                                children: [
                                  Icon(Icons.star,
                                      color: Colors.yellow, size: 20),
                                  SizedBox(width: 4),
                                  Text(
                                    "4.9 (183)",
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          const Divider(
                            thickness: 1,
                            color: Colors.black,
                            indent: 16,
                            endIndent: 16,
                          ),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              _buildTab("Ingredients", 0),
                              const SizedBox(width: 35),
                              _buildTab("Steps", 1),
                              const SizedBox(width: 35),
                              _buildTab("Subscribe", 2),
                            ],
                          ),
                          const SizedBox(height: 5),
                          _buildTabContent(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
