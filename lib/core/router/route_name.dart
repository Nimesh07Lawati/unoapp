// lib/core/router/route_name.dart
class RouteNames {
  // Main routes
  static const mainShell = '/';
  static const home = '/home';
  static const categories = '/categories';
  static const search = '/search';
  static const booking = '/booking';
  static const chat = '/chat';
  static const gridCards = '/gridcards';

  // Helper method to get route with parameters
  static String withParams(String route, {Map<String, dynamic>? params}) {
    if (params == null || params.isEmpty) return route;

    final queryParams = params.entries
        .map((e) => '${e.key}=${e.value}')
        .join('&');
    return '$route?$queryParams';
  }
}
