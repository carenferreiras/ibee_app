import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

import '../../feature/feature.dart';
import '../core.dart';



class AppRouter {
  final AuthBloc authBloc;
  late GoRouter router;

  AppRouter(this.authBloc) {
    router = GoRouter(
      debugLogDiagnostics: true,
      initialLocation: AppRoutes.welcome.path,
      routes: [
        GoRoute(
          path: AppRoutes.welcome.path,
          name: AppRoutes.welcome.name,
          pageBuilder: (context, state) =>
              const NoTransitionPage(child: WelcomeView()),
          routes: [
            GoRoute(
              path: AppRoutes.login.path,
              name: AppRoutes.login.name,
              pageBuilder: (context, state) =>
                  const CupertinoPage(child: LoginView()),
            ),
            GoRoute(
              path: AppRoutes.register.path,
              name: AppRoutes.register.name,
              pageBuilder: (context, state) =>
                  const CupertinoPage(child: RegisterView()),
            ),
          ],
        ),
        GoRoute(
          path: AppRoutes.home.path,
          name: AppRoutes.home.name,
          pageBuilder: (context, state) =>
              NoTransitionPage(child: HomeView(authBloc: authBloc)),
          routes: [
            GoRoute(
              path: AppRoutes.setting.path,
              name: AppRoutes.setting.name,
              pageBuilder: (context, state) => NoTransitionPage(
                  child: SettingsView(authBloc: state.extra as AuthBloc)),
            ),
          ],
        ),
      ],
      redirect: (context, state) =>
          RouteUtils.handleRedirect(authBloc, context, state),
      refreshListenable: GoRouterRefreshStream(authBloc),
    );
  }
}
