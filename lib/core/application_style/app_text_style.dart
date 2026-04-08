import 'package:flutter/material.dart';

class AppTextStyles {
  static const TextStyle headerLabel = TextStyle(
    fontFamily: 'PublicSans',
    fontWeight: FontWeight.w600,
    fontSize: 18,
    height: 22 / 18, // line-height ÷ font-size
    letterSpacing: 0,
    color: Color(0xFF101B30),
  );

  static const TextStyle buttonLabel = TextStyle(
    fontFamily: 'PublicSans',
    fontWeight: FontWeight.w500,
    fontSize: 14,
    height: 22 / 14, // line-height ÷ font-size
    letterSpacing: 0,
    color: Color(0xFFFFFFFF),
  );

  static const TextStyle sectionLabelLeft = TextStyle(
    fontFamily: 'PublicSans',
    fontWeight: FontWeight.w700,
    fontSize: 20,
    height: 24 / 20, // line-height ÷ font-size
    letterSpacing: 0,
    color: Color(0xFF101B30),
  );
  static const TextStyle sectionLabelRight = TextStyle(
    fontFamily: 'PublicSans',
    fontWeight: FontWeight.w500,
    fontSize: 14,
    height: 22 / 14, // line-height ÷ font-size
    letterSpacing: 0,
    color: Color(0xFFD42B65),
  );
  static const TextStyle caption = TextStyle(
    fontFamily: 'PublicSans',
    fontWeight: FontWeight.w400,
    fontSize: 12,
    height: 20 / 12, // line-height ÷ font-size
    letterSpacing: 0,
    color: Color(0xFF101B30),
  );
}
