import 'package:flutter/material.dart';
import 'package:social_media_app/features/comments_screen/presentation/pages/comments_screen.dart';
import 'package:social_media_app/features/home_screen/presentation/pages/home_layout.dart';
import 'package:social_media_app/splash%20screen/splash_screen.dart';

class Routes {
  static const String splashScreen = '/';
  static const String homeLayOut = 'home layout';
  static const String commentsScreen = 'comments screen';
}

class AppRoutes {
  static Route onGenerate(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.homeLayOut:
        return MaterialPageRoute(
          builder: (context) => const HomeLayOut(),
        );
      case Routes.commentsScreen:
        return MaterialPageRoute(
          settings: RouteSettings(arguments: routeSettings.arguments),
          builder: (context) => const CommentsScreen(),
        );
      case Routes.splashScreen:
        return MaterialPageRoute(
          builder: (context) => const SplashScreen(),
        );
      default:
        {
          return MaterialPageRoute(
            builder: (context) => unDefineRoute(),
          );
        }
    }
  }

  static Widget unDefineRoute() => const Scaffold(
        body: Center(
          child: Text('unDefinedRoute'),
        ),
      );
}
