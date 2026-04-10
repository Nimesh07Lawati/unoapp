import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:unoapp/core/router/route_pathts.dart';
import 'package:unoapp/features/home/presentation/home_page_styling/app_text_style.dart';
import 'package:unoapp/gen/assets.gen.dart'; // Import the generated file

class FeaturedStoresSection extends StatelessWidget {
  const FeaturedStoresSection({super.key});

  static final List<StoreItem> stores = [
    StoreItem(
      name: 'Celebration Rentals',
      subcategory: 'hall',
      location: 'Kathmandu, Nepal',
      image: Assets.images.firstStore, // Using generated asset
    ),
    StoreItem(
      name: 'Fashion Rent',
      subcategory: 'Apparel',
      location: 'Lalitpur, Nepal',
      image: Assets.images.yacht, // Using generated asset
    ),
    StoreItem(
      name: 'Sound Waves',
      subcategory: 'Audio/Music',
      location: 'Bhaktapur, Nepal',
      image: Assets.storeImages.musicalStore, // Using generated asset
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    const horizontalPadding = 40.0; // 20 on left + 20 on right (from padding)
    final cardWidth = (screenWidth - horizontalPadding) / 2.2;

    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Featured Hire Stores',
                  style: AppTextStyles.sectionLabelLeft,
                ),
                GestureDetector(
                  onTap: () {
                    context.push(RoutePaths.gridCards);
                  },
                  child: Container(
                    width: 32,
                    height: 32,
                    decoration: BoxDecoration(
                      color: const Color(0xFF292D32).withValues(alpha: 0.12),
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: SvgPicture.asset(
                        'assets/icons/arrow-right.svg',
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
          ),
          const SizedBox(height: 12),
          SizedBox(
            height: 208,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              itemCount: stores.length,
              separatorBuilder: (context, index) => const SizedBox(width: 16),
              itemBuilder: (context, index) {
                final store = stores[index];

                return SizedBox(
                  width: cardWidth,
                  child: _buildStoreCard(store, cardWidth),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStoreCard(StoreItem store, double cardWidth) {
    return Container(
      width: cardWidth,
      height: 208,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: store.image.image(
              height: 120,
              width: cardWidth,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  height: 120,
                  width: cardWidth,
                  color: const Color(0xFFF0F0F0),
                  child: const Center(
                    child: Icon(
                      Icons.store,
                      size: 32,
                      color: Color(0xFFCCCCCC),
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 6),
          Text(
            store.name,
            style: AppTextStyles.cardTitle,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 3),
          Text(store.subcategory, style: AppTextStyles.cardSubtitle),
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
                  store.location,
                  style: AppTextStyles.cardLocation,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// Create a model for your store data
class StoreItem {
  final String name;
  final String subcategory;
  final String location;
  final AssetGenImage image; // Using the generated type from flutter_gen

  StoreItem({
    required this.name,
    required this.subcategory,
    required this.location,
    required this.image,
  });
}
