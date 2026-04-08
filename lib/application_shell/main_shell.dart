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
      body: child,
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.go('/search'),
        child: const Icon(Icons.search),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 8,
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
              const SizedBox(width: 40),
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
    );
  }
}
