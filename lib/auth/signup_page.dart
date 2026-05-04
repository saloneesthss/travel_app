import 'package:flutter/material.dart';
import 'package:travel_app/constants/app_routes.dart';
import 'package:travel_app/constants/app_theme.dart';
import 'package:travel_app/screens/bottom_navigation.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmController = TextEditingController();
  bool isObscure = false;
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            SizedBox(height: 80),
            Text("Travel Seamlessly",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w800,
                color: AppColors.indigo,
              ),
            ),
            SizedBox(height: 40),
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: Text(
                "Create your Account",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 4),
                      decoration: BoxDecoration(
                          color: Colors.white24,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.grey.shade200)
                      ),
                      child: TextFormField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Email",
                        ),
                        controller: emailController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter your email";
                          } else if (!value.contains('@')) {
                            return "Please enter a valid email";
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 4, horizontal: 15),
                      decoration: BoxDecoration(
                        color: Colors.white54,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.grey.shade200),
                      ),
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: "Password",
                          border: InputBorder.none,
                        ),
                        controller: passwordController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter your password";
                          } else if (value.length < 8) {
                            return "Password should be at least 8 characters";
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 4, horizontal: 15),
                      decoration: BoxDecoration(
                        color: Colors.white24,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.grey.shade200),
                      ),
                      child: TextFormField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Confirm Password",
                        ),
                        controller: confirmController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter confirm password";
                          } else if (value != passwordController.text) {
                            return "Password and confirm password do not match";
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(height: 30),
                    ElevatedButton(
                      onPressed: () {
                        if(formKey.currentState?.validate() ?? false) {
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(builder: (context) => BottomNavigation()),
                                  (route) => false
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(double.infinity, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        backgroundColor: AppColors.indigo,
                      ),
                      child: Text("Sign up",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(height: 70),
                    Text("- Or sign up with -", style: TextStyle(fontSize: 16)),
                    SizedBox(height: 30),
                    Container(
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(vertical: 12, horizontal: 25),
                            decoration: BoxDecoration(
                              color: Colors.white24,
                              border: Border.all(color: Colors.grey.shade100),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Image.asset(
                              "assets/icons/google.png",
                              width: 25,
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(vertical: 12, horizontal: 25),
                            decoration: BoxDecoration(
                              color: Colors.white24,
                              border: Border.all(color: Colors.grey.shade100),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Image.asset(
                              "assets/icons/facebook.png",
                              width: 25,
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(vertical: 14, horizontal: 25),
                            decoration: BoxDecoration(
                              color: Colors.white24,
                              border: Border.all(color: Colors.grey.shade100),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Image.asset(
                              "assets/icons/gmail.png",
                              width: 25,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 80),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Already have an account? ", style: TextStyle(fontSize: 16)),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, AppRoutes.login);
                          },
                          child: Text("Login", style: TextStyle(fontSize: 16, color: AppColors.indigo, fontWeight: FontWeight.bold)),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
