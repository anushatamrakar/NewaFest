import 'package:flutter/material.dart';

class PopularChef extends StatefulWidget {
  const PopularChef({super.key});

  @override
  State<PopularChef> createState() => _PopularChefState();
}

class _PopularChefState extends State<PopularChef> {
  final OutlineInputBorder border = const OutlineInputBorder(
    borderSide: BorderSide(
      width: 1.5,
      style: BorderStyle.solid,
      color: Colors.grey,
    ),
    borderRadius: BorderRadius.all(Radius.circular(50)),
  );

  Widget _searchchefs() {
    return TextField(
      maxLines: 1,
      style: const TextStyle(
        fontSize: 14,
        fontFamily: "Poppins",
        fontWeight: FontWeight.w400,
      ),
      decoration: InputDecoration(
        hintText: "Popular chefs...",
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
            _searchchefs(),
            const SizedBox(height: 20),
            const Expanded(
                child: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(children: [
                      const CircleAvatar(
                        foregroundImage: AssetImage("assets/applogo.png"),
                        maxRadius: 35,
                      ),
                      const SizedBox(width:10),
                      const Text(
                        "Anusha Tamrakar",
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],),
                    const SizedBox(height: 15),
                    Row(children: [
                      const CircleAvatar(
                        foregroundImage: AssetImage("assets/applogo.png"),
                        maxRadius: 35,
                      ),
                      const SizedBox(width:10),
                      const Text(
                        "Anusha Tamrakar",
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],),
                    const SizedBox(height: 15),
                    Row(children: [
                      const CircleAvatar(
                        foregroundImage: AssetImage("assets/applogo.png"),
                        maxRadius: 35,
                      ),
                      const SizedBox(width:10),
                      const Text(
                        "Anusha Tamrakar",
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],),
                    const SizedBox(height: 15),
                    Row(children: [
                      const CircleAvatar(
                        foregroundImage: AssetImage("assets/applogo.png"),
                        maxRadius: 35,
                      ),
                      const SizedBox(width:10),
                      const Text(
                        "Anusha Tamrakar",
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],),
                    const SizedBox(height: 15),
                    Row(children: [
                      const CircleAvatar(
                        foregroundImage: AssetImage("assets/applogo.png"),
                        maxRadius: 35,
                      ),
                      const SizedBox(width:10),
                      const Text(
                        "Anusha Tamrakar",
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],),
              ]),
            ))
          ],
        ),
      )),
    );
  }
}
