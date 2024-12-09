import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:newafest/controller/chef_controller.dart';
import 'package:newafest/views/recipe_sharer/chef_profile.dart';
import 'package:newafest/views/view_recipe/view_recipe.dart';

import '../navigate_pages/customer_chef_profile.dart';

class CustomerDashboard extends StatefulWidget {
  const CustomerDashboard({super.key});

  @override
  State<CustomerDashboard> createState() => _CustomerDashboardState();
}

class _CustomerDashboardState extends State<CustomerDashboard> {
  bool isLoading = true;
  List<Map<String, dynamic>> recipe = [];
  List<Map<String, dynamic>> chef = [];
  List<Map<String, dynamic>>  allData= [];

  @override
  void initState() {
    super.initState();
    fetchRecipe();
    fetchRecipeWithChef();
    fetchPopularUsers();
  }

  Future<void> fetchRecipeWithChef() async {
    try {
      final data = await ChefController().getRecipeWithSharer();
      print(data);
      setState(() {
        allData = data;
        isLoading = false;
      });
    } catch (e) {
      print("Error fetching recipe: $e");
      setState(() {
        isLoading = false;
      });
    }
  }
  Future<void> fetchRecipe() async {
    try {
      final data = await ChefController().getRecipe();
      setState(() {
        recipe = data;
        isLoading = false;
      });
    } catch (e) {
      print("Error fetching recipe: $e");
      setState(() {
        isLoading = false;
      });
    }
  }

  Future<void> fetchPopularUsers() async {
    try {
      final popularChefs = await ChefController().getChefs();
      print(popularChefs);
      setState(() {
        chef = popularChefs;
      });
    } catch (e) {
      print("Error fetching popular users: $e");
    }
  }

  final OutlineInputBorder border = const OutlineInputBorder(
    borderSide: BorderSide(
      width: 1.5,
      style: BorderStyle.solid,
      color: Colors.grey,
    ),
    borderRadius: BorderRadius.all(Radius.circular(50)),
  );

  Widget _search() {
    return TextField(
      maxLines: 1,
      style: const TextStyle(
        fontSize: 14,
        fontFamily: "Poppins",
        fontWeight: FontWeight.w400,
      ),
      decoration: InputDecoration(
        hintText: "Search recipes...",
        hintStyle: const TextStyle(color: Colors.grey),
        prefixIcon: const Icon(Icons.search_outlined),
        filled: true,
        fillColor: Colors.white,
        focusedBorder: border,
        enabledBorder: border,
      ),
    );
  }

  Widget _popularRecipeCard(Map<String, dynamic> recipeData) {
    final base64Image = recipeData['image'] ?? '';
    Uint8List? imageBytes;

    if (base64Image.isNotEmpty) {
      try {
        imageBytes = base64Decode(base64Image);
      } catch (e) {
        print("Error decoding Base64: $e");
      }
    }

    String truncateDescription(String? description, int wordLimit) {
      if (description == null || description.isEmpty) {
        return 'No description available for this recipe.';
      }
      List<String> words = description.split(' ');
      if (words.length <= wordLimit) {
        return description;
      }
      return words.take(wordLimit).join(' ') + '...';
    }

    return Container(
      width: MediaQuery.of(context).size.width / 1.4,
      child: GestureDetector(
        onTap: (){
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ViewRecipe(id: recipeData['id'], route: '/cust_dash',),
            ),
          );
        },
        child: Card(
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                height: 120,
                child: imageBytes != null
                    ? Image.memory(imageBytes, fit: BoxFit.cover)
                    : Image.asset('assets/applogo.png', fit: BoxFit.cover),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 2),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            recipeData['foodName'] ?? 'Unknown Recipe',
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                              fontFamily: "Poppins",
                              color: Colors.black,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Row(
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.bookmark_add_outlined,
                                color: Colors.black,
                              ),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.favorite_border,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 2),
                    Text(
                      truncateDescription(recipeData['description'], 10),
                      style: const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                        fontFamily: "Poppins",
                        color: Colors.black87,
                      ),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _popularUserCard(Map<String, dynamic> userData) {
    final base64Image = userData['image'] ?? '';
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
            builder: (context) => ChefCustomerProfilePage( route: '/cust_dash', uid:  userData['id'],),
          ),
        );
      },
      child: Container(
        child: Column(
          children: [
            CircleAvatar(
              radius: 35,
              backgroundImage: imageBytes != null
                  ? MemoryImage(imageBytes)
                  : const AssetImage('assets/applogo.png') as ImageProvider,
            ),
            const SizedBox(height: 5),
            SizedBox(
              width: 70,
              child: Text(
                userData['fullName'] ?? 'Unknown User',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            SizedBox(
              width: 70,
              child: Text(
                userData['username'] ?? '@unknown',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 10,
                  color: Colors.grey,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _popularUsersSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Popular Creators",
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 16,
            fontFamily: "Poppins",
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 120,
          child: chef.isEmpty
              ? const Center(
            child: Text(
              "No creators available",
              style: TextStyle(color: Colors.grey),
            ),
          )
              : ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: chef.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: _popularUserCard(chef[index]),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _socialMediaSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Popular Recipes",
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 16,
            fontFamily: "Poppins",
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 10),
        isLoading
            ? const Center(child: CircularProgressIndicator())
            : allData.isEmpty
            ? const Center(
          child: Text(
            "No posts available",
            style: TextStyle(color: Colors.grey),
          ),
        )
            : ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: allData.length,
          itemBuilder: (context, index) {
            final postData = allData[index];
            final recipe = postData['recipe'] ?? {};
            final sharer = postData['sharer'] ?? {};

            final recipeImage = recipe['image'] ?? '';
            final sharerImage = sharer['image'] ?? '';
            Uint8List? recipeImageBytes;
            Uint8List? sharerImageBytes;

            try {
              if (recipeImage.isNotEmpty) {
                recipeImageBytes = base64Decode(recipeImage);
              }
              if (sharerImage.isNotEmpty) {
                sharerImageBytes = base64Decode(sharerImage);
              }
            } catch (e) {
              print("Error decoding images: $e");
            }

            return GestureDetector(
              onTap:(){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ViewRecipe(id: recipe['id'], route: '/cust_dash',),
                  ),
                );
              },
              child: Card(
                elevation: 5,
                margin: const EdgeInsets.symmetric(vertical: 10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            foregroundImage: sharerImageBytes != null
                                ? MemoryImage(sharerImageBytes)
                                : const AssetImage("assets/applogo.png")
                            as ImageProvider,
                            radius: 20,
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Column(
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              children: [
                                Text(
                                  sharer['fullName'] ?? 'Unknown Sharer',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14,
                                    fontFamily: "Poppins",
                                  ),
                                ),
                                Text(
                                  sharer['email'] ??
                                      'Unknown time', // Ensure `createdAt` is part of the `recipe` data.
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey[600],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.more_vert,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Text(
                        recipe['description'] ??
                            'No description available.',
                        style: const TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          fontFamily: "Poppins",
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        height: 180,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          image: DecorationImage(
                            image: recipeImageBytes != null
                                ? MemoryImage(recipeImageBytes)
                                : const AssetImage("assets/applogo.png")
                            as ImageProvider,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.favorite_border),
                              ),
                              const Text("123"), // Replace dynamically
                              const SizedBox(width: 10),
                              IconButton(
                                onPressed: () {},
                                icon:
                                const Icon(Icons.comment_outlined),
                              ),
                              const Text("45"), // Replace dynamically
                            ],
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.share),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              const Text(
                "What do you want to cook today?",
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 22,
                  fontFamily: "Poppins",
                  color: Color(0xff701714),
                ),
              ),
              const SizedBox(height: 15),
              _search(),
              const SizedBox(height: 10),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 10),
                      const Text(
                        "Popular Recipes",
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          fontFamily: "Poppins",
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        height: 230,
                        child: isLoading
                            ? const Center(child: CircularProgressIndicator())
                            : recipe.isEmpty
                            ? const Center(
                          child: Text(
                            "No recipes available",
                            style: TextStyle(color: Colors.grey),
                          ),
                        )
                            : ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: recipe.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10.0),
                              child: _popularRecipeCard(recipe[index]),
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 20),
                      _popularUsersSection(),
                      const SizedBox(height: 20),
                      _socialMediaSection(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
