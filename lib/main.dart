import 'package:flutter/material.dart';
import 'package:travel_app/constants/app_routes.dart';
import 'package:travel_app/constants/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: AppRoutes.getAppRoutes(),
      initialRoute: AppRoutes.splash,
      theme: AppTheme.theme,
    );
  }
}
