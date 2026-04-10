import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:unoapp/application_shell/text_style/shell_text_style.dart';
import 'package:unoapp/application_shell/widgets/nav_items.dart';
import 'package:unoapp/core/router/route_pathts.dart';
import 'package:unoapp/gen/assets.gen.dart';
import 'package:unoapp/gen/colors.gen.dart';

class MainShell extends StatelessWidget {
  final Widget child;

  const MainShell({super.key, required this.child});

  int _selectedIndex(String location) {
    switch (location) {
      case '/home':
        return 0;
      case '/categories':
        return 1;
      case '/search':
        return 2;
      case '/booking':
        return 3;
      case '/chat':
        return 4;
      default:
        return 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    final location = GoRouterState.of(context).uri.toString();
    final index = _selectedIndex(location);

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
            color: ColorName.cardTitle.withValues(
              alpha: 0.7,
            ), // Using generated color (#101B30)
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Left side text
                const Expanded(
                  child: Text(
                    'Sign in for faster bookings, saved preferences, and personalised recommendations.',
                    style: ShellTextStyles.bannerText, // Using separated style
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
                      activeColor:
                          ColorName.cardDiscountTag, // Using generated color
                      onTap: () => context.go(RoutePaths.home),
                    ),
                    NavItem(
                      svgPath: Assets.icons.navBarIcons.noteText.path,
                      label: 'Categories',
                      selected: index == 1,
                      activeColor: ColorName.cardDiscountTag,
                      onTap: () => context.go(RoutePaths.categories),
                    ),

                    // Center Search Button (part of nav bar)
                    GestureDetector(
                      onTap: () => context.go(RoutePaths.search),
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
                      svgPath: Assets
                          .icons
                          .navBarIcons
                          .calendar
                          .path, // Using generated asset
                      label: 'Booking',
                      selected: index == 3,
                      activeColor:
                          ColorName.cardDiscountTag, // Using generated color
                      onTap: () => context.go(RoutePaths.booking),
                    ),
                    NavItem(
                      svgPath: Assets
                          .icons
                          .navBarIcons
                          .chat
                          .path, // Using generated asset
                      label: 'Chat',
                      selected: index == 4,
                      activeColor:
                          ColorName.cardDiscountTag, // Using generated color
                      onTap: () => context.go(RoutePaths.chat),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
