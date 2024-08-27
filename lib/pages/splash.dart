import 'dart:async';

import 'package:flutter/material.dart';
import 'package:school_apn/pages/home.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Start the timer for 1.5 seconds
    Timer(Duration(seconds: 1, milliseconds: 500), () {
      // After the timer, navigate to the next screen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()
        
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // First Layer: Fullscreen Image
          Positioned.fill(
            child: Image.asset(
              'assets/images/splash.png',
              fit: BoxFit.cover,
            ),
          ),
          // Second Layer: Semi-transparent Dark Overlay
          Positioned.fill(
            child: Container(
              color:
                  Colors.black.withOpacity(0.5), // Dark color with 50% opacity
            ),
          ),
          // Third Layer: Text Positioned in the Middle Left
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 20.0), // Add padding from the left
              child: Text(
                'Menyediakan Informasi Terbaik untuk Anda',
                style: TextStyle(
                  color: Colors.white, // Text color
                  fontSize: 32, // Font size
                  fontWeight: FontWeight.normal, // Font weight
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
