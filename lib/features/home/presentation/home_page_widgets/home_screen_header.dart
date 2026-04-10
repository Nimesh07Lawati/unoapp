import 'package:flutter/material.dart';
import 'package:unoapp/features/home/presentation/home_page_styling/app_text_style.dart';
import 'package:unoapp/features/home/presentation/home_page_styling/app_button_styles.dart';
import 'package:unoapp/core/application_theme/color.dart';
import 'package:unoapp/gen/assets.gen.dart'; // Import generated assets

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
                  // Use Assets.icons.location.svg()
                  Assets.icons.location.svg(width: 20, height: 20),
                  const SizedBox(width: 6),
                  const Text('Gold Coast', style: AppTextStyles.headerLabel),
                  const SizedBox(width: 10),
                  // Use Assets.icons.expand.svg()
                  Assets.icons.expand.svg(width: 4, height: 6),
                ],
              ),
              GestureDetector(
                onTap: () {},
                // Use Assets.icons.menu.svg()
                child: Assets.icons.menu.svg(width: 20, height: 20),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        Container(
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
      ],
    );
  }
}
