import 'package:flutter/material.dart';

extension MediaQueryValues on BuildContext {
  // Get MediaQuery directly
  MediaQueryData get mediaQuery => MediaQuery.of(this);

  // Screen dimensions
  double get screenWidth => mediaQuery.size.width;
  double get screenHeight => mediaQuery.size.height;

  // Screen orientation
  bool get isLandscape => mediaQuery.orientation == Orientation.landscape;
  bool get isPortrait => mediaQuery.orientation == Orientation.portrait;

  // Safe area values
  double get statusBarHeight => mediaQuery.padding.top;
  double get bottomBarHeight => mediaQuery.padding.bottom;
  double get keyboardHeight => mediaQuery.viewInsets.bottom;

  // Device type detection
  bool get isTablet => screenWidth >= 600;
  bool get isMobile => screenWidth < 600;
  bool get isDesktop => screenWidth >= 1200;

  // Responsive sizing
  double responsiveWidth(double percentage) => screenWidth * (percentage / 100);
  double responsiveHeight(double percentage) =>
      screenHeight * (percentage / 100);

  // Text scaling
  TextScaler get textScaler => mediaQuery.textScaler;

  // Brightness
  Brightness get platformBrightness => mediaQuery.platformBrightness;
  bool get isDarkMode => platformBrightness == Brightness.dark;
}
