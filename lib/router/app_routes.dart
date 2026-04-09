import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:unoapp/application_shell/main_shell.dart';
import 'package:unoapp/screens/Home_screen.dart';
import 'package:unoapp/screens/booking_screen.dart';
import 'package:unoapp/screens/categories_screen.dart';
import 'package:unoapp/screens/chat_screen.dart';
import 'package:unoapp/screens/child_screens/grid_view_screen_cards.dart';
import 'package:unoapp/screens/search_screen.dart';

class AppRouter {
  static final _rootNavigatorKey = GlobalKey<NavigatorState>();
  static final _shellNavigatorKey = GlobalKey<NavigatorState>();

  static final GoRouter router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: '/home',
    routes: [
      ShellRoute(
        navigatorKey: _shellNavigatorKey,
        builder: (context, state, child) => MainShell(child: child),
        routes: [
          GoRoute(
            path: '/home',
            pageBuilder: (context, state) =>
                const NoTransitionPage(child: HomeScreen()),
          ),
          GoRoute(
            path: '/categories',
            pageBuilder: (context, state) =>
                const NoTransitionPage(child: CategoriesScreen()),
          ),
          GoRoute(
            path: '/search',
            pageBuilder: (context, state) =>
                const NoTransitionPage(child: SearchScreen()),
          ),
          GoRoute(
            path: '/booking',
            pageBuilder: (context, state) =>
                const NoTransitionPage(child: BookingScreen()),
          ),
          GoRoute(
            path: '/chat',
            pageBuilder: (context, state) =>
                const NoTransitionPage(child: ChatScreen()),
          ),
        ],
      ),

      // other routes that are outside the shell
      GoRoute(
        path: '/gridcards',
        pageBuilder: (context, state) =>
            const NoTransitionPage(child: GridViewScreencards()),
      ),
    ],
  );
}
