import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MostPopularSection extends StatelessWidget {
  const MostPopularSection({super.key});

  final List<Map<String, dynamic>> popularItems = const [
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
                onTap: () {},
                child: SvgPicture.asset(
                  'assets/icons/arrow-right.svg',
                  width: 16,
                  height: 16,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 344, // ✅ Figma card height
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: popularItems.length,
            itemBuilder: (context, index) {
              final item = popularItems[index];
              return Container(
                width: 216, // ✅ Figma card width
                margin: const EdgeInsets.symmetric(
                  horizontal: 6,
                ), // ✅ gap: 12px
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        ClipRRect(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(
                              12,
                            ), // ✅ Figma image border-radius
                            topRight: Radius.circular(12),
                          ),
                          child: Image.asset(
                            item['image'] as String,
                            height: 216, // ✅ Figma image height
                            width: 216, // ✅ Figma image width
                            fit: BoxFit.cover,
                            errorBuilder: (c, e, s) => Container(
                              height: 216,
                              width: 216,
                              color: const Color(0xFFF0F0F0),
                              child: const Icon(
                                Icons.celebration,
                                color: Color(0xFFCCCCCC),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 8,
                          left: 8,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: const Color(0xFFE67E22),
                              borderRadius: BorderRadius.circular(8),
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
                      padding: const EdgeInsets.all(12), // ✅ gap: 12px
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
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF101B30),
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            item['location'] as String,
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFF9E9E9E),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'From \$${item['price']}/day',
                            style: const TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFFE67E22),
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
    );
  }
}
