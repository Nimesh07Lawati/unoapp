import 'package:flutter/material.dart';

extension MediaQueryValues on BuildContext {
  // Get MediaQuery directly
  MediaQueryData get mediaQuery => MediaQuery.of(this);

  // Screen dimensions
  double get screenWidth => MediaQuery.of(this).size.width;
  double get screenHeight => MediaQuery.of(this).size.height;

  // Screen orientation
  bool get isLandscape =>
      MediaQuery.of(this).orientation == Orientation.landscape;
  bool get isPortrait =>
      MediaQuery.of(this).orientation == Orientation.portrait;

  // Safe area values
  double get statusBarHeight => MediaQuery.of(this).padding.top;
  double get bottomBarHeight => MediaQuery.of(this).padding.bottom;
  double get keyboardHeight => MediaQuery.of(this).viewInsets.bottom;

  // Device type detection
  bool get isTablet => screenWidth >= 600;
  bool get isMobile => screenWidth < 600;
  bool get isDesktop => screenWidth >= 1200;

  // Responsive sizing
  double responsiveWidth(double percentage) => screenWidth * (percentage / 100);
  double responsiveHeight(double percentage) =>
      screenHeight * (percentage / 100);

  // Text scaling
  double get textScaleFactor => MediaQuery.of(this).textScaleFactor;

  // Brightness
  Brightness get platformBrightness => MediaQuery.of(this).platformBrightness;
  bool get isDarkMode => platformBrightness == Brightness.dark;
}
