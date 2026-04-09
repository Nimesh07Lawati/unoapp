import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:unoapp/core/application_style/app_text_style.dart';
import 'package:unoapp/core/application_theme/color.dart';

class GridViewScreencards extends StatelessWidget {
  GridViewScreencards({super.key});

  final int resultsCount = 86;
  final String searchQuery = 'Wedding';
  final List<Map<String, dynamic>> rentalItems = [
    {
      'title': 'Luxury Wedding Venue',
      'subcategory': 'Event Space',
      'price': 'From 499',
      'location': 'Kathmandu, Nepal',
      'image': 'assets/application_images/wedding.jpg',
    },
    {
      'title': 'Luxury Car Rental',
      'subcategory': 'Transportation',
      'price': 'From 299',
      'location': 'Lalitpur, Nepal',
      'image': 'assets/application_images/girl_in_car.jpg',
    },
    {
      'title': 'Luxury Car Rental',
      'subcategory': 'Transportation',
      'price': 'From 299',
      'location': 'Lalitpur, Nepal',
      'image': 'assets/application_images/girl_in_car.jpg',
    },
    {
      'title': 'Luxury Car Rental',
      'subcategory': 'Transportation',
      'price': 'From 299',
      'location': 'Lalitpur, Nepal',
      'image': 'assets/application_images/girl_in_car.jpg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appBackgroundColor,
      body: Stack(
        children: [
          // Content wrapped in SafeArea for bottom gesture protection
          SafeArea(
            bottom: true,
            child: Column(
              children: [
                // Header Section
                Container(
                  color: AppColors.appBackgroundColor,
                  // Top padding 105 ensures header text is below the back button (56+39+10)
                  padding: const EdgeInsets.only(
                    top: 105,
                    left: 24,
                    right: 24,
                    bottom: 20,
                  ),
                  width: double.infinity,
                  child: Text(
                    '$resultsCount Results For “$searchQuery”',
                    style: AppTextStyles.childPageHeader,
                  ),
                ),

                // Grid List
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: GridView.builder(
                      // Adding bottom padding inside GridView to clear system bar
                      padding: const EdgeInsets.only(top: 0, bottom: 20),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 12,
                            mainAxisSpacing: 12,
                            childAspectRatio: 0.60,
                          ),
                      itemCount: rentalItems.length,
                      itemBuilder: (context, index) =>
                          _buildRentalCard(rentalItems[index]),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Exact Figma Back Button Position
          Positioned(
            top: 56,
            left: 24,
            child: GestureDetector(
              onTap: () {
                debugPrint("back button presseed");
                context.pop();
              },
              child: Container(
                width: 39,
                height: 39,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: const Color(0xFFE5E5E5), width: 1),
                ),
                child: const Icon(
                  Icons.arrow_back,
                  size: 20,
                  color: Color(0xFF1A1A1A),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRentalCard(Map<String, dynamic> item) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFE5E5E5)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image
          Expanded(
            flex: 5,
            child: ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(12),
              ),
              child: Image.asset(
                item['image'],
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
          ),
          // Content
          Expanded(
            flex: 4,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item['title'],
                    style: AppTextStyles.cardTitle,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Text(item['subcategory'], style: AppTextStyles.cardSubtitle),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      const Icon(
                        Icons.location_on,
                        size: 12,
                        color: Colors.grey,
                      ),
                      const SizedBox(width: 4),
                      Expanded(
                        child: Text(
                          item['location'],
                          style: AppTextStyles.cardLocation,
                          maxLines: 1,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Text(item['price'], style: AppTextStyles.priceLabel),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
