import 'package:flutter/material.dart';
import 'package:unoapp/features/home/presentation/home_page_styling/app_text_style.dart';
import 'package:unoapp/gen/assets.gen.dart';

enum HireCardVariant { product, subcategory, store }

class HireCard extends StatelessWidget {
  final AssetGenImage image;
  final double width;
  final String title;
  final String? discount;
  final String? price;
  final String? subcategory;
  final String? location;
  final HireCardVariant variant;

  const HireCard({
    super.key,
    required this.image,
    required this.width,
    required this.title,
    required this.variant,
    this.discount,
    this.price,
    this.subcategory,
    this.location,
  });

  /// Product card: image(216h) + badge + title + subcategory + location + price
  const HireCard.product({
    super.key,
    required this.image,
    required this.width,
    required this.title,
    required this.discount,
    required this.price,
    required this.subcategory,
    required this.location,
  }) : variant = HireCardVariant.product;

  /// Subcategory card: image(156h) + title only
  const HireCard.subcategory({
    super.key,
    required this.image,
    required this.width,
    required this.title,
  }) : variant = HireCardVariant.subcategory,
       discount = null,
       price = null,
       subcategory = null,
       location = null;

  /// Store card: image(120h) + title + subcategory + location
  const HireCard.store({
    super.key,
    required this.image,
    required this.width,
    required this.title,
    required this.subcategory,
    required this.location,
  }) : variant = HireCardVariant.store,
       discount = null,
       price = null;

  @override
  Widget build(BuildContext context) {
    switch (variant) {
      case HireCardVariant.product:
        return _buildProductCard();
      case HireCardVariant.subcategory:
        return _buildSubcategoryCard();
      case HireCardVariant.store:
        return _buildStoreCard();
    }
  }

  // ─── Product Card (used by MostPopularSection & PartyHireSection) ───────────

  Widget _buildProductCard() {
    return Container(
      width: width,
      margin: const EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: image.image(
                  height: 216,
                  width: width,
                  fit: BoxFit.cover,
                ),
              ),
              if (discount != null)
                Positioned(
                  top: 12,
                  left: 0,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 5,
                    ),
                    decoration: const BoxDecoration(
                      color: Color(0xFFD42B65),
                      borderRadius: BorderRadius.horizontal(
                        right: Radius.circular(47.4),
                      ),
                    ),
                    child: Text(
                      discount!,
                      style: const TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: AppTextStyles.cardTitle,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                if (subcategory != null)
                  Text(subcategory!, style: AppTextStyles.cardSubtitle),
                const SizedBox(height: 4),
                if (location != null) _buildLocation(location!),
                const SizedBox(height: 8),
                if (price != null)
                  Text('From \$$price/day', style: AppTextStyles.priceLabel),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ─── Subcategory Card (used by PopularSubcategoriesSection) ─────────────────

  Widget _buildSubcategoryCard() {
    return Container(
      width: width,
      margin: const EdgeInsets.only(right: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: image.image(width: width, height: 156, fit: BoxFit.cover),
          ),
          const SizedBox(height: 10),
          Text(
            title,
            style: AppTextStyles.cardTitle,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }

  // ─── Store Card (used by FeaturedStoresSection) ──────────────────────────────

  Widget _buildStoreCard() {
    return Container(
      width: width,
      height: 208,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: image.image(
              height: 120,
              width: width,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  height: 120,
                  width: width,
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
            title,
            style: AppTextStyles.cardTitle,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 3),
          if (subcategory != null)
            Text(subcategory!, style: AppTextStyles.cardSubtitle),
          const SizedBox(height: 4),
          if (location != null) _buildLocation(location!),
        ],
      ),
    );
  }

  // ─── Shared ──────────────────────────────────────────────────────────────────

  Widget _buildLocation(String loc) {
    return Row(
      children: [
        const Icon(
          Icons.location_on_outlined,
          size: 14,
          color: Color(0xFF8A8A8A),
        ),
        const SizedBox(width: 4),
        Expanded(
          child: Text(
            loc,
            style: AppTextStyles.cardLocation,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
