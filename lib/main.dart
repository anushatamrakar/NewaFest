import 'package:flutter/material.dart';
import 'package:newafest/views/auth/login_page.dart';
import 'package:newafest/views/auth/sharer_registration.dart';
import 'package:newafest/views/auth/user_registration.dart';
import 'package:newafest/views/home/home_page.dart';
import 'package:newafest/views/home/opening_page.dart';
import 'package:newafest/views/recipe_sharer/add_recipe.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routes: {
        "/": (context)=> const OpeningPage(),
        "/home": (context)=> const HomePage(),
        "/login":(context)=> const LoginPage(),
        "/register":(context)=> const UserRegistration(),
        "/sharer_register":(context)=> const SharerRegistration(),
        "/add_recipe":(context)=> const AddRecipe(),
      },
    );
  }
}

