import 'package:auth_modules_test/pages/home_page.dart';
import 'package:auth_modules_test/pages/second_page.dart';
import 'package:go_router/go_router.dart';

abstract class PageName {
  static const homeRoute = '/';
  static const secondRoute = 'second';

}


final router = GoRouter( routes: [
  GoRoute(
    path: '/',
    builder: (context, state) => const HomePage(),
    routes: [
      GoRoute(
        path: 'second',
        builder: (context, state) => const SecondPage(),
      ),
      // ... add other routes
    ],
  ),
]);