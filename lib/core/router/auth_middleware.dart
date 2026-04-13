// lib/core/middleware/auth_middleware.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    // Example: Check if user is logged in
    // final authController = Get.find<AuthController>();

    // if (route == RouteNames.booking && !authController.isLoggedIn) {
    //   return const RouteSettings(name: RouteNames.home);
    // }

    return null; // Continue to requested route
  }

  @override
  int get priority => 1; // Higher priority runs first
}
