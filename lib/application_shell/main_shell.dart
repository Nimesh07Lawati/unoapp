import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:unoapp/widgets/nav_items.dart';

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
            color: const Color(0xFF101B30).withValues(alpha: 0.7),
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Left side text
                const Expanded(
                  child: Text(
                    'Sign in for faster bookings, saved preferences, and personalised recommendations.',
                    style: TextStyle(
                      fontFamily: 'PublicSans',
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                      height: 20 / 12,
                      letterSpacing: 0,
                      color: Colors.white,
                    ),
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
                      style: TextStyle(
                        fontFamily: 'PublicSans',
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Bottom nav bar with integrated search button
          Container(
            decoration: const BoxDecoration(
              border: Border(
                top: BorderSide(color: Color(0xFFE0E0E0), width: 1),
              ),
            ),
            child: BottomAppBar(
              elevation: 0,
              padding: EdgeInsets.zero,
              child: SizedBox(
                height: 65,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    NavItem(
                      icon: Icons.home,
                      label: 'Home',
                      selected: index == 0,
                      onTap: () => context.go('/home'),
                    ),
                    NavItem(
                      icon: Icons.category,
                      label: 'Categories',
                      selected: index == 1,
                      onTap: () => context.go('/categories'),
                    ),

                    // Center Search Button (part of nav bar)
                    GestureDetector(
                      onTap: () => context.go('/search'),
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
                      icon: Icons.book_online,
                      label: 'Booking',
                      selected: index == 3,
                      onTap: () => context.go('/booking'),
                    ),
                    NavItem(
                      icon: Icons.chat,
                      label: 'Chat',
                      selected: index == 4,
                      onTap: () => context.go('/chat'),
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
