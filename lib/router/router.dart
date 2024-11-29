import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobileshop/features/auth/presentation/login_page.dart';
import 'package:mobileshop/features/auth/presentation/sign_up_page.dart';
import 'package:mobileshop/features/product/presentation/product_details.dart';
import 'package:mobileshop/features/product/presentation/product_list.dart';

import '../main.dart';

// GoRouter configuration
final router = GoRouter(
  debugLogDiagnostics: true,
  routes: [
    GoRoute(
        path: '/',
        pageBuilder: defaultPageBuilder((state) => const SplashScreen()),
        name: 'splash'),
    GoRoute(
        path: '/welcome',
        pageBuilder: defaultPageBuilder((state) => const WelComePage()),
        name: 'welcome'),
    GoRoute(
        path: '/sign_up',
        pageBuilder: defaultPageBuilder((state) => const SignUpPage()),
        name: 'signUpPage'),
    GoRoute(
        path: '/login',
        pageBuilder: defaultPageBuilder((state) => const LoginPage()),
        name: 'login'),
    GoRoute(
        path: '/product-list',
        pageBuilder: defaultPageBuilder((state) => const ProductList()),
        name: 'productList'),
    GoRoute(
        path: '/product-details',
        pageBuilder: defaultPageBuilder((state) => const ProductDetails()),
        name: 'product-details'),
  ],
);
CustomTransitionPage buildPageWithDefaultTransition<T>({
  required BuildContext context,
  required GoRouterState state,
  required Widget child,
}) {
  return CustomTransitionPage<T>(
    key: state.pageKey,
    child: child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) =>
        FadeTransition(
            opacity: CurveTween(curve: Curves.easeInOutCirc).animate(animation),
            child: child),
  );
}

Page<dynamic> Function(BuildContext, GoRouterState) defaultPageBuilder<T>(
        Widget Function(GoRouterState state) child) =>
    (BuildContext context, GoRouterState state) {
      return buildPageWithDefaultTransition<T>(
          context: context,
          state: state,
          child: LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxWidth > 600 && kIsWeb) {
                return Container(
                  color: Colors.blue,
                  child: Center(
                    child: Container(
                      constraints: const BoxConstraints(maxWidth: 450),
                      child: child(state),
                    ),
                  ),
                );
              }
              return Center(child: child(state));
            },
          ));
    };
