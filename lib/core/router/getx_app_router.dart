import 'package:get/get.dart';
import 'package:unoapp/application_shell/main_shell.dart';
import 'package:unoapp/core/router/route_name.dart';
import 'package:unoapp/features/booking/booking_screen.dart';
import 'package:unoapp/features/categories/categories_screen.dart';
import 'package:unoapp/features/chat/chat_screen.dart';
import 'package:unoapp/features/home/presentation/home_page_child_screen/grid_view_screen_cards.dart';
import 'package:unoapp/features/home/presentation/home_page_widgets/bindings/category_binding.dart';
import 'package:unoapp/features/home/presentation/home_screen.dart';
import 'package:unoapp/features/search/search_screen.dart';

class GetxAppRoutes {
  static const initialRoute = RouteNames.home;

  static final List<GetPage> routes = [
    // Each shell route wraps its screen in MainShell directly
    GetPage(
      name: RouteNames.home,
      page: () => const MainShell(child: HomeScreen()),
      transition: Transition.noTransition,
      binding: CategoryBinding(),
    ),
    GetPage(
      name: RouteNames.categories,
      page: () => const MainShell(child: CategoriesScreen()),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: RouteNames.search,
      page: () => const MainShell(child: SearchScreen()),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: RouteNames.booking,
      page: () => const MainShell(child: BookingScreen()),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: RouteNames.chat,
      page: () => const MainShell(child: ChatScreen()),
      transition: Transition.noTransition,
    ),

    // Independent route — no shell
    GetPage(
      name: RouteNames.gridCards,
      page: () => GridViewScreencards(),
      transition: Transition.noTransition,
    ),
  ];
}
