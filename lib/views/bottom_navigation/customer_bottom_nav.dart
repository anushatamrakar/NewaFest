import 'package:flutter/material.dart';
import 'package:newafest/views/dashboard/customer_dashboard.dart';
import 'package:newafest/views/navigate_pages/calendar.dart';
import 'package:newafest/views/navigate_pages/my_account.dart';
import 'package:newafest/views/navigate_pages/popular_chef.dart';

class CustomerBottomNav extends StatefulWidget {
  final int ind;
  const CustomerBottomNav({super.key, required this.ind});

  @override
  State<CustomerBottomNav> createState() => _CustomerBottomNavState();
}

class _CustomerBottomNavState extends State<CustomerBottomNav> {
  late int myIndex;
  @override
  void initState() {
    super.initState();
    myIndex = widget.ind;
  }

  final List<Widget> screenList = [
    const CustomerDashboard(),
    const PopularChef(),
    const Calendar(),
    const MyAccount(),
  ];

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            myIndex = index;
          });
        },
        currentIndex: myIndex,
        selectedItemColor: const Color(0xFF701714),
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.space_dashboard_rounded),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.food_bank),
            label: 'Popular Chef',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month_outlined),
            label: 'Calendar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Profile',
          ),
        ],
      ),
      body: screenList[myIndex],
    );
  }
}