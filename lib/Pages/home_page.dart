// File: home_page.dart
// Author: Oluwasegun Adekola
// Date: 2023-12-21
// Description: This file contains a Dart script that handles the UI of the home page for the BMI calculator app.


// Import necessary packages and libraries
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scientific_calculator/Components/age_selector.dart';
import 'package:scientific_calculator/Components/height_selector.dart';
import 'package:scientific_calculator/Components/primary_button.dart';
import 'package:scientific_calculator/Components/ract_button.dart';
import 'package:scientific_calculator/Components/theme_change_button.dart';
import 'package:scientific_calculator/Components/weight_selector.dart';
import 'package:scientific_calculator/Controllers/bmi_controller.dart';
import 'package:scientific_calculator/Pages/result_page.dart';

// HomePage widget responsible for displaying the main BMI calculator interface
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Get the BMIController instance to access BMI-related data
    BMIController bmiConroller = Get.put(BMIController());

    var screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              // Button to change the app theme
              const ThemeChangeBtn(),
              Row(
                children: [
                  // Welcome message
                  Text(
                    "Welcome 😊",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onSecondaryContainer,
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  // BMI Calculator title
                  Text(
                    "BMI Calculator",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
                  )
                ],
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  // Primary buttons for selecting gender (MALE/FEMALE)
                  PrimaryButton(
                    onPress: () {
                      bmiConroller.genderHandle("MALE");
                    },
                    icon: Icons.male,
                    btnName: "MALE",
                  ),
                  const SizedBox(width: 20),
                  PrimaryButton(
                    onPress: () {
                      bmiConroller.genderHandle("FEMALE");
                    },
                    icon: Icons.female,
                    btnName: "FEMALE",
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Selector for choosing height
                    HeightSelector(),
                    SizedBox(width: 20),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // Selector for choosing weight
                            WeightSelector(),
                            SizedBox(
                              height: screenSize.height/9,
                            ),
                            // Selector for choosing age
                            AgeSelector(),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 20),
              MyRactButton(
                onPress: () {
                  bmiConroller.CalculateBMI();
                  Get.to(() => ResultPage());
                  // Get.to(const ResultPage());
                },
                btnName: "REVEAL BMI",
                icon: Icons.done_all_rounded,
              )
            ],
          ),
        ),
      ),
    );
  }
}