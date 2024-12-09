import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class CustomHeader extends StatefulWidget {
  final String title;
  final String route;
  const CustomHeader({super.key, required this.title, required this.route});

  @override
  State<CustomHeader> createState() => _CustomHeaderState();
}

class _CustomHeaderState extends State<CustomHeader> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
      color: const Color(0xff701714),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                widget.title,
                style: const TextStyle(
                    color: Colors.white,
                    fontFamily: 'poppins',
                    fontWeight: FontWeight.w400,
                    fontSize: 18),
              ),
              GestureDetector(
                  onTap: () {
                    Navigator.pushReplacementNamed(context, widget.route);
                  },
                  child: const Icon(Icons.arrow_back_ios_new_rounded,
                      color: Colors.white)),
            ],
          ),
        ],
      ),
    );
  }
}
