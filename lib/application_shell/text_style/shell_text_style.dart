import 'package:flutter/material.dart';
import 'package:unoapp/gen/colors.gen.dart';

class ShellTextStyles {
  // Banner text style
  static const TextStyle bannerText = TextStyle(
    fontFamily: 'PublicSans',
    fontWeight: FontWeight.w500,
    fontSize: 12,
    height: 20 / 12,
    letterSpacing: 0,
    color: Colors.white,
  );

  // Sign In button text style
  static const TextStyle signInButtonText = TextStyle(
    fontFamily: 'PublicSans',
    fontWeight: FontWeight.w500,
    fontSize: 12,
    color: Colors.white,
  );

  // Nav item label style (default)
  static const TextStyle navItemLabel = TextStyle(
    fontFamily: 'PublicSans',
    fontWeight: FontWeight.w500,
    fontSize: 12,
    letterSpacing: 0,
    color: ColorName.navItemInactive, // Default gray color
  );

  // Nav item label style (selected)
  static const TextStyle navItemLabelSelected = TextStyle(
    fontFamily: 'PublicSans',
    fontWeight: FontWeight.w600,
    fontSize: 12,
    letterSpacing: 0,
    color: ColorName.navItemActive, // Using generated color (#D42B65)
  );
}
