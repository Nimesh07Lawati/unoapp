import 'package:flutter/material.dart';
import 'package:unoapp/core/router/app_router.dart';
import 'package:unoapp/gen/colors.gen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: ColorName.applicationBackgroundColor,
      ),
      routerConfig: AppRouter.router,
    );
  }
}
