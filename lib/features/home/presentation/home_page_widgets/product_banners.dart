import 'package:flutter/material.dart';
import 'package:unoapp/gen/assets.gen.dart';

class BannerItem {
  final String title;
  final String subtitle;
  final AssetGenImage image;

  BannerItem({
    required this.title,
    required this.subtitle,
    required this.image,
  });
}

class ProductBannersSection extends StatelessWidget {
  const ProductBannersSection({super.key});

  static final List<BannerItem> banners = [
    BannerItem(
      title: 'Xiaomi Mi 11 Ultra',
      subtitle: '12GB+256GB',
      image: Assets.images.bike,
    ),
    BannerItem(
      title: 'Pro Camera Kit',
      subtitle: 'Lens + Body',
      image: Assets.images.bike,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    // 1.4 divisor to create the 40% peek effect
    final double bannerWidth = (MediaQuery.sizeOf(context).width - 32) / 1.4;

    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: SizedBox(
        height: 200,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          itemCount: banners.length,
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.only(right: 12),
            child: SingleBannerCard(
              item: banners[index],
              bannerWidth: bannerWidth,
            ),
          ),
        ),
      ),
    );
  }
}

class SingleBannerCard extends StatelessWidget {
  const SingleBannerCard({
    super.key,
    required this.item,
    required this.bannerWidth,
  });

  final BannerItem item;
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
          // Using generated asset image
          Positioned(
            right: -20,
            bottom: -10,
            child: item.image.image(height: 160, fit: BoxFit.contain),
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
                  '${item.title}\n${item.subtitle}',
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
