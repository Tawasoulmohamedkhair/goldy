import 'package:flutter/material.dart';
import 'package:goldy/core/constants/app_strings.dart';
import 'package:goldy/core/networking/dio_helper.dart';
import 'package:goldy/core/routing/app_routes.dart';
import 'package:goldy/core/routing/router.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppStrings.appName,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      initialRoute: AppRoutes.home,
      onGenerateRoute: AppRouter().generateRoute,
    );
  }
}
