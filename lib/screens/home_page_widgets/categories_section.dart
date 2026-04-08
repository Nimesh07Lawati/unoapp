import 'package:flutter/material.dart';
import 'package:unoapp/core/application_style/app_text_style.dart';

class CategoriesSection extends StatelessWidget {
  const CategoriesSection({super.key});

  // Updated list to point to your asset images
  final List<Map<String, String>> categories = const [
    {'image': 'assets/application_images/car.jpg', 'name': 'Party+Events'},
    {'image': 'assets/application_images/date_table.jpg', 'name': 'Wedding'},
    {
      'image': 'assets/application_images/dining_hall.jpg',
      'name': 'Automotive',
    },
    {
      'image': 'assets/application_images/tools.jpg',
      'name': 'Watersports and this is the water ',
    },
    {'image': 'assets/application_images/water_sports.jpg', 'name': 'Tools'},
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
              const Text('Categories', style: AppTextStyles.sectionLabelLeft),
              GestureDetector(
                onTap: () {},
                child: const Text(
                  'See All',
                  style: AppTextStyles.sectionLabelRight,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 130, // Increased height to accommodate 2 lines of text
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
                    // Image container
                    Container(
                      width: 56, // Set specific size
                      height: 56,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 6,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: ClipOval(
                        child: Image.asset(
                          category['image']!,
                          fit: BoxFit.cover, // Ensures image fills the circle
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      category['name']!,
                      style: AppTextStyles.texts,
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
