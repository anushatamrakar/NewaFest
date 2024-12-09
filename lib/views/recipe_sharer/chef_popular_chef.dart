import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:newafest/controller/chef_controller.dart';
import 'package:newafest/utility/loader.dart';
import 'package:newafest/views/navigate_pages/customer_chef_profile.dart';
import 'package:newafest/widgets/custom_add_recipe/custom_chef_header.dart';
import 'package:newafest/widgets/custom_app_header.dart';

class ChefPopularChef extends StatefulWidget {
  const ChefPopularChef({super.key});

  @override
  State<ChefPopularChef> createState() => _ChefPopularChefState();
}

class _ChefPopularChefState extends State<ChefPopularChef> {
  final OutlineInputBorder border = const OutlineInputBorder(
    borderSide: BorderSide(
      width: 1.5,
      style: BorderStyle.solid,
      color: Colors.grey,
    ),
    borderRadius: BorderRadius.all(Radius.circular(50)),
  );

  final TextEditingController _searchController = TextEditingController();
  List<Map<String, dynamic>> allChefs = [];
  List<Map<String, dynamic>> filteredChefs = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchPopularUsers();
  }

  Future<void> fetchPopularUsers() async {
    setState(() {
      isLoading = true;
    });
    try {
      final popularChefs = await ChefController().getChefs();
      setState(() {
        allChefs = popularChefs;
        filteredChefs = popularChefs;
        isLoading = false;
      });
    } catch (e) {
      print("Error fetching popular users: $e");
      setState(() {
        isLoading = false;
      });
    }
  }

  void _searchChefs(String query) {
    setState(() {
      filteredChefs = allChefs
          .where((chef) => chef['fullName']!
          .toLowerCase()
          .contains(query.toLowerCase()))
          .toList();
    });
  }

  Widget _searchField() {
    return TextField(
      controller: _searchController,
      onChanged: _searchChefs,
      maxLines: 1,
      style: const TextStyle(
        fontSize: 14,
        fontFamily: "Poppins",
        fontWeight: FontWeight.w400,
      ),
      decoration: InputDecoration(
        hintText: "Search popular chefs...",
        hintStyle: const TextStyle(color: Colors.grey),
        prefixIcon: const Icon(Icons.search_outlined),
        filled: true,
        fillColor: Colors.white,
        focusedBorder: border,
        enabledBorder: border,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const NewaFestLoader()
        : Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              const CustomChefHeader(title: 'Popular Chef'),
              Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: _searchField(),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: filteredChefs.isEmpty
                    ? const Center(
                  child: Text(
                    'No chefs found',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                )
                    : ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  itemCount: filteredChefs.length,
                  itemBuilder: (context, index) {
                    final chef = filteredChefs[index];
                    final base64Image = chef['image'] ?? '';
                    Uint8List? imageBytes;

                    if (base64Image.isNotEmpty) {
                      try {
                        imageBytes = base64Decode(base64Image);
                      } catch (e) {
                        print("Error decoding Base64: $e");
                      }
                    }

                    return GestureDetector(
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ChefCustomerProfilePage( route: '/chef_dash', uid:  chef['id'],),
                          ),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 15.0),
                        child: Row(
                          children: [
                            CircleAvatar(
                              foregroundImage: imageBytes != null
                                  ? MemoryImage(imageBytes)
                                  : const AssetImage(
                                  'assets/applogo.png')
                              as ImageProvider<Object>, // Fallback image
                              maxRadius: 35,
                            ),
                            const SizedBox(width: 10),
                            Column(
                              children: [Text(
                                chef['fullName'] ?? "Unknown Chef",
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontFamily: 'poppins',
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),const SizedBox(height: 5,),
                                Text(
                                  chef['email'] ?? "Unknown Chef",
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    fontSize: 11,
                                    fontFamily: 'poppins',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),],
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
