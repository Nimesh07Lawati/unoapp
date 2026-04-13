// lib/main.dart or your main app file
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unoapp/core/router/getx_app_router.dart';
import 'package:unoapp/features/unknown_page/unknown_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'UnoApp',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,

      // Routing configuration
      initialRoute: GetxAppRoutes.initialRoute,
      getPages: GetxAppRoutes.routes,

      // Optional: Add unknown route handler
      unknownRoute: GetPage(
        name: '/not-found',
        page: () => const NotFoundScreen(),
        transition: Transition.fade,
      ),

      // Theme configuration
      theme: ThemeData(primarySwatch: Colors.blue, useMaterial3: true),

      // Optional: Route observers for analytics
      routingCallback: (routing) {
        // Track route changes for analytics
        debugPrint('Navigating to: ${routing?.current}');
      },
    );
  }
}
