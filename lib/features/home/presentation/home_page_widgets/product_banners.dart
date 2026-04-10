import 'package:flutter/material.dart';

class ProductBannersSection extends StatelessWidget {
  const ProductBannersSection({super.key});

  final List<Map<String, String>> banners = const [
    {
      'title': 'Xiaomi Mi 11 Ultra',
      'subtitle': '12GB+256GB',
      'image': 'assets/images/bike.png',
    },
    {
      'title': 'Pro Camera Kit',
      'subtitle': 'Lens + Body',
      'image': 'assets/images/bike.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    // To show 40% of the second banner, we need:
    // First banner FULL width + 40% of second banner = screen width
    // So: bannerWidth + (bannerWidth * 0.4) = screenWidth - horizontalPadding
    // 1.4 * bannerWidth = screenWidth - horizontalPadding
    // bannerWidth = (screenWidth - horizontalPadding) / 1.4

    const horizontalPadding = 32.0; // 16 on left + 16 on right
    final bannerWidth = (screenWidth - horizontalPadding) / 1.4;

    return Container(
      color: Colors.white, // ✅ White background
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: SizedBox(
        height: 200,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          itemCount: banners.length,
          itemBuilder: (context, index) {
            final item = banners[index];
            return Padding(
              padding: const EdgeInsets.only(right: 12),
              child: SingleBannerCard(
                title: item['title']!,
                subtitle: item['subtitle']!,
                imagePath: item['image']!,
                bannerWidth: bannerWidth,
              ),
            );
          },
        ),
      ),
    );
  }
}

class SingleBannerCard extends StatelessWidget {
  const SingleBannerCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.imagePath,
    required this.bannerWidth,
  });

  final String title;
  final String subtitle;
  final String imagePath;
  final double bannerWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: bannerWidth,
      height: 200,
      decoration: BoxDecoration(
        color: const Color(0xFF1A2340),
        borderRadius: BorderRadius.circular(20),
      ),
      clipBehavior: Clip.hardEdge,
      child: Stack(
        children: [
          Positioned(
            right: -20,
            bottom: -10,
            child: Image.asset(imagePath, height: 160, fit: BoxFit.contain),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFF5B8DEF),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: const Text(
                    'INTRODUCING',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 12,
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  '$title\n$subtitle',
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 16),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFFD42B65),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: const Text(
                    'HIRE NOW →',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
