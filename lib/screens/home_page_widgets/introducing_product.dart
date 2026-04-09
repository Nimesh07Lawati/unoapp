import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class IntroducingProductCard extends StatefulWidget {
  const IntroducingProductCard({super.key});

  @override
  State<IntroducingProductCard> createState() => _IntroducingProductCardState();
}

class _IntroducingProductCardState extends State<IntroducingProductCard> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<String> titles = [
    'Rent flexibly and \n affordably—instantly!',
    'Get the latest tech gadgets today',
    'Premium event gear for your party',
    'Professional tools for every job',
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
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            itemBuilder: (context, index) {
              return _buildCard(titles[index]);
            },
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
        width: 392,
        height: 182,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          image: const DecorationImage(
            image: AssetImage('assets/images/man_surfing.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          width: 392,
          height: 182,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.black.withOpacity(0.16),
          ),
          padding: const EdgeInsets.only(
            left: 23.42,
            top: 30,
            right: 24,
            bottom: 24,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Rentsy Logo with color #D42B65
              SizedBox(
                width: 80.58,
                height: 37.92,
                child: ColorFiltered(
                  colorFilter: const ColorFilter.mode(
                    Color(0xFFD42B65),
                    BlendMode.srcIn,
                  ),
                  child: Image.asset(
                    'assets/application_images/rentsy_logo.png',
                    width: 80.58,
                    height: 37.92,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                  height: 1.2,
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
                    SvgPicture.asset(
                      'assets/icons/hire_now_arrow_icon.svg',
                      width: 12,
                      height: 12,
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
