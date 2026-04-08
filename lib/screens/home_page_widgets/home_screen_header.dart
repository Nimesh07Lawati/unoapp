import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
              // Location icon + label
              Row(
                children: [
                  SvgPicture.asset(
                    'assets/icons/location.svg',
                    width: 20,
                    height: 20,
                  ),
                  const SizedBox(width: 6),
                  const Text(
                    'Gold Coast',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1A1A1A),
                    ),
                  ),
                ],
              ),

              // Menu SVG icon
              GestureDetector(
                onTap: () {
                  // Handle menu tap
                },
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

        // Location info card
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color(0xFFD1E0FF),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: const Color(0xFFB8CEFF), width: 1),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Gold Coast',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF101B30),
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'We\'re showing rental items available in Gold Coast. Availability and prices may vary by location. Update your location for more accurate results.',
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF2E3F60),
                    height: 1.4,
                  ),
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () {},
                        style: OutlinedButton.styleFrom(
                          foregroundColor: const Color(0xFF101B30),
                          side: const BorderSide(color: Color(0xFF101B30)),
                          backgroundColor: Colors.transparent,
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: const Text(
                          'Location is correct',
                          style: TextStyle(fontSize: 13),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: const Color(0xFF101B30),
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: const Text(
                          'Change Location',
                          style: TextStyle(fontSize: 13),
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
