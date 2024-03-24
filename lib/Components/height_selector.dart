// File: height_selector.dart
// Author: Oluwasegun Adekola
// Date: 2023-12-21
// Description: This file contains a Dart script that handles height selection for the BMI app.


// Import necessary packages and libraries
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scientific_calculator/Controllers/bmi_controller.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

// HeightSelector widget responsible for displaying and handling height selection
class HeightSelector extends StatelessWidget {
  const HeightSelector({super.key});

  @override
  Widget build(BuildContext context) {
    // Get the BMIController instance to manage BMI-related state
    BMIController bmiConroller = Get.put(BMIController());
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Theme.of(context).colorScheme.primaryContainer,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Height (CM)",
                  style: TextStyle(
                    fontSize: 15,
                    color: Theme.of(context).colorScheme.onSecondaryContainer,
                  ),
                ),
              ],
            ),
            Expanded(
                child: Obx(
              () => SfSlider.vertical(
                min: 50,
                max: 250,
                value: bmiConroller.height.value,
                interval: 25,
                showTicks: true,
                showLabels: true,
                enableTooltip: true,
                minorTicksPerInterval: 5,
                activeColor: Theme.of(context).colorScheme.primary,
                inactiveColor:
                    Theme.of(context).colorScheme.primary.withOpacity(0.2),
                onChanged: (dynamic value) {
                  // Update height value when the slider is adjusted
                  bmiConroller.height.value = value;
                },
              ),
            ))
          ],
        ),
      ),
    );
  }
}