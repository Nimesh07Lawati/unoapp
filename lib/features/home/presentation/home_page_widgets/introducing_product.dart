import 'package:flutter/material.dart';
import 'package:unoapp/features/home/presentation/home_page_styling/app_text_style.dart';
import 'package:unoapp/gen/assets.gen.dart';

class IntroducingProductCard extends StatefulWidget {
  const IntroducingProductCard({super.key});

  @override
  State<IntroducingProductCard> createState() => _IntroducingProductCardState();
}

class _IntroducingProductCardState extends State<IntroducingProductCard> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<String> titles = [
    'Rent flexibly and affordably—instantly!',
    'Upgrade your lifestyle with ease',
    'Best gear for your next adventure',
    'Simple, fast, and secure rentals',
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 182,
      child: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            itemCount: titles.length,
            onPageChanged: (index) => setState(() => _currentPage = index),
            itemBuilder: (context, index) => _buildCard(titles[index]),
          ),
          Positioned(
            bottom: 16,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                titles.length,
                (index) => AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color: _currentPage == index
                        ? const Color(0xFF101B30)
                        : const Color(0xFFE7E8EA),
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCard(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          // Using generated asset image provider
          image: DecorationImage(
            image: Assets.images.manSurfing.image().image,
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: const Color(0xFFF9F9F9).withValues(alpha: 0.16),
          ),
          padding: const EdgeInsets.only(
            left: 23,
            top: 30,
            right: 24,
            bottom: 24,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Logo color filter
              ColorFiltered(
                colorFilter: const ColorFilter.mode(
                  Color(0xFFD42B65),
                  BlendMode.srcIn,
                ),
                child: Assets.applicationImages.rentsyLogo.image(
                  width: 80.58,
                  height: 37.92,
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(height: 8),
              Expanded(
                child: Text(
                  title,
                  style: AppTextStyles.bannerLabel,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
              ),
              const SizedBox(height: 12),
              Container(
                width: 92,
                height: 24,
                decoration: BoxDecoration(
                  color: const Color(0xFFD42B65),
                  borderRadius: BorderRadius.circular(24),
                ),
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'HIRE NOW',
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(width: 4),
                    // Using generated SVG asset
                    Assets.icons.hireNowArrowIcon.svg(
                      width: 8,
                      height: 8,
                      colorFilter: const ColorFilter.mode(
                        Colors.white,
                        BlendMode.srcIn,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
