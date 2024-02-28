import 'package:auth_modules/auth_modules.dart';
import 'package:auth_modules/resources/app_constants.dart';
import 'package:auth_modules_test/router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Center(
            child: Text('HOMEPAGE'),
          ),
          ElevatedButton(
            onPressed: () {
              context.go('/second');
            },
            child: Text('go to second page'),
          )
        ],
      ),
    );
  }
}


@TypedGoRoute<AuthRoute>(path: 'main')
class AuthRoute extends GoRouteData {
  static final GlobalKey<NavigatorState> $parentNavigatorKey =
      AppRouterConfig.rootNavKey;

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return CustomTransitionPage<void>(
      key: state.pageKey,
      child: AuthScreenLib(
        vm: injection<IAuthVMLib>(),
        cb: (result) {

          switch (result) {
            case "home":
              HomeRoute().go(context);
              break;
            case "forgotPassword":
              PasswordRecoveryRoute().push(context);
              break;
            case "register":
              LandingRoute().push(context);
              break;
            case "showPrivacyPolicy":
              break;
          }
        },
      ),
      transitionDuration: AppConstants.screenTransitionDuration,
      transitionsBuilder: (context, animation, secondaryAnimation, child) =>
          SlideTransition(
        position: Tween(
                begin: const Offset(0.0, 1.0), end: const Offset(0.0, 0.0))
            .animate(CurvedAnimation(parent: animation, curve: Curves.easeOut)),
        child: child,
      ),
    );
  }
}