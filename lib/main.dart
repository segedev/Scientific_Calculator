// File: main.dart
// Author: Oluwasegun Adekola
// Date: 2023-12-21
// Description: This file contains the main Dart script for the BMI calculator app.


// Import necessary packages and libraries
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scientific_calculator/Config/theme.dart';
import 'package:scientific_calculator/Pages/splash_screen.dart';

// The entry point of the application
void main() {
  runApp(const MyApp());
}


// MyApp widget, which represents the main application
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Initialize and configure the GetX state management system
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BMI CALCULATOR',
      theme: lightTheme,  // Set the light theme
      darkTheme: darkTheme,  // Set the dark theme
      home: const SplashScreen(),  // Set the initial screen to the SplashScreen
    );
  }
}