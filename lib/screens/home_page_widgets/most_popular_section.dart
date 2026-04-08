import 'package:flutter/material.dart';

class MostPopularSection extends StatelessWidget {
  const MostPopularSection({super.key});

  final List<Map<String, dynamic>> popularItems = const [
    {
      'title': 'Premium Sound System',
      'discount': '32% OFF',
      'price': '99',
      'subcategory': 'Audio & Music',
      'location': 'Surfers Paradise',
      'image': 'assets/images/vintage_sound_system.jpg',
    },
    {
      'title': 'LED Dance Floor',
      'discount': '25% OFF',
      'price': '149',
      'subcategory': 'Lighting & Decor',
      'location': 'Broadbeach',
      'image': 'assets/images/led_dance_floor.jpg',
    },
    {
      'title': 'Photo Booth',
      'discount': '15% OFF',
      'price': '79',
      'subcategory': 'Entertainment',
      'location': 'Robina',
      'image': 'assets/images/camera.jpg',
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
                  const Icon(
                    Icons.trending_up,
                    size: 22,
                    color: Color(0xFFE67E22),
                  ),
                  const SizedBox(width: 6),
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
                child: const Icon(
                  Icons.arrow_forward_ios,
                  size: 16,
                  color: Color(0xFFE67E22),
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
                    // Image area
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
                            errorBuilder: (context, error, stackTrace) {
                              // Fallback if image not found
                              return Container(
                                height: 110,
                                decoration: const BoxDecoration(
                                  color: Color(0xFFF0F0F0),
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(16),
                                    topRight: Radius.circular(16),
                                  ),
                                ),
                                child: const Center(
                                  child: Icon(
                                    Icons.inventory_2,
                                    size: 48,
                                    color: Color(0xFFCCCCCC),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        // Discount badge
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

                    // Info area
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Item title
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
                          const SizedBox(height: 3),

                          // Subcategory label
                          Row(
                            children: [
                              const Icon(
                                Icons.label_outline,
                                size: 11,
                                color: Color(0xFF101B30),
                              ),
                              const SizedBox(width: 3),
                              Expanded(
                                child: Text(
                                  item['subcategory'] as String,
                                  style: const TextStyle(
                                    fontSize: 11,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xFF101B30),
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 3),

                          // Store location
                          Row(
                            children: [
                              const Icon(
                                Icons.location_on_outlined,
                                size: 11,
                                color: Color(0xFF9E9E9E),
                              ),
                              const SizedBox(width: 3),
                              Expanded(
                                child: Text(
                                  item['location'] as String,
                                  style: const TextStyle(
                                    fontSize: 11,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xFF9E9E9E),
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 5),

                          // Price
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
