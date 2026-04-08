import 'package:flutter/material.dart';

class IntroducingProductCard extends StatefulWidget {
  const IntroducingProductCard({super.key});

  @override
  State<IntroducingProductCard> createState() => _IntroducingProductCardState();
}

class _IntroducingProductCardState extends State<IntroducingProductCard> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<Map<String, String>> products = [
    {'title': 'Xiaomi Mi 11 Ultra\n12GB+256GB', 'icon': 'phone_android'},
    {'title': 'Apple iPhone 15 Pro\n8GB+512GB', 'icon': 'phone_iphone'},
    {'title': 'Samsung Galaxy S24\n12GB+256GB', 'icon': 'tablet_android'},
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      child: Stack(
        children: [
          // The PageView
          PageView.builder(
            controller: _pageController,
            onPageChanged: (index) => setState(() => _currentPage = index),
            itemCount: products.length,
            itemBuilder: (context, index) {
              return _buildCard(products[index]);
            },
          ),

          // The Indicator positioned inside the Stack
          Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(products.length, (index) {
                return AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  width: _currentPage == index ? 20 : 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color: _currentPage == index
                        ? const Color(0xFFE67E22)
                        : Colors.white.withOpacity(0.4),
                    borderRadius: BorderRadius.circular(4),
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCard(Map<String, String> product) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Color(0xFF2C3E50), Color(0xFF1A1A2E)],
          ),
          borderRadius: BorderRadius.circular(24),
        ),
        padding: const EdgeInsets.all(20),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'INTRODUCING',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFFE67E22),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    product['title']!,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'HIRE NOW →',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFFE67E22),
                    ),
                  ),
                ],
              ),
            ),
            const Icon(Icons.phone_android, size: 60, color: Colors.white24),
          ],
        ),
      ),
    );
  }
}
