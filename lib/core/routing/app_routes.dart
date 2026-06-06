import 'package:flutter/material.dart';
import 'package:goldy/core/routing/router.dart';
import 'package:goldy/features/gold/presentation/screens/gold_screen.dart';
import 'package:goldy/features/sliver_screen.dart';
import 'package:goldy/home_screen.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.home:
        return MaterialPageRoute(
          builder: (context) {
            return const HomeScreen();
          },
        );
      case AppRoutes.silvertracker:
        return MaterialPageRoute(
          builder: (context) {
            return const SliverScreen();
          },
        );
      case AppRoutes.goldtracker:
        return MaterialPageRoute(
          builder: (context) {
            return const GoldScreen();
          },
        );
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No Route define for ${settings.name}')),
          ),
        );
    }
  }
}
