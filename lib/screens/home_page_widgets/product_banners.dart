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
            return const Padding(
              padding: EdgeInsets.symmetric(horizontal: 4),
              child: SingleBannerCard(),
            );
          },
        ),
      ),
    );
  }
}

class SingleBannerCard extends StatelessWidget {
  const SingleBannerCard({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width - 40;

    return Container(
      width: width,
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
            child: Image.asset(
              'assets/images/bike.png',
              height: 160,
              fit: BoxFit.contain,
            ),
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
                    borderRadius: BorderRadius.circular(8),
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
                const Text(
                  'Xiaomi Mi 11 Ultra\n12GB+256GB',
                  style: TextStyle(
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
                    color: const Color(0xFFE91E8C),
                    borderRadius: BorderRadius.circular(12),
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
