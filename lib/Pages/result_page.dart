// File: result_page.dart
// Author: Oluwasegun Adekola
// Date: 2023-12-21
// Description: This file contains a Dart script that handles the UI of the results page for the BMI calculator app.

// Import necessary packages and libraries
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:scientific_calculator/Components/ract_button.dart';
import 'package:scientific_calculator/Controllers/bmi_controller.dart';

// ResultPage widget responsible for displaying the BMI calculation results
class ResultPage extends StatelessWidget {
  const ResultPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Get the BMIController instance to access BMI-related data
    BMIController bmiConroller = Get.put(BMIController());
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(result_header,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
        ),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SafeArea(
          child: Column(
            children: [
              const Row(
                /*children: [
                  Icon(
                    Icons.arrow_back_ios_new,
                    size: 20,
                  ),
                  Text("Back"),
                ],*/
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  // Display "Your BMI is" text
                  Obx(() =>  Text(
                    "Your BMI is",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 28,
                      color: bmiConroller.colorStatus.value,
                    ),
                  ),)
                ],
              ),
              const SizedBox(height: 10),
              Expanded(
                child: SizedBox(
                  height: 350,
                  child: Obx(() => CircularPercentIndicator(
                    animationDuration: 1000,
                    footer: Text(
                      bmiConroller.BMIstatus.value,
                      style: TextStyle(
                          color:  bmiConroller.colorStatus.value,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,),
                    ),
                    radius: 130,
                    lineWidth: 30,
                    animation: true,
                    circularStrokeCap: CircularStrokeCap.round,
                    percent: bmiConroller.tempBMI.value /100,
                  
                    center:  Text(
                      "${bmiConroller.BMI.value}%",
                      style: TextStyle(
                          color:  bmiConroller.colorStatus.value,
                          fontSize: 60,
                          fontWeight: FontWeight.bold),
                    ),
                    progressColor: bmiConroller.colorStatus.value,
                    backgroundColor:
                         bmiConroller.colorStatus.value.withOpacity(0.2),
                  ),)
                ),
              ),
              const SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primaryContainer,
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.all(10),
                child:const Text(
                    "For your weight to be in the normal category, your BMI should be between 18.6% -24.8% . Maintaining an optimal weight can potentially decrease the likelihood of developing chronic illnesses linked to being overweight or obese."),
              ),
              const SizedBox(height: 20),
              // Button to navigate back to the previous screen
              MyRactButton(
                onPress: () {
                  Get.back();
                },
                btnName: "Find Out More",
                icon: Icons.arrow_back_ios_new_outlined,
              )
            ],
          ),
        ),
      ),
    );
  }
}