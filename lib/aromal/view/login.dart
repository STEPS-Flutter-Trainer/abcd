import 'package:abcd/aromal/view/forgot.dart';
import 'package:abcd/aromal/view/home.dart';
import 'package:abcd/aromal/view/registration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailOrUsernameController = TextEditingController();
  final _passwordController = TextEditingController();

  // Regular expressions for validation
  final RegExp _emailRegex =
  RegExp(r'^[\w\.-]+@[a-zA-Z\d\.-]+\.[a-zA-Z]{2,}$'); // Valid email format
  final RegExp _passwordRegex =
  RegExp(r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{6,}$');

  void _login() {
    if (_formKey.currentState!.validate()) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => HomePage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    const Color customTextColor = Color(0xBA68C8E4);

    return Scaffold(
      appBar: AppBar(title: Text("Login")),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Container(
              padding: const EdgeInsets.all(16.0),
              margin: const EdgeInsets.symmetric(horizontal: 16.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.5),
                    blurRadius: 10,
                    offset: Offset(0, 5),
                  ),
                ],
              ),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    Text(
                      "Welcome Back!",
                      style: TextStyle(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.bold,
                        color: customTextColor,
                      ),
                    ),
                    SizedBox(height: 16.h),
                    // Email or Username Field
                    TextFormField(
                      controller: _emailOrUsernameController,
                      decoration: InputDecoration(
                        labelText: "Email or Username",
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Enter your email or username";
                        }
                        if (!_emailRegex.hasMatch(value) && value.length < 3) {
                          return "Enter a valid email or username (at least 3 characters)";
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 16.h),
                    // Password Field
                    TextFormField(
                      controller: _passwordController,
                      decoration: InputDecoration(
                        labelText: "Password",
                        border: OutlineInputBorder(),
                      ),
                      obscureText: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Password cannot be empty";
                        }
                        if (!_passwordRegex.hasMatch(value)) {
                          return "Password must include:\n- At least 6 characters\n- One uppercase letter\n- One lowercase letter\n- One number\n- One special character";
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 16.h),
                    // Login Button
                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: ElevatedButton(
                        onPressed: _login,
                        child: Text("Login", style: TextStyle(fontSize: 9.sp),),
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(double.infinity, 50),
                        ),

                      ),
                    ),
                    SizedBox(height: 8.h),
                    // Forgot Password and Register
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (_) => ForgotPasswordScreen()),
                            );
                          },
                          child: Text(
                            "Forgot Password?",
                            style: TextStyle(color: customTextColor, fontSize: 9.sp),
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              "Don't have an account?",
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (_) => RegistrationScreen()),
                                );
                              },
                              child: Text(
                                "Register",
                                style: TextStyle(color: customTextColor, fontSize: 9.sp),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Divider(height: 32, thickness: 1),
                    Text(
                      "Or login with",
                      style: TextStyle(color: customTextColor),
                    ),
                    SizedBox(height: 16),
                    // Social Media Icons
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(
                          icon: FaIcon(FontAwesomeIcons.google, color: Colors.red),
                          onPressed: () {
                            print('Google clicked');
                          },
                        ),
                        IconButton(
                          icon: FaIcon(FontAwesomeIcons.facebook, color: Colors.blue),
                          onPressed: () {
                            print('Facebook clicked');
                          },
                        ),
                        IconButton(
                          icon: FaIcon(FontAwesomeIcons.twitter, color: Colors.lightBlue),
                          onPressed: () {
                            print('Twitter clicked');
                          },
                        ),
                        IconButton(
                          icon: FaIcon(FontAwesomeIcons.linkedin, color: Colors.blueAccent),
                          onPressed: () {
                            print('LinkedIn clicked');
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
