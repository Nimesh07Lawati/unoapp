// lib/core/router/app_router.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:unoapp/application_shell/main_shell.dart';
import 'package:unoapp/core/router/route_pathts.dart';
import 'package:unoapp/core/router/route_name.dart';
import 'package:unoapp/features/booking/booking_screen.dart';
import 'package:unoapp/features/categories/categories_screen.dart';
import 'package:unoapp/features/chat/chat_screen.dart';
import 'package:unoapp/features/home/grid_view_screen_cards.dart';
import 'package:unoapp/features/home/presentation/home_page_child_screen/home_screen.dart';
import 'package:unoapp/features/search/search_screen.dart';

class AppRouter {
  AppRouter._();

  static final GlobalKey<NavigatorState> rootNavigatorKey =
      GlobalKey<NavigatorState>();

  static final GlobalKey<NavigatorState> shellNavigatorKey =
      GlobalKey<NavigatorState>();

  static final GoRouter router = GoRouter(
    navigatorKey: rootNavigatorKey,
    initialLocation: RoutePaths.home,
    routes: [
      ShellRoute(
        navigatorKey: shellNavigatorKey,
        builder: (context, state, child) {
          return MainShell(child: child);
        },
        routes: [
          GoRoute(
            path: RoutePaths.home,
            name: RouteNames.home,
            pageBuilder: (context, state) {
              return const NoTransitionPage(child: HomeScreen());
            },
          ),
          GoRoute(
            path: RoutePaths.categories,
            name: RouteNames.categories,
            pageBuilder: (context, state) {
              return const NoTransitionPage(child: CategoriesScreen());
            },
          ),
          GoRoute(
            path: RoutePaths.search,
            name: RouteNames.search,
            pageBuilder: (context, state) {
              return const NoTransitionPage(child: SearchScreen());
            },
          ),
          GoRoute(
            path: RoutePaths.booking,
            name: RouteNames.booking,
            pageBuilder: (context, state) {
              return const NoTransitionPage(child: BookingScreen());
            },
          ),
          GoRoute(
            path: RoutePaths.chat,
            name: RouteNames.chat,
            pageBuilder: (context, state) {
              return const NoTransitionPage(child: ChatScreen());
            },
          ),
        ],
      ),

      GoRoute(
        parentNavigatorKey: rootNavigatorKey,
        path: RoutePaths.gridCards,
        name: RouteNames.gridCards,
        pageBuilder: (context, state) {
          return NoTransitionPage(child: GridViewScreencards());
        },
      ),
    ],
  );
}
