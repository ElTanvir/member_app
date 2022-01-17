import 'package:flutter/material.dart';
import 'package:member_app/features/auth/views/auth_page.dart';
import 'package:member_app/features/core/views/core_view.dart';
import 'package:member_app/features/core/views/splash_screen.dart';
import 'package:page_transition/page_transition.dart';

class Routes {
  Routes._();
  static const splash = '/splashScreen';
  static const home = '/homePage';
  static const login = '/loginPage';
}

Route generatedRoutes(RouteSettings settings) {
  switch (settings.name) {
    case Routes.home:
      return PageTransition(
        child: const CoreView(),
        type: PageTransitionType.fade,
        settings: settings,
        duration: const Duration(seconds: 1),
        reverseDuration: const Duration(seconds: 1),
      );

    case Routes.splash:
      return PageTransition(
        child: const SplashScreen(),
        type: PageTransitionType.fade,
        settings: settings,
        duration: const Duration(seconds: 1),
        reverseDuration: const Duration(seconds: 1),
      );

    case Routes.login:
      return PageTransition(
        child: LoginPage(),
        type: PageTransitionType.fade,
        settings: settings,
        duration: const Duration(seconds: 1),
        reverseDuration: const Duration(seconds: 1),
      );
    default:
      throw Exception('Invalid route: ${settings.name}');
  }
  // You can also return a PageRouteBuilder and
  // define custom transitions between pages
}
