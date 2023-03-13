import 'package:auto_route/auto_route.dart';
import 'package:bms_app/features/home/presentation/home.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../features/auth/presentation/screens/login_page.dart';
import '../features/onboarding/presentation/splash_page.dart';
import 'auth_guard.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page|Screen,Route',
  routes: <AutoRoute>[
    AutoRoute(page: SplashPage, initial: true),
    AutoRoute(page: LoginPage, path: 'login'),
    AutoRoute(
      page: HomePage,
      guards: [RouteGuard],
    ),
    // redirect all other paths
    // RedirectRoute(path: '*', redirectTo: 'login'),
  ],
)
class $AppRouter {}

class MyRouteObserver extends AutoRouterObserver {
  @override
  void didPush(Route route, Route? previousRoute) {
    if (kDebugMode) {
      print('New route pushed: ${route.settings.name}');
    }
  }

  @override
  void didPop(Route route, Route? previousRoute) {
    if (kDebugMode) {
      print('New route popped: ${route.settings.name}');
    }
  }

  @override
  void didRemove(Route route, Route? previousRoute) {
    if (kDebugMode) {
      print('New route removed: ${route.settings.name}');
    }
  }

  // only override to observer tab routes
  @override
  void didInitTabRoute(TabPageRoute route, TabPageRoute? previousRoute) {
    if (kDebugMode) {
      print('Tab route visited: ${route.name}');
    }
  }

  @override
  void didChangeTabRoute(TabPageRoute route, TabPageRoute previousRoute) {
    if (kDebugMode) {
      print('Tab route re-visited: ${route.name}');
    }
  }
}

/*

flutter packages pub run build_runner build --delete-conflicting-outputs
*/
