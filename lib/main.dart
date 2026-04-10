import 'package:flutter/material.dart';
import 'package:unoapp/core/application_theme/color.dart';
import 'package:unoapp/core/router/app_router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(scaffoldBackgroundColor: AppColors.appBackgroundColor),
      routerConfig: AppRouter.router,
    );
  }
}
