import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unoapp/core/extensions/context_extensions.dart';
import 'package:unoapp/core/router/route_name.dart';
import 'package:unoapp/features/home/presentation/home_page_styling/app_text_style.dart';
import 'package:unoapp/gen/assets.gen.dart';
import 'package:unoapp/widgets/cards.dart';

class PopularItem {
  final String title;
  final String discount;
  final String price;
  final String subcategory;
  final String location;
  final AssetGenImage image;

  PopularItem({
    required this.title,
    required this.discount,
    required this.price,
    required this.subcategory,
    required this.location,
    required this.image,
  });
}

class MostPopularSection extends StatelessWidget {
  const MostPopularSection({super.key});

  static final List<PopularItem> popularItems = [
    PopularItem(
      title: 'LED Dance Floor',
      discount: '25% OFF',
      price: '149',
      subcategory: 'Lighting & Decor',
      location: 'Broadbeach',
      image: Assets.applicationImages.diningHall,
    ),
    PopularItem(
      title: 'Premium Sound System',
      discount: '32% OFF',
      price: '99',
      subcategory: 'Audio & Music',
      location: 'Surfers Paradise',
      image: Assets.images.productCamera,
    ),
    PopularItem(
      title: 'Photo Booth',
      discount: '15% OFF',
      price: '79',
      subcategory: 'Entertainment',
      location: 'Robina',
      image: Assets.images.productCamera,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final double cardWidth = (context.screenWidth - 32) / 1.9;

    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(context),
          const SizedBox(height: 16),
          SizedBox(
            height: 344,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: popularItems.length,
              itemBuilder: (context, index) =>
                  _buildCard(popularItems[index], cardWidth),
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
          Row(
            children: [
              Assets.icons.growthArrow.svg(width: 22, height: 22),
              const SizedBox(width: 8),
              const Text('Most Popular', style: AppTextStyles.sectionLabelLeft),
            ],
          ),
          GestureDetector(
            onTap: () {
              // Navigate to grid view with all party items
              Get.toNamed(
                RouteNames.gridCards,
                arguments: {
                  'title': 'Most Popular Items',
                  'category': 'Most Popular',
                  'minPrice': 0,
                  'maxPrice': 99,
                  'itemsCount': popularItems.length,
                  'searchQuery': 'Party Hire',
                  'section': 'party_hire',
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

  Widget _buildCard(PopularItem item, double width) {
    return HireCard.product(
      image: item.image,
      width: width,
      title: item.title,
      discount: item.discount,
      price: item.price,
      subcategory: item.subcategory,
      location: item.location,
    );
  }
}
