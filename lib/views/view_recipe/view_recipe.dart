import 'package:flutter/material.dart';

class ViewRecipe extends StatefulWidget {
  const ViewRecipe({super.key});

  @override
  State<ViewRecipe> createState() => _ViewRecipeState();
}

class _ViewRecipeState extends State<ViewRecipe> {
  int _selectedTabIndex = 0;

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
                fontWeight: _selectedTabIndex == index ? FontWeight.w600 : FontWeight.normal,
                fontFamily: 'Poppins',
                color: _selectedTabIndex == index ? const Color(0xff701714) : Colors.grey,
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
        return const Center(
          child: Text(
            "Recipes content coming soon!",
            style: TextStyle(fontFamily: 'Poppins'),
          ),
        );
      case 2:
        return const Center(
          child: Text(
            "Reviews content coming soon!",
            style: TextStyle(fontFamily: 'Poppins'),
          ),
        );
      default:
        return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const Image(
              image: AssetImage('assets/bara.jpg'),
              height: 220,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 10),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Bara",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 24,
                        fontFamily: "Poppins",
                        color: Color(0xff701714),
                      ),
                    ),
                    const SizedBox(height: 5),
                    const Text(
                      "A savory Newari pancake made from black lentils, crispy on the outside, soft and flavorful on the inside. Perfect for any festive gathering!",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        fontFamily: "Poppins",
                        color: Colors.black54,
                      ),
                    ),
                    const SizedBox(height: 15),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.timer, color: Colors.grey, size: 20),
                            SizedBox(width: 4),
                            Text(
                              "15 min",
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(width: 30),
                        Row(
                          children: [
                            Icon(Icons.local_fire_department, color: Colors.orange, size: 20),
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
                        SizedBox(width: 30),
                        Row(
                          children: [
                            Icon(Icons.star, color: Colors.yellow, size: 20),
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
                    Expanded(
                      child: _buildTabContent(),
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
