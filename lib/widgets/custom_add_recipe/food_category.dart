import 'package:flutter/material.dart';
import 'package:newafest/widgets/custom_add_recipe/category_widget.dart';
import 'package:newafest/widgets/custom_social_icon.dart';

class FoodCategory extends StatefulWidget {
  const FoodCategory({super.key});

  @override
  State<FoodCategory> createState() => _FoodCategoryState();
}

class _FoodCategoryState extends State<FoodCategory> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Food Category",
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 14,
            fontFamily: "Poppins",
            color: Colors.black,
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              CustomCategoryButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.breakfast_dining,
                    size: 18,
                  ),
                  txt1: "Breakfast"),
              const SizedBox(width: 10),
              CustomCategoryButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.breakfast_dining,
                    size: 18,
                  ),
                  txt1: "Breakfast"),
              const SizedBox(width: 10),
              CustomCategoryButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.breakfast_dining,
                    size: 18,
                  ),
                  txt1: "Breakfast"),
            ],
          ),
        )
      ],
    );
  }
}