import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unoapp/controller/shimmering_effect_controller.dart';
import 'package:unoapp/core/extensions/context_extensions.dart';
import 'package:unoapp/features/home/presentation/home_page_styling/app_text_style.dart';
import 'package:unoapp/features/home/presentation/home_page_widgets/controllers/categories_section_controller.dart';

class CategoriesSection extends StatelessWidget {
  const CategoriesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final categoryController = Get.find<CategoryController>();
    final shimmerController = Get.put(ShimmerController());

    const double horizontalPadding = 32;
    final double itemWidth = (context.screenWidth - horizontalPadding) / 4.1;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Obx(() {
          if (categoryController.isLoading.value) {
            return SizedBox(
              height: 100,
              child: _buildShimmerList(shimmerController, itemWidth),
            );
          } else if (categoryController.hasError.value) {
            return _buildErrorState(categoryController);
          } else if (categoryController.categories.isEmpty) {
            return const SizedBox.shrink();
          } else {
            return SizedBox(
              height: 100,
              child: _buildCategoryList(categoryController, itemWidth),
            );
          }
        }),
      ],
    );
  }

  Widget _buildErrorState(CategoryController controller) {
    final errorType = controller.errorType.value;

    final (IconData icon, String title, String subtitle) = switch (errorType) {
      ErrorType.network => (
        Icons.wifi_off_rounded,
        'No internet connection',
        'Check your connection and try again',
      ),
      ErrorType.timeout => (
        Icons.timer_off_rounded,
        'Request timed out',
        'The server took too long to respond',
      ),
      ErrorType.unknown || null => (
        Icons.error_outline_rounded,
        'Something went wrong',
        'Unable to load categories',
      ),
    };

    return SizedBox(
      height: 100,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          children: [
            Icon(icon, size: 32, color: Colors.grey.shade400),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: AppTextStyles.texts.copyWith(
                      fontWeight: FontWeight.w600,
                      color: Colors.grey.shade700,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    subtitle,
                    style: AppTextStyles.texts.copyWith(
                      fontSize: 11,
                      color: Colors.grey.shade500,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            GestureDetector(
              onTap: controller.fetchCategories,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: Text(
                  'Retry',
                  style: AppTextStyles.texts.copyWith(
                    fontWeight: FontWeight.w600,
                    color: Colors.grey.shade700,
                    fontSize: 12,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildShimmerList(ShimmerController controller, double itemWidth) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 5,
      itemBuilder: (context, index) => _buildShimmerCard(controller, itemWidth),
    );
  }

  Widget _buildShimmerCard(ShimmerController controller, double itemWidth) {
    final double circleSize = itemWidth * 0.70;

    return AnimatedBuilder(
      animation: controller.shimmerAnimation,
      builder: (context, child) {
        return SizedBox(
          width: itemWidth,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: circleSize,
                height: circleSize,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: const [
                      Color(0xFFE0E0E0),
                      Color(0xFFF5F5F5),
                      Color(0xFFE0E0E0),
                    ],
                    stops: [
                      (controller.shimmerAnimation.value - 0.5).clamp(0.0, 1.0),
                      (controller.shimmerAnimation.value).clamp(0.0, 1.0),
                      (controller.shimmerAnimation.value + 0.5).clamp(0.0, 1.0),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Container(
                width: itemWidth * 0.75,
                height: 10,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: const [
                      Color(0xFFE0E0E0),
                      Color(0xFFF5F5F5),
                      Color(0xFFE0E0E0),
                    ],
                    stops: [
                      (controller.shimmerAnimation.value - 0.5).clamp(0.0, 1.0),
                      (controller.shimmerAnimation.value).clamp(0.0, 1.0),
                      (controller.shimmerAnimation.value + 0.5).clamp(0.0, 1.0),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildCategoryList(CategoryController controller, double itemWidth) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      physics: const BouncingScrollPhysics(),
      itemCount: controller.categories.length,
      itemBuilder: (context, index) => _buildCategoryCard(
        controller.categories[index].imgName,
        controller.categories[index].name,
        itemWidth,
      ),
    );
  }

  Widget _buildCategoryCard(String imgUrl, String name, double itemWidth) {
    final double circleSize = itemWidth * 0.70;

    return SizedBox(
      width: itemWidth,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: circleSize,
            height: circleSize,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.1),
                  blurRadius: 6,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: ClipOval(
              child: CachedNetworkImage(
                imageUrl: imgUrl,
                fit: BoxFit.cover,
                placeholder: (context, url) =>
                    Container(color: const Color(0xFFE0E0E0)),
                errorWidget: (context, url, error) => Container(
                  color: const Color(0xFFE0E0E0),
                  child: const Icon(
                    Icons.image_not_supported,
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            name,
            style: AppTextStyles.texts,
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
