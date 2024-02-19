import 'package:go_router/go_router.dart';

import 'package:flutter/material.dart';
import 'package:animations/animations.dart';
import 'package:project_n2/screens/to_do_screen.dart';
import 'package:project_n2/screens/wallets_screen.dart';

// MODELS & ENUMS

import 'package:project_n2/tools/enums/settings.dart';

// SCREENS & WIDGETS
import 'package:project_n2/screens/settings_screen.dart';
import 'package:project_n2/widgets/main_layout.dart';
import 'package:project_n2/screens/home_screen.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();

extension GoRouterLocation on GoRouter {
  String get location {
    final RouteMatch lastMatch = routerDelegate.currentConfiguration.last;
    final RouteMatchList matchList = lastMatch is ImperativeRouteMatch
        ? lastMatch.matches
        : routerDelegate.currentConfiguration;
    return matchList.uri.toString();
  }
}

final router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: Screens.home.path,
  routes: [
    ShellRoute(
      navigatorKey: _shellNavigatorKey,
      builder: (context, state, child) {
        return MainLayout(child: child);
      },
      routes: [
        // This screen is displayed on the ShellRoute's Navigator.
        GoRoute(
          path: Screens.home.path,
          pageBuilder: (context, state) => CustomTransitionPage(
              transitionDuration: const Duration(milliseconds: 450),
              reverseTransitionDuration: const Duration(milliseconds: 350),
              maintainState: true,
              child: const HomeScreen(),
              transitionsBuilder: (ctx, anim1, anim2, child) {
                return FadeTransition(
                  opacity: anim1,
                  child: child,
                );
                // return canim.FadeThroughTransition(
                //   fillColor: Colors.transparent,
                //   animation: anim1,
                //   secondaryAnimation: anim2,
                //   child: child,
                // );
              }),
        ),
        GoRoute(
          path: Screens.wallets.path,
          pageBuilder: (context, state) {
            return const FadeThroughTransitionPageWrapper(
              transitionKey: ValueKey('wallets'),
              screen: WalletsScreen(),
            );
          },
        ),
        GoRoute(
            path: Screens.toDo.path,
            pageBuilder: (context, state) {
              return const FadeThroughTransitionPageWrapper(
                transitionKey: ValueKey('toDo'),
                screen: ToDoScreen(),
              );
            }),
      ],
    ),
    GoRoute(
      path: Screens.settings.path,
      pageBuilder: (context, state) => CustomTransitionPage(
          transitionDuration: const Duration(milliseconds: 450),
          reverseTransitionDuration: const Duration(milliseconds: 350),
          child: const SettingsScreen(),
          transitionsBuilder: (ctx, anim1, anim2, child) {
            return FadeTransition(
              opacity: anim1,
              child: child,
            );
            // return canim.FadeThroughTransition(
            //   fillColor: Colors.transparent,
            //   animation: anim1,
            //   secondaryAnimation: anim2,
            //   child: child,
            // );
          }),
    ),
    GoRoute(
      path: '/dialog',
      pageBuilder: (context, state) {
        return CustomTransitionPage(
          transitionDuration: const Duration(milliseconds: 575),
          reverseTransitionDuration: const Duration(milliseconds: 475),
          // transitionDuration: const Duration(milliseconds: 3000),
          // reverseTransitionDuration: const Duration(milliseconds: 3000),
          barrierColor: Colors.black.withOpacity(0.66),
          barrierDismissible: true,
          opaque: false,
          child: state.extra as Widget,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return ScaleTransition(
              scale: Tween<double>(begin: 0.92, end: 1.0).animate(animation),
              child: ScaleTransition(
                scale: Tween<double>(begin: 1.0, end: 0.92).animate(
                  ReverseAnimation(secondaryAnimation),
                ),
                child: Opacity(
                  opacity: animation.value,
                  child: child,
                ),
              ),
            );
            // return FadeTransition(
            //   opacity: animation,
            //   child: child,
            // );
            // return canim.FadeThroughTransition(
            //   fillColor: Colors.transparent,
            //   animation: animation,
            //   secondaryAnimation: secondaryAnimation,
            //   child: child,
            // );
            // return child; // NO ANIMATION
          },
        );
      },
    ),
    GoRoute(
      path: '/fast-dialog',
      pageBuilder: (context, state) {
        return CustomTransitionPage(
          transitionDuration: const Duration(milliseconds: 325),
          reverseTransitionDuration: const Duration(milliseconds: 275),
          // transitionDuration: const Duration(milliseconds: 3000),
          // reverseTransitionDuration: const Duration(milliseconds: 3000),
          barrierColor: Colors.black.withOpacity(0.66),
          barrierDismissible: true,
          opaque: false,
          child: state.extra as Widget,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return ScaleTransition(
              scale: Tween<double>(begin: 0.9, end: 1.0).animate(animation),
              child: ScaleTransition(
                scale: Tween<double>(begin: 1.0, end: 0.9).animate(
                  ReverseAnimation(secondaryAnimation),
                ),
                child: Opacity(
                  opacity: animation.value,
                  child: child,
                ),
              ),
            );
            // return FadeTransition(
            //   opacity: animation,
            //   child: child,
            // );
            // return canim.FadeThroughTransition(
            //   fillColor: Colors.transparent,
            //   animation: animation,
            //   secondaryAnimation: secondaryAnimation,
            //   child: child,
            // );
            // return child; // NO ANIMATION
          },
        );
      },
    ),
  ],
);

////////////////////////////////////////////////////////////////////////////////
///                                ANIMATIONS                                ///
////////////////////////////////////////////////////////////////////////////////

// Horizontal Shared Z-Axis transition (Motion)
class SharedAxisHorizontalTransitionPageWrapper extends Page {
  const SharedAxisHorizontalTransitionPageWrapper(
      {required this.screen, required this.transitionKey})
      : super(key: transitionKey);

  final Widget screen;
  final ValueKey transitionKey;

  @override
  Route createRoute(BuildContext context) {
    return PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 450),
        reverseTransitionDuration: const Duration(milliseconds: 350),
        settings: this,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return SharedAxisTransition(
            fillColor: Colors.transparent,
            animation: animation,
            secondaryAnimation: secondaryAnimation,
            transitionType: SharedAxisTransitionType.horizontal,
            child: child,
          );
        },
        pageBuilder: (context, animation, secondaryAnimation) {
          return screen;
        });
  }
}

// Scaled Shared Z-Axis transition (Motion)
class SharedAxisScaledTransitionPageWrapper extends Page {
  const SharedAxisScaledTransitionPageWrapper(
      {required this.screen, required this.transitionKey})
      : super(key: transitionKey);

  final Widget screen;
  final ValueKey transitionKey;

  @override
  Route createRoute(BuildContext context) {
    return PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 650),
        reverseTransitionDuration: const Duration(milliseconds: 500),
        settings: this,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return SharedAxisTransition(
            //fillColor: Theme.of(context).cardColor,
            fillColor: Colors.transparent,
            animation: animation,
            secondaryAnimation: secondaryAnimation,
            transitionType: SharedAxisTransitionType.scaled,
            child: child,
          );
        },
        pageBuilder: (context, animation, secondaryAnimation) {
          return screen;
        });
  }
}

// Fade through transition (Motion)
class FadeThroughTransitionPageWrapper extends Page {
  const FadeThroughTransitionPageWrapper(
      {required this.screen, required this.transitionKey})
      : super(key: transitionKey);

  final Widget screen;
  final ValueKey transitionKey;

  @override
  Route createRoute(BuildContext context) {
    return PageRouteBuilder(
      transitionDuration: const Duration(milliseconds: 550),
      reverseTransitionDuration: const Duration(milliseconds: 500),
      settings: this,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeThroughTransition(
          fillColor: Theme.of(context).scaffoldBackgroundColor,
          animation: animation,
          secondaryAnimation: secondaryAnimation,
          child: child,
        );
      },
      pageBuilder: (context, animation, secondaryAnimation) {
        return screen;
      },
    );
  }
}
