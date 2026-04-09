import 'package:flutter/material.dart';
import 'package:unoapp/screens/home_page_widgets/categories_section.dart';
import 'package:unoapp/screens/home_page_widgets/feature_store_section.dart';
import 'package:unoapp/screens/home_page_widgets/home_screen_header.dart';
import 'package:unoapp/screens/home_page_widgets/introducing_product.dart';
import 'package:unoapp/screens/home_page_widgets/most_popular_section.dart';
import 'package:unoapp/screens/home_page_widgets/party_hire_section.dart';
import 'package:unoapp/screens/home_page_widgets/popular_sub_category_section.dart';
import 'package:unoapp/screens/home_page_widgets/product_banners.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16),
          const HomeHeader(),
          const SizedBox(height: 24),
          const CategoriesSection(),
          const SizedBox(height: 24),
          const IntroducingProductCard(),
          const SizedBox(height: 24),
          const MostPopularSection(),
          const SizedBox(height: 24),
          const PopularSubcategoriesSection(),
          const SizedBox(height: 24),
          const ProductBannersSection(),
          const SizedBox(height: 24),
          const PartyHireSection(),
          const SizedBox(height: 24),
          const FeaturedStoresSection(),
          const SizedBox(height: 150),
        ],
      ),
    );
  }
}
