// File: age_selector.dart
// Author: Oluwasegun Adekola
// Date: 2023-12-21
// Description: This file contains a Dart script that handles age selection for the BMI app.


// Import necessary packages and libraries
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scientific_calculator/Components/sec_button.dart';
import 'package:scientific_calculator/Controllers/bmi_controller.dart';

// AgeSelector widget responsible for displaying and handling age selection
class AgeSelector extends StatelessWidget {
  const AgeSelector({super.key});

  @override
  Widget build(BuildContext context) {
    // Get the BMIController instance to manage BMI-related state
    BMIController bmiController = Get.put(BMIController());
    TextEditingController ageController = TextEditingController();

    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Theme.of(context).colorScheme.primaryContainer,
      ),
      height: 200,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Age",
                style: TextStyle(
                  fontSize: 15,
                  color: Theme.of(context).colorScheme.onSecondaryContainer,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: TextFormField(
                  textAlign: TextAlign.center,
                  controller: ageController,
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    // Update age value when the user types into the text field
                    bmiController.age.value = int.tryParse(value) ?? 0;
                  },
                  style: TextStyle(
                    fontSize: 55,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "${bmiController.age.value}",
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Button to increment age
              SecBtn(
                onpress: () {
                  // Increment age when the "+" button is pressed
                  bmiController.age.value++;
                  ageController.text = bmiController.age.value.toString();
                },
                icon: Icons.add,
              ),

              // Button to decrement age
              SecBtn(
                onpress: () {
                  // Decrement weight when the "-" button is pressed
                  if (bmiController.age.value > 0) {
                    bmiController.age.value--;
                    ageController.text = bmiController.age.value.toString();
                  }
                },
                icon: Icons.minimize,
              )
            ],
          ),
        ],
      ),
    );
  }
}