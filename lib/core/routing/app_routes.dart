// import 'package:flutter/material.dart';
// import 'package:goldy/core/routing/router.dart';
// import 'package:goldy/features/gold/presentation/screens/gold_screen.dart';
// import 'package:goldy/features/sliver/presentation/screens/sliver_screen.dart';
// import 'package:goldy/home_screen.dart';

// class AppRouter {
//   Route generateRoute(RouteSettings settings) {
//     switch (settings.name) {
//       case AppRoutes.home:
//         return MaterialPageRoute(
//           builder: (context) {
//             return const HomeScreen();
//           },
//         );
//       case AppRoutes.silvertracker:
//         return MaterialPageRoute(
//           builder: (context) {
//             return const SliverScreen();
//           },
//         );
//       case AppRoutes.goldtracker:
//         return MaterialPageRoute(
//           builder: (context) {
//             return const GoldScreen();
//           },
//         );
//       default:
//         return MaterialPageRoute(
//           builder: (_) => Scaffold(
//             body: Center(child: Text('No Route define for ${settings.name}')),
//           ),
//         );
//     }
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:goldy/core/routing/router.dart';
import 'package:goldy/features/gold/data/repo/gold_repo.dart';
import 'package:goldy/features/gold/presentation/cubit/gold_cubit.dart';
import 'package:goldy/features/gold/presentation/screens/gold_screen.dart';
import 'package:goldy/features/sliver/data/repo/sliver_repo.dart';
import 'package:goldy/features/sliver/presentation/cubit/sliver_cubit.dart';
import 'package:goldy/features/sliver/presentation/screens/sliver_screen.dart';
import 'package:goldy/home_screen.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.home:
        return MaterialPageRoute(builder: (context) => const HomeScreen());

      case AppRoutes.goldtracker:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (_) => GoldCubit(GoldRepo()),
            child: const GoldScreen(),
          ),
        );

      case AppRoutes.silvertracker:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (_) => SliverCubit(SliverRepo()),
            child: const SliverScreen(),
          ),
        );

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No Route defined for ${settings.name}')),
          ),
        );
    }
  }
}
