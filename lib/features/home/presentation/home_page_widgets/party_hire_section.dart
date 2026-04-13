import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:unoapp/core/extensions/context_extensions.dart';
import 'package:unoapp/features/home/presentation/home_page_styling/app_text_style.dart';
import 'package:unoapp/gen/assets.gen.dart';
import 'package:unoapp/widgets/cards.dart';

class PartyItem {
  final String title;
  final String discount;
  final String price;
  final String subcategory;
  final String location;
  final AssetGenImage image;

  PartyItem({
    required this.title,
    required this.discount,
    required this.price,
    required this.subcategory,
    required this.location,
    required this.image,
  });
}

class PartyHireSection extends StatelessWidget {
  const PartyHireSection({super.key});

  static final List<PartyItem> partyItems = [
    PartyItem(
      title: 'Luxury Yacht',
      discount: '32% OFF',
      price: '499',
      subcategory: 'Venues',
      location: 'Gold Coast',
      image: Assets.images.yacht,
    ),
    PartyItem(
      title: 'Photo Booth',
      discount: '15% OFF',
      price: '79',
      subcategory: 'Entertainment',
      location: 'Robina',
      image: Assets.images.productCamera,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final double cardWidth = (context.screenWidth - 32) / 1.9;

    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(context),
          const SizedBox(height: 16),
          SizedBox(
            height: 344,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: partyItems.length,
              itemBuilder: (context, index) =>
                  _buildCard(partyItems[index], cardWidth),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Party Hire Under \$99',
            style: AppTextStyles.sectionLabelLeft,
          ),
          GestureDetector(
            onTap: () => context.push('/gridcards'),
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
    );
  }

  Widget _buildCard(PartyItem item, double cardWidth) {
    return HireCard.product(
      image: item.image,
      width: cardWidth,
      title: item.title,
      discount: item.discount,
      price: item.price,
      subcategory: item.subcategory,
      location: item.location,
    );
  }
}
