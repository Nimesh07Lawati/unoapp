import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:unoapp/core/application_style/app_text_style.dart';

class PartyHireSection extends StatelessWidget {
  const PartyHireSection({super.key});

  static const List<Map<String, dynamic>> partyItems = [
    {
      'title': 'Luxury Yacht',
      'discount': '32% OFF',
      'price': '499',
      'subcategory': 'Venues',
      'location': 'Gold Coast',
      'image': 'assets/images/yacht.jpg',
    },
    {
      'title': 'Photo Booth',
      'discount': '15% OFF',
      'price': '79',
      'subcategory': 'Entertainment',
      'location': 'Robina',
      'image': 'assets/images/product_camera.jpg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Party Hire Under \$99',
                  style: AppTextStyles.sectionLabelLeft,
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    width: 32,
                    height: 32,
                    decoration: BoxDecoration(
                      color: const Color(0xFF292D32).withOpacity(0.12),
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: SvgPicture.asset(
                        'assets/icons/arrow-right.svg',
                        width: 16,
                        height: 16,
                        colorFilter: const ColorFilter.mode(
                          Color(0xFF292D32),
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: 344,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: partyItems.length,
              itemBuilder: (context, index) {
                final item = partyItems[index];

                return Container(
                  width: 216,
                  margin: const EdgeInsets.symmetric(horizontal: 8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          ClipRRect(
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(12),
                              topRight: Radius.circular(12),
                              bottomLeft: Radius.circular(12),
                              bottomRight: Radius.circular(12),
                            ),
                            child: Image.asset(
                              item['image'] as String,
                              height: 216,
                              width: 216,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                return Container(
                                  height: 216,
                                  width: 216,
                                  color: const Color(0xFFF0F0F0),
                                  child: const Icon(
                                    Icons.celebration,
                                    color: Color(0xFFCCCCCC),
                                  ),
                                );
                              },
                            ),
                          ),

                          // ✅ Discount badge — flat left, rounded right, flush to left edge
                          Positioned(
                            top: 12,
                            left: 0, // ✅ Flush to left edge
                            child: Container(
                              width: 73, // ✅ Figma width
                              height: 29, // ✅ Figma height
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10, // ✅ Figma padding-right/left
                                vertical: 5, // ✅ Figma padding-top/bottom
                              ),
                              decoration: const BoxDecoration(
                                color: Color(0xFFD42B65), // ✅ Figma color
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(
                                    47.4,
                                  ), // ✅ Figma border-top-right-radius
                                  bottomRight: Radius.circular(
                                    47.4,
                                  ), // ✅ Figma border-bottom-right-radius
                                  topLeft: Radius.zero, // ✅ Flat left edge
                                  bottomLeft: Radius.zero, // ✅ Flat left edge
                                ),
                              ),
                              child: Text(
                                item['discount'] as String,
                                style: const TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item['title'] as String,
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF1A1A1A),
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 4),
                            Text(
                              item['subcategory'] as String,
                              style: const TextStyle(
                                fontSize: 12,
                                color: Color(0xFF101B30),
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 4),
                            Text(
                              item['location'] as String,
                              style: const TextStyle(
                                fontSize: 12,
                                color: Color(0xFF9E9E9E),
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'From \$${item['price']}/day',
                              style: const TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFFD42B65),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
