import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unoapp/core/extensions/context_extensions.dart';
import 'package:unoapp/core/router/route_name.dart';
import 'package:unoapp/features/home/presentation/home_page_styling/app_text_style.dart';
import 'package:unoapp/gen/assets.gen.dart';
import 'package:unoapp/widgets/cards.dart';

class SubcategoryItem {
  final String title;
  final AssetGenImage image;

  SubcategoryItem({required this.title, required this.image});
}

class PopularSubcategoriesSection extends StatelessWidget {
  const PopularSubcategoriesSection({super.key});

  static final List<SubcategoryItem> subcategories = [
    SubcategoryItem(title: 'Fairy Lights', image: Assets.images.party),
    SubcategoryItem(title: 'Skateboard', image: Assets.images.skateboard),
    SubcategoryItem(title: 'Sound Hiring', image: Assets.images.audioMixer),
  ];

  @override
  Widget build(BuildContext context) {
    final double cardWidth = (context.screenWidth - 32) / 2.3;

    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(context),
          const SizedBox(height: 12),
          SizedBox(
            height: 214,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: subcategories.length,
              itemBuilder: (context, index) =>
                  _buildCard(subcategories[index], cardWidth),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Popular Subcategories',
            style: AppTextStyles.sectionLabelLeft,
          ),
          GestureDetector(
            onTap: () {
              // Navigate to grid view with all party items
              Get.toNamed(
                RouteNames.gridCards,
                arguments: {
                  'title': 'Sub category Items',
                  'category': 'sub_categories',
                  'minPrice': 0,
                  'maxPrice': 99,
                  'itemsCount': subcategories.length,
                  'searchQuery': 'sub categories',
                  'section': 'sub_categories',
                },
              );
            },
            child: Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                color: const Color(0xFF292D32).withValues(alpha: 0.12),
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Assets.icons.arrowRight.svg(
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
    );
  }

  Widget _buildCard(SubcategoryItem item, double width) {
    return HireCard.subcategory(
      image: item.image,
      width: width,
      title: item.title,
    );
  }
}
