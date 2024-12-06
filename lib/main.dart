import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:newafest/firebase_options.dart';
import 'package:newafest/models/user_model.dart';
import 'package:newafest/services/authentication.dart';
import 'package:newafest/utility/loader.dart';
import 'package:newafest/views/auth/forgot_password.dart';
import 'package:newafest/views/auth/login_page.dart';
import 'package:newafest/views/auth/sharer_registration.dart';
import 'package:newafest/views/auth/user_registration.dart';
import 'package:newafest/views/bottom_navigation/bottom_nav.dart';
import 'package:newafest/views/recipe_sharer/chef_profile.dart';
import 'package:newafest/views/dashboard/customer_dashboard.dart';
import 'package:newafest/views/dashboard/sharer_dashboard.dart';
import 'package:newafest/views/home/home_page.dart';
import 'package:newafest/views/home/opening_page.dart';
import 'package:newafest/views/recipe_sharer/add_recipe.dart';
import 'package:newafest/views/recipe_sharer/add_recipe2.dart';
import 'package:newafest/views/recipe_sharer/add_recipe3.dart';
import 'package:newafest/views/subscription/subscribe.dart';
import 'package:newafest/views/view_recipe/view_recipe.dart';
import 'package:newafest/wrapper.dart';
import 'package:provider/provider.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<UserModel?>.value(
      value:Authentication().user,
      initialData: null,
      child: MaterialApp(
        title: 'NewaFest',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        routes: {
          "/": (context)=> const OpeningPage(),
          "/wrapper": (context)=> const Wrapper(),
          "/popular": (context)=> const BottomNav(ind: 1),
          "/add_recipe": (context)=> const BottomNav(ind: 2),
          "/calender": (context)=> const BottomNav(ind: 3),
          "/chef_profile": (context)=> const BottomNav(ind: 4),
          "/home": (context)=> const HomePage(),
          "/login":(context)=> const LoginPage(),
          "/register":(context)=> const UserRegistration(),
          "/sharer_register":(context)=> const SharerRegistration(),
          "/add_recipe2":(context)=> const AddRecipe2(),
          "/add_recipe3":(context)=> const AddRecipe3(),
        },
      ),
    );
  }
}

