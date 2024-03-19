
import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:rick_and_morty/core/routes/route_path.dart';

import '../../features/error/presentation/error_page.dart';
import '../../features/home/presentation/pages/home_page.dart';
import '../../features/main_screen.dart';






class AppRouter {

  static final _rootNavigatorKey = GlobalKey<NavigatorState>();
  static final _shellNavigatorAKey = GlobalKey<NavigatorState>(debugLabel: 'shellA');


  static final GoRouter routerx = GoRouter(
    initialLocation: Routes.mainPagePath,
    // navigatorKey: Get.key,
    debugLogDiagnostics: true,
    routes: [

      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          // the UI shell
          return MainScreen(
              navigationShell: navigationShell);
        },
        branches: [
          // first branch (A)
          StatefulShellBranch(
            initialLocation: Routes.mainPagePath,
            navigatorKey: _shellNavigatorAKey,
            routes: [
              // top route inside branch
              GoRoute(
                name: Routes.mainPage,
                path: Routes.mainPagePath,
                pageBuilder: (context, state) => const NoTransitionPage(
                  child: HomePage(),
                ),
                routes:  [

                  // GoRoute(
                  //   path: "news/:id/:path",
                  //   name: "news",
                  //   builder: (context, state) => NewsPage(
                  //     userId: state.pathParameters["id"].toString(),
                  //     path: state.pathParameters["path"].toString(),
                  //   ),
                  // )

                ],
              ),
            ],
          ),
        ],
      ),



      // GoRoute(
      //   name: Routes.homePage,
      //   path: Routes.homePagePath,
      //   builder: (context, state) => const HomePage(),
      // ),

      // GoRoute(
      //   name: Routes.ProductDetailsPage,
      //   path: Routes.ProductDetailsPagePath,
      //   pageBuilder: (context, state) =>  NoTransitionPage(
      //     child: ProductDetailsPage(product: state.extra as Product),
      //   ),
      // ),
      GoRoute(
        name: Routes.ErrorPage,
        path: Routes.ErrorPagePath,
        pageBuilder: (context, state) =>  NoTransitionPage(
          child: ErrorPage(),
        ),
      ),


    ],
    errorBuilder: (context, state) => const ErrorPage(),
  );

  static GoRouter get router => routerx;
}

CustomTransitionPage buildPageWithDefaultTransition<T>({
  required BuildContext context,
  required GoRouterState state,
  required Widget child,
}) {
  return CustomTransitionPage<T>(
    key: state.pageKey,
    child: child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) =>
        FadeTransition(opacity: animation, child: child),
  );
}