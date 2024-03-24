// File: theme.dart
// Author: Oluwasegun Adekola
// Date: 2023-12-21
// Description: This file contains a Dart script that defines light and dark themes for the BMI app.


// Import necessary packages and libraries
import 'package:flutter/material.dart';
import 'package:scientific_calculator/Config/colors.dart';

// Define the light theme using ThemeData
var lightTheme = ThemeData(
  useMaterial3: true,
  colorScheme: const ColorScheme.light(
    background: lbgcolor,
    primary: lprimarycolor,
    onBackground: lfontcolor,
    primaryContainer: ldivcolor,
    onPrimaryContainer: lfontcolor,
    onSecondaryContainer: llablecolor,
  ),
);

// Define the dark theme using ThemeData
var darkTheme = ThemeData(
  useMaterial3: true,
  colorScheme: const ColorScheme.dark(
    background: dbgcolor,
    primary: dprimarycolor,
    onBackground: dfontcolor,
    primaryContainer: ddivcolor,
    onPrimaryContainer: dfontcolor,
    onSecondaryContainer: dlablecolor,
  ),
);