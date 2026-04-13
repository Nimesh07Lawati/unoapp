// lib/core/router/getx_app_routes.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unoapp/application_shell/main_shell.dart';
import 'package:unoapp/core/router/route_name.dart';
import 'package:unoapp/features/booking/booking_screen.dart';
import 'package:unoapp/features/categories/categories_screen.dart';
import 'package:unoapp/features/chat/chat_screen.dart';
import 'package:unoapp/features/home/presentation/home_page_child_screen/grid_view_screen_cards.dart';
import 'package:unoapp/features/home/presentation/home_screen.dart';
import 'package:unoapp/features/search/search_screen.dart';

class GetxAppRoutes {
  // Initial route
  static const initialRoute = RouteNames.home;

  // GetX route configuration
  static final List<GetPage> routes = [
    // Shell/Main Layout Route
    GetPage(
      name: RouteNames.mainShell,
      page: () => MainShell(child: const SizedBox.shrink()),
      participatesInRootNavigator: true,
      preventDuplicates: true,
      children: [
        // Nested routes within MainShell
        GetPage(
          name: RouteNames.home,
          page: () => const HomeScreen(),
          transition: Transition.noTransition,
          participatesInRootNavigator: false,
        ),
        GetPage(
          name: RouteNames.categories,
          page: () => const CategoriesScreen(),
          transition: Transition.noTransition,
          participatesInRootNavigator: false,
        ),
        GetPage(
          name: RouteNames.search,
          page: () => const SearchScreen(),
          transition: Transition.noTransition,
          participatesInRootNavigator: false,
        ),
        GetPage(
          name: RouteNames.booking,
          page: () => const BookingScreen(),
          transition: Transition.noTransition,
          participatesInRootNavigator: false,
        ),
        GetPage(
          name: RouteNames.chat,
          page: () => const ChatScreen(),
          transition: Transition.noTransition,
          participatesInRootNavigator: false,
        ),
      ],
    ),

    // Independent routes (not in shell)
    GetPage(
      name: RouteNames.gridCards,
      page: () => GridViewScreencards(),
      transition: Transition.noTransition,
      participatesInRootNavigator: true,
    ),
  ];

  // Helper method to get route path with parameters
  static String getRoutePath(String routeName, {Map<String, String>? params}) {
    if (params == null || params.isEmpty) return routeName;

    final queryString = params.entries
        .map((e) => '${e.key}=${e.value}')
        .join('&');
    return '$routeName?$queryString';
  }
}
