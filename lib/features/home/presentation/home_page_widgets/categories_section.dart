import 'package:flutter/material.dart';
import 'package:unoapp/core/extensions/context_extensions.dart';
import 'package:unoapp/features/home/presentation/home_page_styling/app_text_style.dart';
import 'package:unoapp/gen/assets.gen.dart';

class CategoriesSection extends StatefulWidget {
  const CategoriesSection({super.key});

  @override
  State<CategoriesSection> createState() => _CategoriesSectionState();
}

class _CategoriesSectionState extends State<CategoriesSection>
    with SingleTickerProviderStateMixin {
  bool _isLoading = true;
  late AnimationController _shimmerController;
  late Animation<double> _shimmerAnimation;

  static final List<CategoryItem> categories = [
    CategoryItem(name: 'Party+Events', image: Assets.applicationImages.car),
    CategoryItem(name: 'Wedding', image: Assets.applicationImages.dateTable),
    CategoryItem(
      name: 'Automotive',
      image: Assets.applicationImages.diningHall,
    ),
    CategoryItem(name: 'Outdoors', image: Assets.applicationImages.tools),
    CategoryItem(name: 'Tools', image: Assets.applicationImages.waterSports),
  ];

  @override
  void initState() {
    super.initState();

    _shimmerController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    )..repeat();

    _shimmerAnimation = Tween<double>(begin: -1.5, end: 1.5).animate(
      CurvedAnimation(parent: _shimmerController, curve: Curves.easeInOut),
    );

    Future.delayed(const Duration(seconds: 5), () {
      if (mounted) {
        setState(() => _isLoading = false);
        _shimmerController.stop();
      }
    });
  }

  @override
  void dispose() {
    _shimmerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const double horizontalPadding = 32;
    final double itemWidth = (context.screenWidth - horizontalPadding) / 4.1;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 100,
          child: _isLoading
              ? _buildShimmerList(itemWidth)
              : categories.isEmpty
              ? _buildEmptyState()
              : _buildCategoryList(itemWidth),
        ),
      ],
    );
  }

  // ── Shimmer ───────────────────────────────────────────────────
  Widget _buildShimmerList(double itemWidth) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 5,
      itemBuilder: (context, index) => _buildShimmerCard(itemWidth),
    );
  }

  Widget _buildShimmerCard(double itemWidth) {
    final double circleSize = itemWidth * 0.70;

    return AnimatedBuilder(
      animation: _shimmerAnimation,
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
                      (_shimmerAnimation.value - 0.5).clamp(0.0, 1.0),
                      (_shimmerAnimation.value).clamp(0.0, 1.0),
                      (_shimmerAnimation.value + 0.5).clamp(0.0, 1.0),
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
                      (_shimmerAnimation.value - 0.5).clamp(0.0, 1.0),
                      (_shimmerAnimation.value).clamp(0.0, 1.0),
                      (_shimmerAnimation.value + 0.5).clamp(0.0, 1.0),
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

  // ── Loaded ────────────────────────────────────────────────────
  Widget _buildCategoryList(double itemWidth) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      physics: const BouncingScrollPhysics(),
      itemCount: categories.length,
      itemBuilder: (context, index) =>
          _buildCategoryCard(categories[index], itemWidth),
    );
  }

  Widget _buildCategoryCard(CategoryItem category, double itemWidth) {
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
            child: ClipOval(child: category.image.image(fit: BoxFit.cover)),
          ),
          const SizedBox(height: 8),
          Text(
            category.name,
            style: AppTextStyles.texts,
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }

  // ── Empty State ───────────────────────────────────────────────
  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'No categories available',
            style: AppTextStyles.texts.copyWith(color: Colors.grey.shade400),
          ),
        ],
      ),
    );
  }
}

class CategoryItem {
  final String name;
  final AssetGenImage image;

  CategoryItem({required this.name, required this.image});
}
