import 'package:flutter/material.dart';
import 'package:unoapp/screens/home_page_widgets/categories_section.dart';
import 'package:unoapp/screens/home_page_widgets/feature_store_section.dart';
import 'package:unoapp/screens/home_page_widgets/home_screen_header.dart';
import 'package:unoapp/screens/home_page_widgets/introducing_product.dart';
import 'package:unoapp/screens/home_page_widgets/most_popular_section.dart';
import 'package:unoapp/screens/home_page_widgets/party_hire_section.dart';
import 'package:unoapp/screens/home_page_widgets/popular_sub_category_section.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F9),
      body: SafeArea(
        child: Column(
          children: [
            // Main scrollable content
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 16),
                    // Header with greeting and profile
                    const HomeHeader(),
                    const SizedBox(height: 24),

                    // Categories Section
                    const CategoriesSection(),
                    const SizedBox(height: 24),
                    // Introducing Product Card
                    const IntroducingProductCard(),
                    const SizedBox(height: 32),
                    // Most Popular Section
                    const MostPopularSection(),
                    const SizedBox(height: 32),
                    // Popular Subcategories
                    const PopularSubcategoriesSection(),
                    const SizedBox(height: 32),
                    const PartyHireSection(),
                    const SizedBox(height: 32),
                    const FeaturedStoresSection(),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
