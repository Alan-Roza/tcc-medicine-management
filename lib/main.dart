import 'package:flutter/material.dart';
import 'package:tcc_medicine_management/app/core/routes/app_routes.dart';
import 'package:tcc_medicine_management/app/shared/style/app_theme.dart';
import 'package:tcc_medicine_management/app/shared/style/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: appRouter,
      // theme: AppTheme.lightTheme
      theme: AppTheme.lightTheme,
    );
  }
}
