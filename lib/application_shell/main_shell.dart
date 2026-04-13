import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unoapp/application_shell/text_style/shell_text_style.dart';
import 'package:unoapp/application_shell/widgets/nav_items.dart';
import 'package:unoapp/core/router/route_name.dart';
import 'package:unoapp/gen/assets.gen.dart';
import 'package:unoapp/gen/colors.gen.dart';

class MainShell extends StatelessWidget {
  final Widget child;

  const MainShell({super.key, required this.child});

  // Using GetX's reactive current route
  int _selectedIndex() {
    final currentRoute = Get.currentRoute;
    switch (currentRoute) {
      case RouteNames.home:
        return 0;
      case RouteNames.categories:
        return 1;
      case RouteNames.search:
        return 2;
      case RouteNames.booking:
        return 3;
      case RouteNames.chat:
        return 4;
      default:
        return 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    // Use Obx to reactively update when route changes
    return Obx(() {
      final index = _selectedIndex();

      return Scaffold(
        body: SafeArea(top: true, bottom: false, child: child),
        extendBody: true,
        bottomNavigationBar: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Sign In banner sits just above the nav bar
            Container(
              width: double.infinity,
              height: 64,
              color: ColorName.cardTitle.withValues(alpha: 0.7),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Left side text
                  const Expanded(
                    child: Text(
                      'Sign in for faster bookings, saved preferences, and personalised recommendations.',
                      style: ShellTextStyles.bannerText,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(width: 12),

                  // Sign In button
                  SizedBox(
                    width: 79,
                    height: 32,
                    child: OutlinedButton(
                      onPressed: () {
                        debugPrint("Sign In button pressed");
                        // You can navigate to sign in screen here
                        // Get.toNamed(RouteNames.signIn);
                      },
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.white,
                        side: const BorderSide(color: Colors.white, width: 1.5),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 8,
                        ),
                      ),
                      child: const Text(
                        'Sign In',
                        style: ShellTextStyles.signInButtonText,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Bottom nav bar with white background
            Container(
              color: ColorName.cardBackground,
              child: BottomAppBar(
                color: ColorName.cardBackground,
                elevation: 0,
                padding: EdgeInsets.zero,
                child: SizedBox(
                  height: 65,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      NavItem(
                        svgPath: Assets.icons.navBarIcons.home.path,
                        label: 'Home',
                        selected: index == 0,
                        activeColor: ColorName.cardDiscountTag,
                        onTap: () => _navigateToRoute(RouteNames.home),
                      ),
                      NavItem(
                        svgPath: Assets.icons.navBarIcons.noteText.path,
                        label: 'Categories',
                        selected: index == 1,
                        activeColor: ColorName.cardDiscountTag,
                        onTap: () => _navigateToRoute(RouteNames.categories),
                      ),

                      // Center Search Button (part of nav bar)
                      GestureDetector(
                        onTap: () => _navigateToRoute(RouteNames.search),
                        child: Container(
                          width: 56,
                          height: 56,
                          margin: const EdgeInsets.only(bottom: 8),
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [Color(0xFF4A90E2), Color(0xFF357ABD)],
                            ),
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: const Color(
                                  0xFF4A90E2,
                                ).withValues(alpha: 0.3),
                                blurRadius: 12,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: const Icon(
                            Icons.search,
                            color: Colors.white,
                            size: 28,
                          ),
                        ),
                      ),

                      NavItem(
                        svgPath: Assets.icons.navBarIcons.calendar.path,
                        label: 'Booking',
                        selected: index == 3,
                        activeColor: ColorName.cardDiscountTag,
                        onTap: () => _navigateToRoute(RouteNames.booking),
                      ),
                      NavItem(
                        svgPath: Assets.icons.navBarIcons.chat.path,
                        label: 'Chat',
                        selected: index == 4,
                        activeColor: ColorName.cardDiscountTag,
                        onTap: () => _navigateToRoute(RouteNames.chat),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    });
  }

  // Helper method for navigation with better UX
  void _navigateToRoute(String routeName) {
    // Don't navigate if already on that route
    if (Get.currentRoute == routeName) return;

    // Use offNamed to replace the current route (like GoRouter's go)
    // This maintains proper navigation stack for bottom nav bars
    Get.offNamed(routeName);

    // Alternative: Use toNamed if you want to keep navigation history
    // Get.toNamed(routeName);
  }
}
