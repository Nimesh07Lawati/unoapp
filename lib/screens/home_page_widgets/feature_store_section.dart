import 'package:flutter/material.dart';

class FeaturedStoresSection extends StatelessWidget {
  const FeaturedStoresSection({super.key});

  @override
  Widget build(BuildContext context) {
    final stores = [
      {
        'name': 'Camera Pro',
        'subcategory': 'Photography',
        'location': 'Kathmandu, Nepal',
        'image': 'assets/store_images/camera_store.jpg',
      },
      {
        'name': 'Fashion Rent',
        'subcategory': 'Apparel',
        'location': 'Lalitpur, Nepal',
        'image': 'assets/store_images/cloath_store.jpg',
      },
      {
        'name': 'Sound Waves',
        'subcategory': 'Audio/Music',
        'location': 'Bhaktapur, Nepal',
        'image': 'assets/store_images/musical_store.jpg',
      },
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            'Featured Hire Stores',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1A1A1A),
            ),
          ),
        ),
        const SizedBox(height: 12),

        SizedBox(
          height: 190,
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

        const SizedBox(height: 24),
      ],
    );
  }

  Widget _buildStoreCard(
    String name,
    String subcategory,
    String location,
    String imagePath,
  ) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              imagePath,
              height: 90,
              width: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Container(
                height: 90,
                color: const Color(0xFFF0F0F0),
                child: const Center(
                  child: Icon(Icons.store, size: 32, color: Color(0xFFCCCCCC)),
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
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
          const SizedBox(height: 4),
          Text(
            subcategory,
            style: const TextStyle(fontSize: 11, color: Color(0xFF8A8A8A)),
          ),
          const SizedBox(height: 6),
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
