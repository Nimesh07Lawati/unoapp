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
    return Container(
      color: Colors.white, // ✅ White background
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Column(
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
            height: 184 + 10 + 20,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: subcategories.length,
              itemBuilder: (context, index) {
                final item = subcategories[index];
                return SizedBox(
                  width: 156,
                  child: Column(
                    children: [
                      Container(
                        width: 156,
                        height: 156,
                        margin: const EdgeInsets.symmetric(horizontal: 8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: Image.asset(
                            item['image']!,
                            fit: BoxFit.cover,
                            width: 156,
                            height: 184,
                            errorBuilder: (c, e, s) => Container(
                              color: const Color(0xFFF0F0F0),
                              child: const Icon(
                                Icons.image,
                                color: Color(0xFFCCCCCC),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        item['title']!,
                        style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF1A1A1A),
                        ),
                        textAlign: TextAlign.left,
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
      ),
    );
  }
}
