// File: weight_selector.dart
// Author: Oluwasegun Adekola
// Date: 2023-12-21
// Description: This file contains a Dart script that handles weight selection for the BMI app.


// Import necessary packages and libraries
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scientific_calculator/Components/sec_button.dart';
import 'package:scientific_calculator/Controllers/bmi_controller.dart';

// WeightSelector widget responsible for displaying and handling weight selection
class WeightSelector extends StatelessWidget {
  const WeightSelector({Key? key});

  @override
  Widget build(BuildContext context) {
    // Get the BMIController instance to manage BMI-related state
    BMIController bmiController = Get.put(BMIController());
    TextEditingController weightController = TextEditingController();

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
                "Weight (kg)",
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
                  controller: weightController,
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    // Update weight value when the user types into the text field
                    bmiController.weight.value = double.tryParse(value) ?? 0;
                  },
                  style: TextStyle(
                    fontSize: 55,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "${bmiController.weight.value}",
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Button to increment weight
              SecBtn(
                onpress: () {
                  // Increment weight when the "+" button is pressed
                  bmiController.weight.value++;
                  weightController.text = bmiController.weight.value.toString();
                },
                icon: Icons.add,
              ),

              // Button to decrement weight
              SecBtn(
                onpress: () {
                  // Decrement weight when the "-" button is pressed
                  if (bmiController.weight.value > 0) {
                    bmiController.weight.value--;
                    weightController.text = bmiController.weight.value.toString();
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
