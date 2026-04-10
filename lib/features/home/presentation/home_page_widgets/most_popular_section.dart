import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:unoapp/features/home/presentation/home_page_styling/app_text_style.dart';
import 'package:unoapp/gen/assets.gen.dart';

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
    // Math: screenWidth - margins / ratio (1.9)
    final double cardWidth = (MediaQuery.sizeOf(context).width - 32) / 1.9;

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
            onTap: () => context.push('/gridcards'),
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
    return Container(
      width: width,
      margin: const EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: item.image.image(
                  height: 216,
                  width: width,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 12,
                left: 0,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 5,
                  ),
                  decoration: const BoxDecoration(
                    color: Color(0xFFD42B65),
                    borderRadius: BorderRadius.horizontal(
                      right: Radius.circular(47.4),
                    ),
                  ),
                  child: Text(
                    item.discount,
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
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.title,
                  style: AppTextStyles.cardTitle,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Text(item.subcategory, style: AppTextStyles.cardSubtitle),
                const SizedBox(height: 4),
                Row(
                  children: [
                    const Icon(
                      Icons.location_on_outlined,
                      size: 14,
                      color: Color(0xFF8A8A8A),
                    ),
                    const SizedBox(width: 4),
                    Expanded(
                      child: Text(
                        item.location,
                        style: AppTextStyles.cardLocation,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  'From \$${item.price}/day',
                  style: AppTextStyles.priceLabel,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
