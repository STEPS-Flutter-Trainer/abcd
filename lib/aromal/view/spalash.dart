/*
import 'package:abcd/aromal/view/login.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Navigate to LoginScreen after 3 seconds.
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue, // You can set your desired background color.
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // App logo or icon.
            Icon(
              Icons.social_distance, // Replace with your app's logo/icon.
              size: 100,
              color: Colors.white,
            ),
            SizedBox(height: 16),
            // App name or tagline.
            Text(
              "My Social App",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
*/


import 'package:flutter/material.dart';
import 'package:abcd/aromal/view/login.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart'; // Import LoginScreen

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Navigate to LoginScreen after 3 seconds.
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue, // Set your desired background color
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // App logo or icon.
            Icon(
              Icons.social_distance, // Replace with your app's logo/icon
              size: 100,
              color: Colors.white,
            ),
            SizedBox(height: 16),
            // App name or tagline.
            Text(
              "My Social App",
              style: TextStyle(
                fontSize: 24.sp, // Use ScreenUtil for responsive text size
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
