import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:unoapp/core/application_style/app_text_style.dart';
import 'package:unoapp/core/application_style/app_button_styles.dart';
import 'package:unoapp/core/application_theme/color.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SvgPicture.asset(
                    'assets/icons/location.svg',
                    width: 20,
                    height: 20,
                  ),
                  const SizedBox(width: 6),
                  const Text('Gold Coast', style: AppTextStyles.headerLabel),
                  const SizedBox(width: 10), // Added spacing
                  SvgPicture.asset(
                    'assets/icons/expand.svg',
                    width: 4,
                    height: 6,
                  ),
                ],
              ),
              GestureDetector(
                onTap: () {},
                child: SvgPicture.asset(
                  'assets/icons/menu.svg',
                  width: 20,
                  height: 20,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0),
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(color: AppColors.noticeBackgroundColor),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'We\'re showing rental items available in Gold Coast. Availability and prices may vary by location. Update your location for more accurate results.',
                  style: AppTextStyles.texts,
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () {},
                        style: AppButtonStyles.leftButtonOfHeader,
                        child: const Text(
                          'Location is correct',
                          style: AppTextStyles.buttonLabelLeft,
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {},
                        style: AppButtonStyles.rightButtonOfHeader,
                        child: const Text(
                          'Change Location',
                          style: AppTextStyles.buttonLabelRight,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
