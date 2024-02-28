# Getting started

TODO: List prerequisites and provide or point to information on how to
start using the package.

1. add dependencies
    if on local storage =>

    auth_modules:
        path: /Users/max/Downloads/auth_modules



    on git =>

    auth_modules:
        git:
            url:
            ref:

2. setup on routing like:

@TypedGoRoute<AuthRoute>(path: _AUTH_PATH)
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

3. import and setup dependency injection like =>

    gh.factory<_i26.IProfileVM>(() => _i27.ProfileVMImpl(
          gh<_i7.IAuthRepositoryProvider>(),
          gh<_i32.IAuthUsecaseLib>(),
        ));

    gh.factory<_i30.IAuthUsecaseLib>(() => _i9.AuthUsecaseImpl(
          gh<_i5.IAuthGateway>(),
          gh<_i5.IAuthRepository>(),
        ));

4. running your code !!
