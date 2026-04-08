import 'package:flutter/material.dart';
import 'package:unoapp/core/application_style/app_text_style.dart';

class CategoriesSection extends StatelessWidget {
  const CategoriesSection({super.key});

  final List<Map<String, dynamic>> categories = const [
    {'icon': Icons.celebration, 'name': 'Party+Events'},
    {'icon': Icons.favorite, 'name': 'Wedding'},
    {'icon': Icons.directions_car, 'name': 'Automotive'},
    {'icon': Icons.water, 'name': 'Watersports'},
    {'icon': Icons.build, 'name': 'Tools'},
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Top section with "Categories" and "See All"
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Categories', style: AppTextStyles.sectionLabelLeft),
              GestureDetector(
                onTap: () {
                  // Handle See All tap
                },
                child: const Text(
                  'See All',
                  style: AppTextStyles
                      .sectionLabelRight, // Assuming this style exists for 'See All'
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),

        // Horizontal list of categories
        SizedBox(
          height: 100, // Increased height slightly to accommodate 2-line labels
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: categories.length,
            itemBuilder: (context, index) {
              final category = categories[index];
              return Container(
                width: 72,
                margin: const EdgeInsets.symmetric(horizontal: 4),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.03),
                            blurRadius: 8,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Icon(
                        category['icon'] as IconData,
                        size: 28,
                        color: const Color(0xFFE67E22),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      category['name'] as String,
                      style: const TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF4A4A4A),
                      ),
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
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
