import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unoapp/core/extensions/context_extensions.dart';
import 'package:unoapp/core/router/route_name.dart';
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
    PartyItem(
      title: 'Event Decor',
      discount: '28% OFF',
      price: '199',
      subcategory: 'Decoration',
      location: 'Broadbeach',
      image: Assets.applicationImages.diningHall,
    ),
    PartyItem(
      title: 'Catering Service',
      discount: '12% OFF',
      price: '349',
      subcategory: 'Food & Beverage',
      location: 'Surfers Paradise',
      image: Assets.applicationImages.wedding,
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
            onTap: () {
              // Navigate to grid view with all party items
              Get.toNamed(
                RouteNames.gridCards,
                arguments: {
                  'title': 'Party Hire Under \$99',
                  'category': 'party_hire',
                  'minPrice': 0,
                  'maxPrice': 99,
                  'itemsCount': partyItems.length,
                  'searchQuery': 'Party Hire',
                  'section': 'party_hire',
                },
              );
            },
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
    return GestureDetector(
      onTap: () {
        // Navigate to grid view with specific party item details
        Get.toNamed(
          RouteNames.gridCards,
          arguments: {
            'title': item.title,
            'discount': item.discount,
            'price': item.price,
            'subcategory': item.subcategory,
            'location': item.location,
            'category': 'party_item',
            'searchQuery': item.title,
            'priceRange': 'Under \$99',
            'itemDetails': {
              'title': item.title,
              'discount': item.discount,
              'price': item.price,
              'subcategory': item.subcategory,
              'location': item.location,
            },
          },
        );
      },
      child: HireCard.product(
        image: item.image,
        width: cardWidth,
        title: item.title,
        discount: item.discount,
        price: item.price,
        subcategory: item.subcategory,
        location: item.location,
      ),
    );
  }
}
