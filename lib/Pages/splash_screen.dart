// File: splash_screen.dart
// Author: Oluwasegun Adekola
// Date: 2023-12-21
// Description: This file contains a Dart script for the splash screen of the BMI calculator app.


// Import necessary packages and libraries
import 'package:flutter/material.dart';
import 'package:scientific_calculator/Config/colors.dart';
import 'package:scientific_calculator/Pages/home_page.dart';

// SplashScreen widget displays a splash screen during app initialization
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Simulate some initialization process (e.g., fetching data)
    Future.delayed(
      const Duration(
        seconds: 4,
      ), () {
      // Navigate to the main screen after the splash screen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomePage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lbgcolor,
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            const Spacer(),
            // Display the BMI image
            ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              child: Image.asset('assets/images/BMI.jpg'),
            ),
            const Text(
              'BMI CALCULATOR',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: lprimarycolor,
              ),
            ),
            // Description of the app
            Text(
              'Empower your journey to wellness with precision. Know your numbers, own your health. Discover your BMI, embrace a healthier you.',
              style: TextStyle(
                fontSize: 15,
                fontStyle: FontStyle.italic,
                color: Theme.of(context).colorScheme.onSecondaryContainer,
              ),
            ),
            const SizedBox(
              height: 200,
            ),
            // Display the developer's name
            const Text(
              'Sege_Dev',
              style: TextStyle(
                fontSize: 10,
                fontStyle: FontStyle.normal,
                color: lprimarycolor,
                fontWeight: FontWeight.w800,
              ),
            ),
          ],
        ),
      ),
    );
  }
}