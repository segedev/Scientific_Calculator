// File: sec_button.dart
// Author: Oluwasegun Adekola
// Date: 2023-12-21
// Description: This file contains a Dart script that handles sectional buttons for the BMI app.


// Import necessary packages and libraries
import 'package:flutter/material.dart';

// SecBtn widget responsible for displaying and handling sectional buttons
class SecBtn extends StatelessWidget {
  final VoidCallback onpress;
  final IconData icon;
  const SecBtn({super.key, required this.onpress, required this.icon});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onpress,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(
          icon,
          color: Theme.of(context).colorScheme.primaryContainer,
          size: 25,
        ),
      ),
    );
  }
}