import 'package:flutter/material.dart';
import 'package:newafest/widgets/custom_button.dart';

class Subscribe extends StatefulWidget {
  const Subscribe({super.key});

  @override
  State<Subscribe> createState() => _SubscribeState();
}

class _SubscribeState extends State<Subscribe> {
  int selectedPlan = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF701714),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      colors: [Color(0xFFE9A19B), Color(0xFF701714)],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                  padding: const EdgeInsets.all(20),
                  child: const Icon(
                    Icons.workspace_premium_sharp,
                    size: 50,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  "Get premium today",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                    fontFamily: "Poppins",
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  "Unlock Exclusive Recipes and Features",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    fontFamily: "Poppins",
                    color: Colors.white70,
                  ),
                ),
                const SizedBox(height: 30),
                const Text(
                  "Unlimited Recipes",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    fontFamily: "Poppins",
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  width: 150,
                  child: Text(
                    "Just for Premium Members",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      fontFamily: "Poppins",
                      color: Colors.white70,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(height: 8),
                const Divider(
                  thickness: 1,
                  color: Colors.grey,
                  indent: 50,
                  endIndent: 50,
                ),
                const SizedBox(height: 10),
                const Text(
                  "Remove Ads",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    fontFamily: "Poppins",
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  width: 180,
                  child: Text(
                    "Browse and Cook without distractions",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      fontFamily: "Poppins",
                      color: Colors.white70,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(height: 40),
                _buildPlanOption("1 Month", "1500", "1500", 0),
                const SizedBox(height: 15),
                _buildPlanOption("6 Month", "1200", "7200", 1),
                const SizedBox(height: 15),
                _buildPlanOption("12 Month", "1000", "12000", 2),
                const SizedBox(height: 40),
                CustomButton(
                  txt1: "Get premium now!",
                  bg: Colors.white,
                  textColor: const Color(0xff701714),
                  onPressed: () {},
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPlanOption(String title, String pricePerMonth, String totalPrice, int index) {
    bool isSelected = selectedPlan == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedPlan = index;
        });
      },
      child: Container(
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFFDEB6B4) : Colors.white10,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: isSelected ? Colors.purpleAccent : Colors.white30,
            width: 1.5,
          ),
        ),
        padding: const EdgeInsets.all(15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    fontFamily: "Poppins",
                    color: Colors.white,
                  ),
                ),
                Text(
                  "Total price रु$totalPrice",
                  style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                    fontFamily: "Poppins",
                    color: Colors.white70,
                  ),
                ),
              ],
            ),
            Text(
              "रु$pricePerMonth /Month",
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16,
                fontFamily: "Poppins",
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
