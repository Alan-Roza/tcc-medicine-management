import 'package:flutter/material.dart';
import 'package:tcc_medicine_management/app/core/routes/app_routes.dart';
// import 'package:tcc_medicine_management/app/shared/style/app_theme.dart';
import 'package:tcc_medicine_management/app/shared/themes/theme.dart';
import 'package:tcc_medicine_management/app/shared/themes/util.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
final brightness = View.of(context).platformDispatcher.platformBrightness;

 TextTheme textTheme = createTextTheme(context, "Roboto", "Roboto");

    MaterialTheme theme = MaterialTheme(textTheme);

    return MaterialApp.router(
      routerConfig: appRouter,
      // theme: AppTheme.lightTheme
      theme: brightness == Brightness.light ? theme.light() : theme.dark()
    );
  }
}
