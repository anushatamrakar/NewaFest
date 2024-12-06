import 'package:flutter/material.dart';
import 'package:newafest/models/user_model.dart';
import 'package:newafest/utility/loader.dart';
import 'package:newafest/views/bottom_navigation/bottom_nav.dart';
import 'package:newafest/views/bottom_navigation/customer_bottom_nav.dart';
import 'package:newafest/views/home/opening_page.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatefulWidget {
  const Wrapper({super.key});

  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  bool _isLoading = true;

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserModel?>(context);
    if (user == null) {
      _isLoading = true;
      return const NewaFestLoader();
    }
    if (_isLoading) {
      _isLoading = false;
    }
    if (!_isLoading) {
      if (user.role == 'sharer') {
        return const BottomNav( ind: 0,);
      } else if (user.role == 'customer') {
        return const CustomerBottomNav( ind: 0);
      } else {
        return const OpeningPage();
      }
    }

    return const NewaFestLoader();
  }
}