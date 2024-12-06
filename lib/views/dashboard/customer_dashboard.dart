import 'package:flutter/material.dart';

class CustomerDashboard extends StatefulWidget {
  const CustomerDashboard({super.key});

  @override
  State<CustomerDashboard> createState() => _CustomerDashboardState();
}

class _CustomerDashboardState extends State<CustomerDashboard> {
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
        labelStyle: const TextStyle(
          color: Colors.grey,
          fontSize: 14,
          fontFamily: "Poppins",
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }

  Widget _popularRecipeCard() {
    return Container(
      width: MediaQuery.of(context).size.width / 1.4,
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            const SizedBox(
              width: 200,
              height: 100,
              child: Image(
                image: AssetImage('assets/applogo.png'),
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Bara",
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 20,
                          fontFamily: "Poppins",
                          color: Colors.black,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.bookmark_add_outlined),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.favorite_border),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const Text(
                    "A savory Newari pancake made from black lentils, crispy on the outside, soft and flavorful on the inside. Perfect for any festive gathering!",
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 10,
                      fontFamily: "Poppins",
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
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
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 5,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10.0),
                              child: _popularRecipeCard(),
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 5),
                          const Text(
                            "Popular creators",
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                              fontFamily: "Poppins",
                              color: Colors.black,
                            ),
                          ),
                          const Spacer(),
                          TextButton(
                            onPressed: (){},
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.zero,
                            ),
                            child: const Text(
                              "View all",
                              style:  TextStyle(
                                color: Colors.grey,
                                fontSize: 12,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const Row(
                        children: [
                          Column(
                            children: [
                              CircleAvatar(
                                foregroundImage: AssetImage("assets/applogo.png"),
                                maxRadius: 35,
                              ),
                              SizedBox(
                                width: 70,
                                child: Text(
                                  "Anusha Tamrakar",
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(width:15),
                          Column(
                            children: [
                              CircleAvatar(
                                foregroundImage: AssetImage("assets/applogo.png"),
                                maxRadius: 35,
                              ),
                              SizedBox(
                                width: 70,
                                child: Text(
                                  "Anusha Tamrakar",
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(width:15),
                          Column(
                            children: [
                              CircleAvatar(
                                foregroundImage: AssetImage("assets/applogo.png"),
                                maxRadius: 35,
                              ),
                              SizedBox(
                                width: 70,
                                child: Text(
                                  "Anusha Tamrakar",
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(width:15),
                          Column(
                            children: [
                              CircleAvatar(
                                foregroundImage: AssetImage("assets/applogo.png"),
                                maxRadius: 35,
                              ),
                              SizedBox(
                                width: 70,
                                child: Text(
                                  "Anusha Tamrakar",
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      const SizedBox(height:15),
                      const Column(
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                foregroundImage: AssetImage("assets/applogo.png"),
                                maxRadius: 20,
                              ),
                              const SizedBox(width: 10),
                              const Text(
                                "anushatamrakar",
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12,
                                  fontFamily: "Poppins",
                                  color: Colors.black,
                                ),
                              ),
                             SizedBox(width:5),
                             Icon(Icons.add, size: 16, color: Colors.black54),
                            ],
                          ),
                          SizedBox(height: 10),
                          Column(
                            children:[
                              Image(
                                image: AssetImage('assets/applogo.png'),
                              ),
                            ],
                          ),
                        ],
                      ),
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
