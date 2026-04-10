import 'package:flutter/material.dart';

class AppButtonStyles {
  // Common border radius for buttons
  static final BorderRadius _borderRadius = BorderRadius.circular(10);

  // Style for "Location is correct"
  static final ButtonStyle leftButtonOfHeader = OutlinedButton.styleFrom(
    backgroundColor: const Color(0xFFF4F5F7),
    padding: const EdgeInsets.symmetric(vertical: 10),
    shape: RoundedRectangleBorder(borderRadius: _borderRadius),
    side: const BorderSide(color: Color(0xFFFFFFFF), width: 0),
  );

  // Style for "Change Location"
  static final ButtonStyle rightButtonOfHeader = ElevatedButton.styleFrom(
    foregroundColor: Colors.white,
    backgroundColor: const Color(0xFF101B30),
    padding: const EdgeInsets.symmetric(vertical: 10),
    shape: RoundedRectangleBorder(borderRadius: _borderRadius),
  );
}
