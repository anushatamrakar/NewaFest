import 'package:flutter/material.dart';
import 'package:newafest/widgets/custom_add_recipe/food_category.dart';
import 'package:newafest/widgets/custom_add_recipe/image_upload.dart';
import 'package:newafest/widgets/custom_button.dart';

import '../../widgets/custom_add_recipe/category_widget.dart';

class AddRecipe extends StatefulWidget {
  const AddRecipe({super.key});

  @override
  State<AddRecipe> createState() => _AddRecipeState();
}

class _AddRecipeState extends State<AddRecipe> {
  bool setIsLoading=false;
  String foodName='',description='',category='',duration='';
  final OutlineInputBorder border = const OutlineInputBorder(
    borderSide: BorderSide(
      width: 1.5,
      style: BorderStyle.solid,
      color: Colors.grey,
    ),
    borderRadius: BorderRadius.all(Radius.circular(5)),
  );

  Widget _foodName() {
    return TextField(
      maxLines: 1,
      style: const TextStyle(
        fontSize: 14,
        fontFamily: "Poppins",
        fontWeight: FontWeight.w400,
      ),
      onChanged: (e){
        setState(() {
          foodName=e;
        });
      },
      decoration: InputDecoration(
        labelText: "Enter food name",
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

  // Description input field
  Widget _description() {
    return TextField(
      minLines: 5,
      maxLines:null,
      style: const TextStyle(
        fontSize: 14,
        fontFamily: "Poppins",
        fontWeight: FontWeight.w400,
      ),  onChanged: (e){
      setState(() {
        description=e;
      });
    },
      decoration: InputDecoration(
        labelText: "Tell a little about your food",
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

  double _currentValue = 60;
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal:15, vertical:12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const ImageUpload(),
                const SizedBox(height: 20),
                Column(
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
                    const SizedBox(height: 10),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          CustomCategoryButton(
                              onPressed: () {
                                setState(() {
                                  category='breakfast';
                                });
                              },
                              icon: const Icon(
                                Icons.breakfast_dining,
                                size: 18,
                              ),
                              txt1: "Breakfast"),
                          const SizedBox(width: 6),
                          CustomCategoryButton(
                              onPressed: () {
                                setState(() {
                                  category='lunch';
                                });
                              },
                              icon: const Icon(
                                Icons.lunch_dining,
                                size: 18,
                              ),
                              txt1: "Lunch"),
                          const SizedBox(width: 6),
                          CustomCategoryButton(
                              onPressed: () {
                                setState(() {
                                  category='snacks';
                                });
                              },
                              icon: const Icon(
                                Icons.lunch_dining_outlined,
                                size: 18,
                              ),
                              txt1: "Snacks"),
                          const SizedBox(width: 6),
                          CustomCategoryButton(
                              onPressed: () {
                                setState(() {
                                  category='dinner';
                                });
                              },
                              icon: const Icon(
                                Icons.dinner_dining,
                                size: 18,
                              ),
                              txt1: "Dinner"),
                        ],
                      ),
                    )
                  ],
                )            ,    const SizedBox(height: 20),
                const Text(
                  "Food Name",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    fontFamily: "Poppins",
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 10),
                _foodName(),
                const SizedBox(height: 20),
                const Text(
                  "Description",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    fontFamily: "Poppins",
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 10),
                _description(),
                const SizedBox(height: 20),
                const Text(
                  "Cooking Duration (in minutes)",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    fontFamily: "Poppins",
                    color: Colors.black,
                  ),
                ),
                Slider(
                  value: _currentValue,
                  min: 0,
                  max: 60,
                  divisions: 6,
                  label: _currentValue.round().toString(),
                  activeColor: const Color(0xff701714),
                  inactiveColor: Colors.grey,
                  onChanged: (double newValue) {
                    setState(() {
                      _currentValue = newValue;
                    });
                  },
                ),
                CustomButton(txt1: "Continue", bg: const Color(0xff701714), textColor: Colors.white, onPressed: (){Navigator.pushNamed(context, "/add_recipe2",arguments: {
                  foodName,category,_currentValue,description,duration
                });},),
              ],
            ),
          )
        ),
    );
  }
}

