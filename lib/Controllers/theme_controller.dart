// File: theme_controller.dart
// Author: Oluwasegun Adekola
// Date: 2023-12-21
// Description: This file contains a Dart script that handles changing themes in the BMI app.


// Import necessary packages and libraries
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// Theme Controller class responsible for managing app themes
class ThemeController extends GetxController {
  // Observable variable to track the current theme mode
  RxBool isDark = false.obs;

  // Method to toggle between light and dark themes
  void changeTheme() async {
    // Toggle the theme mode
    isDark.value = !isDark.value;

    // Change the app's theme mode based on the current value of isDark
    Get.changeThemeMode(isDark.value ? ThemeMode.dark : ThemeMode.light);
  }
}