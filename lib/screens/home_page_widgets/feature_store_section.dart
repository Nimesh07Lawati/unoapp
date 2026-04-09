import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:unoapp/core/application_style/app_text_style.dart';

class FeaturedStoresSection extends StatelessWidget {
  const FeaturedStoresSection({super.key});

  @override
  Widget build(BuildContext context) {
    final stores = [
      {
        'name': 'Celebration Rentals',
        'subcategory': 'hall',
        'location': 'Kathmandu, Nepal',
        'image': 'assets/images/first_store.jpg',
      },
      {
        'name': 'Fashion Rent',
        'subcategory': 'Apparel',
        'location': 'Lalitpur, Nepal',
        'image': 'assets/images/yacht.jpg',
      },
      {
        'name': 'Sound Waves',
        'subcategory': 'Audio/Music',
        'location': 'Bhaktapur, Nepal',
        'image': 'assets/store_images/musical_store.jpg',
      },
    ];

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
                  onTap: () {},
                  child: Container(
                    width: 32,
                    height: 32,
                    decoration: BoxDecoration(
                      color: const Color(0xFF292D32).withOpacity(0.12),
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
                  width: 180,
                  child: _buildStoreCard(
                    store['name']!,
                    store['subcategory']!,
                    store['location']!,
                    store['image']!,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStoreCard(
    String name,
    String subcategory,
    String location,
    String imagePath,
  ) {
    return Container(
      width: 180,
      height: 208,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: Image.asset(
              imagePath,
              height: 120,
              width: 180,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  height: 120,
                  width: 180,
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
            name,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Color(0xFF1A1A1A),
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 3),
          Text(
            subcategory,
            style: const TextStyle(fontSize: 11, color: Color(0xFF8A8A8A)),
          ),
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
                  location,
                  style: const TextStyle(
                    fontSize: 11,
                    color: Color(0xFF8A8A8A),
                  ),
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
