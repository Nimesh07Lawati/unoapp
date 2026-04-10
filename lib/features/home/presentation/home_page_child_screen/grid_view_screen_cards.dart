import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:unoapp/features/home/presentation/home_page_styling/app_text_style.dart';
import 'package:unoapp/gen/colors.gen.dart';
import 'package:unoapp/gen/assets.gen.dart';

class GridViewScreencards extends StatelessWidget {
  GridViewScreencards({super.key});

  final int resultsCount = 86;
  final String searchQuery = 'Wedding';

  // Define rental items using generated assets
  final List<RentalItem> rentalItems = [
    RentalItem(
      title: 'Luxury Wedding Venue',
      subcategory: 'Event Space',
      price: 'From 499',
      location: 'Kathmandu, Nepal',
      image: Assets.applicationImages.wedding, // Using generated asset
    ),
    RentalItem(
      title: 'Luxury Car Rental',
      subcategory: 'Transportation',
      price: 'From 299',
      location: 'Lalitpur, Nepal',
      image: Assets.applicationImages.girlInCar, // Using generated asset
    ),
    RentalItem(
      title: 'Luxury Car Rental',
      subcategory: 'Transportation',
      price: 'From 299',
      location: 'Lalitpur, Nepal',
      image: Assets.applicationImages.girlInCar, // Using generated asset
    ),
    RentalItem(
      title: 'Luxury Car Rental',
      subcategory: 'Transportation',
      price: 'From 299',
      location: 'Lalitpur, Nepal',
      image: Assets.applicationImages.girlInCar, // Using generated asset
    ),
  ];

  void _handleBack(BuildContext context) {
    debugPrint('back button pressed');
    context.pop();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (!didPop) {
          _handleBack(context);
        }
      },
      child: Scaffold(
        backgroundColor: ColorName.applicationBackgroundColor,
        body: Stack(
          children: [
            SafeArea(
              bottom: true,
              child: Column(
                children: [
                  Container(
                    color: ColorName.applicationBackgroundColor,
                    padding: const EdgeInsets.only(
                      top: 80,
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

                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: GridView.builder(
                        padding: const EdgeInsets.only(top: 0, bottom: 20),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 12,
                              mainAxisSpacing: 12,
                              childAspectRatio: 0.60,
                            ),
                        itemCount: rentalItems.length,
                        itemBuilder: (context, index) {
                          return _buildRentalCard(rentalItems[index]);
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Positioned(
              top: 56,
              left: 24,
              child: GestureDetector(
                onTap: () => _handleBack(context),
                child: Container(
                  width: 39,
                  height: 39,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: const Color(0xFFE5E5E5),
                      width: 1,
                    ),
                  ),
                  child: const Icon(
                    Icons.chevron_left,
                    size: 20,
                    color: Color(0xFF1A1A1A),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRentalCard(RentalItem item) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFE5E5E5)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 5,
            child: ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(12),
              ),
              child: item.image.image(
                fit: BoxFit.cover,
                width: double.infinity,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: const Color(0xFFF0F0F0),
                    child: const Center(
                      child: Icon(
                        Icons.image_not_supported,
                        size: 32,
                        color: Color(0xFFCCCCCC),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),

          Expanded(
            flex: 4,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.title,
                    style: AppTextStyles.cardTitle,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),

                  const SizedBox(height: 4),

                  Text(item.subcategory, style: AppTextStyles.cardSubtitle),

                  const SizedBox(height: 4),

                  Row(
                    children: [
                      const Icon(
                        Icons.location_on,
                        size: 12,
                        color: Color(0xFF9E9E9E), // Using consistent color
                      ),
                      const SizedBox(width: 4),
                      Expanded(
                        child: Text(
                          item.location,
                          style: AppTextStyles.cardLocation,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),

                  const Spacer(),

                  Text(item.price, style: AppTextStyles.priceLabel),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Create a model for rental items
class RentalItem {
  final String title;
  final String subcategory;
  final String price;
  final String location;
  final AssetGenImage image; // Using generated type from flutter_gen

  RentalItem({
    required this.title,
    required this.subcategory,
    required this.price,
    required this.location,
    required this.image,
  });
}
