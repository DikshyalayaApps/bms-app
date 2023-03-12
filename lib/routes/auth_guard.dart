import 'package:auto_route/auto_route.dart';
import 'package:bms_app/routes/router.gr.dart';

import '../features/auth/presentation/providers/auth_notifier.dart';

class RouteGuard extends AutoRouteGuard {
  // AutoRouteGuard //AutoRedirectGuard
  final AuthNotifier authService;

  RouteGuard(this.authService) {
    // authService.addListener((_) {
    //   if (!authService.state) {
    //     // should be called when the logic effecting this guard changes
    //     // e.g when the user is no longer authenticated
    //     reevaluate();
    //   }
    // });
  }

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    if (authService.state == true) {
      // Authenticated
      return resolver.next();
    } else {
      // UnAuthorized
      // we can't pop the bottom page in the navigator's stack
      // so we just remove it from our local stack
      router.push(
        LoginRoute(
          onLoginCallback: (_) {
            resolver.next();
            router.removeLast();
          },
        ),
      );
    }
  }
}
