// File: theme_change_button.dart
// Author: Oluwasegun Adekola
// Date: 2023-12-21
// Description: This file contains a Dart script that handles the theme changing button for the BMI app.


// ignore_for_file: deprecated_member_use

// Import necessary packages and libraries
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:scientific_calculator/Controllers/theme_controller.dart';

// ThemeChangeBtn widget responsible for displaying and handling the theme changing button
class ThemeChangeBtn extends StatelessWidget {
  const ThemeChangeBtn({super.key});

  @override
  Widget build(BuildContext context) {
    // Get the ThemeController instance to manage app themes
    ThemeController themeController = Get.put(ThemeController());
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primaryContainer,
            borderRadius: BorderRadius.circular(15),
          ),
          child: InkWell(
            onTap: () {
              // Change the theme when the button is tapped
              themeController.changeTheme();
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SvgPicture.asset(
                  "assets/icons/light.svg",
                  color: themeController.isDark.value
                      ? Theme.of(context).colorScheme.onSecondaryContainer
                      : Theme.of(context).colorScheme.primary,
                ),
                const SizedBox(
                  width: 20,
                ),
                SvgPicture.asset(
                  "assets/icons/dark.svg",
                  color: themeController.isDark.value
                      ? Theme.of(context).colorScheme.primary
                      : Theme.of(context).colorScheme.onSecondaryContainer,
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}