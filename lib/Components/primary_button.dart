// File: primary_button.dart
// Author: Oluwasegun Adekola
// Date: 2023-12-21
// Description: This file contains a Dart script that handles the primary button for gender selection in the BMI app.


// Import necessary packages and libraries
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scientific_calculator/Controllers/bmi_controller.dart';

// PrimaryButton widget responsible for displaying and handling gender selection
class PrimaryButton extends StatelessWidget {
  final IconData icon;
  final String btnName;
  final VoidCallback onPress;
  const PrimaryButton(
      {super.key,
      required this.icon,
      required this.btnName,
      required this.onPress});

  @override
  Widget build(BuildContext context) {
    // Get the BMIController instance to manage BMI-related state
    BMIController bmiConroller = Get.put(BMIController());
    return Expanded(
      child: InkWell(
          onTap: onPress,
          child: Obx(
            () => Container(
              height: 50,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: bmiConroller.Gender.value == btnName
                      ? Theme.of(context).colorScheme.primary
                      : Theme.of(context).colorScheme.primaryContainer),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(icon,
                      color: bmiConroller.Gender.value == btnName
                          ? Theme.of(context).colorScheme.primaryContainer
                          : Theme.of(context).colorScheme.primary),
                  const SizedBox(width: 10),
                  Text(
                    btnName,
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.5,
                        color: bmiConroller.Gender.value == btnName
                            ? Theme.of(context).colorScheme.primaryContainer
                            : Theme.of(context).colorScheme.primary),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}