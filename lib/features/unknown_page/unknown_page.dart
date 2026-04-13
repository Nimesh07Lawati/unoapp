// Optional: 404 screen
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unoapp/core/router/route_name.dart';

class NotFoundScreen extends StatelessWidget {
  const NotFoundScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Page Not Found')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error_outline, size: 64),
            const SizedBox(height: 16),
            const Text('The page you\'re looking for doesn\'t exist.'),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => Get.offAllNamed(RouteNames.home),
              child: const Text('Go Home'),
            ),
          ],
        ),
      ),
    );
  }
}
