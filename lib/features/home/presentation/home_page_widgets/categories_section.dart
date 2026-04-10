import 'package:flutter/material.dart';
import 'package:unoapp/features/home/presentation/home_page_styling/app_text_style.dart';
import 'package:unoapp/gen/assets.gen.dart'; // Import the generated file

class CategoriesSection extends StatelessWidget {
  const CategoriesSection({super.key});
  static final List<CategoryItem> categories = [
    CategoryItem(name: 'Party+Events', image: Assets.applicationImages.car),
    CategoryItem(name: 'Wedding', image: Assets.applicationImages.dateTable),
    CategoryItem(
      name: 'Automotive',
      image: Assets.applicationImages.diningHall,
    ),
    CategoryItem(name: 'Outdoors', image: Assets.applicationImages.tools),
    CategoryItem(name: 'Tools', image: Assets.applicationImages.waterSports),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 100,
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
                      width: 56,
                      height: 56,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.1),
                            blurRadius: 6,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: ClipOval(
                        // HERE IS THE MAGIC:
                        // Instead of Image.asset(path), use .image()
                        child: category.image.image(fit: BoxFit.cover),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      category.name,
                      style: AppTextStyles.texts,
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

// Create a small model for your data
class CategoryItem {
  final String name;
  final AssetGenImage image; // Using the generated type from flutter_gen

  CategoryItem({required this.name, required this.image});
}
