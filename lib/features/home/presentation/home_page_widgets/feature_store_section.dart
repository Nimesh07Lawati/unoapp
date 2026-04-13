import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unoapp/core/extensions/context_extensions.dart';
import 'package:unoapp/core/router/route_name.dart';
import 'package:unoapp/features/home/presentation/home_page_styling/app_text_style.dart';
import 'package:unoapp/gen/assets.gen.dart';
import 'package:unoapp/widgets/cards.dart';

class StoreItem {
  final String name;
  final String subcategory;
  final String location;
  final AssetGenImage image;

  StoreItem({
    required this.name,
    required this.subcategory,
    required this.location,
    required this.image,
  });
}

class FeaturedStoresSection extends StatelessWidget {
  const FeaturedStoresSection({super.key});

  static final List<StoreItem> stores = [
    StoreItem(
      name: 'Celebration Rentals',
      subcategory: 'hall',
      location: 'Kathmandu, Nepal',
      image: Assets.images.firstStore,
    ),
    StoreItem(
      name: 'Fashion Rent',
      subcategory: 'Apparel',
      location: 'Lalitpur, Nepal',
      image: Assets.images.yacht,
    ),
    StoreItem(
      name: 'Sound Waves',
      subcategory: 'Audio/Music',
      location: 'Bhaktapur, Nepal',
      image: Assets.storeImages.musicalStore,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    const horizontalPadding = 40.0;
    final cardWidth = (context.screenWidth - horizontalPadding) / 2.2;

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
                  onTap: () => Get.toNamed(RouteNames.gridCards),
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
                return HireCard.store(
                  image: store.image,
                  width: cardWidth,
                  title: store.name,
                  subcategory: store.subcategory,
                  location: store.location,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
