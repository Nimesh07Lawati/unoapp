import 'package:flutter/material.dart';

class PopularSubcategoriesSection extends StatelessWidget {
  const PopularSubcategoriesSection({super.key});

  final List<Map<String, String>> subcategories = const [
    {'title': 'Fairy Lights', 'image': 'assets/images/fairy_light.jpg'},
    {'title': 'Skateboard', 'image': 'assets/images/skateboard.jpg'},
    {'title': 'Sound Hair', 'image': 'assets/images/sound_card.jpg'},
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            'Popular Subcategories',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1A1A1A),
            ),
          ),
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: 130,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: subcategories.length,
            itemBuilder: (context, index) {
              final item = subcategories[index];
              return Container(
                width: 120,
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
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      // Full card image
                      Image.asset(item['image']!, fit: BoxFit.cover),
                      // Gradient overlay for better text visibility
                      Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.transparent,
                              Colors.black.withOpacity(0.6),
                            ],
                          ),
                        ),
                      ),
                      // Label at the bottom
                      Positioned(
                        bottom: 8,
                        left: 8,
                        right: 8,
                        child: Text(
                          item['title']!,
                          style: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
