import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart'; // Ensure flutter_svg is imported

class MostPopularSection extends StatelessWidget {
  const MostPopularSection({super.key});

  final List<Map<String, dynamic>> popularItems = const [
    {
      'title': 'Premium Sound System',
      'discount': '32% OFF',
      'price': '99',
      'subcategory': 'Audio & Music',
      'location': 'Surfers Paradise',
      'image': 'assets/images/product_camera.jpg', // Using your requested image
    },
    {
      'title': 'LED Dance Floor',
      'discount': '25% OFF',
      'price': '149',
      'subcategory': 'Lighting & Decor',
      'location': 'Broadbeach',
      'image':
          'assets/application_images/dining_hall.jpg', // Using your requested image
    },
    {
      'title': 'Photo Booth',
      'discount': '15% OFF',
      'price': '79',
      'subcategory': 'Entertainment',
      'location': 'Robina',
      'image': 'assets/images/product_camera.jpg', // Alternating images
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
                onTap: () {
                  // Handle see all
                },
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
          height: 220,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: popularItems.length,
            itemBuilder: (context, index) {
              final item = popularItems[index];
              return Container(
                width: 160,
                margin: const EdgeInsets.symmetric(horizontal: 4),
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
                            topLeft: Radius.circular(16),
                            topRight: Radius.circular(16),
                          ),
                          child: Image.asset(
                            item['image'] as String,
                            height: 110,
                            width: double.infinity,
                            fit: BoxFit.cover,
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
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item['title'] as String,
                            style: const TextStyle(
                              fontSize: 13,
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
                              fontSize: 11,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF101B30),
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            item['location'] as String,
                            style: const TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFF9E9E9E),
                            ),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            'From \$${item['price']}/day',
                            style: const TextStyle(
                              fontSize: 12,
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
