import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:unoapp/core/application_style/app_text_style.dart';
import 'package:go_router/go_router.dart'; // Add this import for navigation

class MostPopularSection extends StatelessWidget {
  const MostPopularSection({super.key});

  static const List<Map<String, dynamic>> popularItems = [
    {
      'title': 'Premium Sound System',
      'discount': '32% OFF',
      'price': '99',
      'subcategory': 'Audio & Music',
      'location': 'Surfers Paradise',
      'image': 'assets/images/product_camera.jpg',
    },
    {
      'title': 'LED Dance Floor',
      'discount': '25% OFF',
      'price': '149',
      'subcategory': 'Lighting & Decor',
      'location': 'Broadbeach',
      'image': 'assets/application_images/dining_hall.jpg',
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
                Row(
                  children: [
                    SvgPicture.asset(
                      'assets/icons/growth_arrow.svg',
                      width: 22,
                      height: 22,
                    ),
                    const SizedBox(width: 8),
                    const Text(
                      'Most Popular',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF1A1A1A),
                      ),
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    context.push('/gridcards');
                  },
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
              itemCount: popularItems.length,
              itemBuilder: (context, index) {
                final item = popularItems[index];

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

                          // Discount badge — flat left, rounded right, anchored to left edge
                          Positioned(
                            top: 12,
                            left: 0,
                            child: Container(
                              width: 73,
                              height: 29,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 5,
                              ),
                              decoration: const BoxDecoration(
                                color: Color(0xFFD42B65),
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(47.4),
                                  bottomRight: Radius.circular(47.4),
                                  topLeft: Radius.zero,
                                  bottomLeft: Radius.zero,
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
                              style: AppTextStyles.cardTitle,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 4),
                            Text(
                              item['subcategory'] as String,
                              style: AppTextStyles.cardSubtitle,
                            ),
                            const SizedBox(height: 4),
                            // Location row with icon
                            Row(
                              children: [
                                const Icon(
                                  Icons.location_on_outlined,
                                  size: 14,
                                  color: Color(0xFF8A8A8A),
                                ),
                                const SizedBox(width: 4),
                                Expanded(
                                  child: Text(
                                    item['location'] as String,
                                    style: AppTextStyles.cardLocation,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'From \$${item['price']}/day',
                              style: AppTextStyles.priceLabel,
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
