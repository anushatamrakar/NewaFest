import 'package:flutter/material.dart';
import 'package:newafest/views/auth/login_page.dart';
import 'package:newafest/views/auth/sharer_registration.dart';
import 'package:newafest/views/auth/user_registration.dart';
import 'package:newafest/views/pages/chefEditProfile.dart';
// import 'package:newafest/views/home/home_page.dart';
// import 'package:newafest/views/home/opening_page.dart';
import 'package:newafest/views/pages/chefProfile.dart';

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
      home: const ChefEditProfilePage(),
      routes: {
        "/login":(context)=> const LoginPage(),
        "/register":(context)=> const UserRegistration(),
        "/profile":(context)=> const ChefProfilePage()
      },
    );
  }
}

