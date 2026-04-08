import 'package:flutter/material.dart';
import 'package:unoapp/core/application_style/app_text_style.dart';

class PopularSubcategoriesSection extends StatelessWidget {
  const PopularSubcategoriesSection({super.key});

  final List<Map<String, String>> subcategories = const [
    {'title': 'Fairy Lights', 'image': 'assets/images/party.jpg'},
    {'title': 'Skateboard', 'image': 'assets/images/skateboard.jpg'},
    {'title': 'Sound Hiring', 'image': 'assets/images/audio_mixer.jpg'},
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
            style: AppTextStyles.sectionLabelLeft,
          ),
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: 160, // Increased height to fit the text below the image
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: subcategories.length,
            itemBuilder: (context, index) {
              final item = subcategories[index];
              return Container(
                width: 120,
                margin: const EdgeInsets.symmetric(horizontal: 6),
                child: Column(
                  children: [
                    // Image part
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 8,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: Image.asset(
                            item['image']!,
                            fit: BoxFit.cover,
                            width: double.infinity,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    // Label text below the image
                    Text(
                      item['title']!,
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF1A1A1A),
                      ),
                      textAlign: TextAlign.center,
                      maxLines: 1,
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
