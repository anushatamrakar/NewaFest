import 'package:flutter/material.dart';
import 'package:newafest/services/authentication.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final TextEditingController _emailController = TextEditingController();
bool isLoading=false;
String email='';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF701714), // Background color
      body: SafeArea(
        child: Column(
          children: [  Stack(
            alignment: Alignment.topRight,
            children: [
              Image.asset(
                'assets/fwbanner.png',
                width: double.infinity,
                height: 250,
                fit: BoxFit.cover,
              ),
              Positioned(
                  left:10,
                  top:5,
                  child: GestureDetector(
                    onTap:(){
                      Navigator.pushReplacementNamed(context, '/login');
                    },
                    child: const Icon(Icons.arrow_back_ios)),
                  )
              , const Positioned(
                left:10,
                bottom:10,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [  Text(
                    "Forgot",
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w700,
                      fontFamily: "Poppins",
                      color: Color(0xff701714),
                    ),
                  ),
                    Text(
                      "Password?",
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w400,
                        fontFamily: "Poppins",
                        color: Color(0xff701714),

                      ),
                    ),],
                ),
              )
            ],
          ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [


                      // Subtitle
                      const Text(
                        "Find your account",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          fontFamily: "Poppins",
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 10),
                      // Email Input Field
                      TextField(
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                        onChanged: (e){
                          email=e;
                        },
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: "Email Address",
                          hintStyle: const TextStyle(
                            fontFamily: "Poppins",
                            color: Colors.grey,
                            fontSize: 14,
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 14,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        "Enter the email address associated with your account",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          fontFamily: "Poppins",
                          color: Colors.white70,
                        ),
                      ),
                      const SizedBox(height: 30),
                      // Recover Password Button
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () async{
                            setState(() {
                              isLoading=true;
                            });
                            final result= await Authentication().passwordReset(context,email);
                            setState(() {
                              isLoading=false;
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            padding: const EdgeInsets.symmetric(vertical: 16),
                          ),
                          child: const Text(
                            "Recover Password",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Poppins",
                              color: Color(0xFF701714),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
