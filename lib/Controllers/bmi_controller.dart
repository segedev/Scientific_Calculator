// File: bmi_controller.dart
// Author: Oluwasegun Adekola
// Date: 2023-12-21
// Description: This file contains a Dart script that handles BMI calculations and conditions for result interpretation.


// ignore_for_file: non_constant_identifier_names

// Import necessary packages and libraries
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

// Global variable to store result header text
String result_header = '';

// BMI Controller class responsible for managing BMI calculations and state
class BMIController extends GetxController {
  // Observable variables using GetX for automatic UI updates
  RxString Gender = "MALE".obs;
  RxDouble weight = 12.0.obs;
  RxInt age = 12.obs;
  RxDouble height = 100.0.obs;
  RxString BMI = "".obs;
  RxDouble tempBMI = 0.0.obs;
  RxString BMIstatus = "".obs;
  Rx<Color> colorStatus = const Color(0xff246AFE).obs;


  // Method to handle gender selection
  void genderHandle(String gender) {
    Gender.value = gender;
  }

  // Method to perform BMI calculation
  void CalculateBMI() {
    // Calculate BMI using weight and height
    var Hmeter = height/100;
    tempBMI.value = weight / (Hmeter*Hmeter);

    // Handle extremely high BMI values
    if (tempBMI.value > 100) {
      tempBMI.value = 100.0;
      BMIstatus.value = "Extremely Obese";
      colorStatus.value = const Color(0xff000000);
      result_header = 'Your Results😥';
    } 
    else {
      // Format BMI value and update status
      BMI.value = tempBMI.toStringAsFixed(1);
      tempBMI.value = double.parse(BMI.value);
      findStatus();
      // Print BMI for debugging
      // ignore: avoid_print
      print(BMI);
    }
  }

  // Method to determine BMI status and update UI elements
  void findStatus() 
  {
    if(tempBMI.value <18.5)
    {
      BMIstatus.value = "UnderWeight";
      colorStatus.value = const Color(0xffFFB800);
      result_header = 'Your Results😌';
    }
    if(tempBMI.value >18.5 && tempBMI.value <24.9 )
    {
      BMIstatus.value = "Normal";
      colorStatus.value = const Color(0xff00CA39);
      result_header = 'Your Results🤗';
    }
    if(tempBMI.value >25.0 && tempBMI.value <29.9 )
    {
      BMIstatus.value = "OverWeight";
      colorStatus.value = const Color(0xffFF5858);
      result_header = 'Your Results☹';
    }
    if(tempBMI.value >30.0 && tempBMI.value <34.9 )
    {
      BMIstatus.value = "OBESE";
      colorStatus.value = const Color(0xffFF0000);
      result_header = 'Your Results😓';
    }
    if(tempBMI.value > 35.0)
    {
      BMIstatus.value = "Extremely OBESE";
      colorStatus.value = const Color(0xff000000);
      result_header = 'Your Results😥';
    }
  }
}