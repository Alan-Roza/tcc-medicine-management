import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tcc_medicine_management/app/modules/medicine/presentation/pages/medicine_stock_view_form_page.dart';
import 'package:tcc_medicine_management/app/modules/medicine/presentation/pages/medicine_stock_list_page.dart';
import 'package:tcc_medicine_management/app/modules/unauth/presentation/pages/unauth_login_page.dart';

final GoRouter appRouter = GoRouter (
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const UnauthLoginPage();
      },
    ),
    GoRoute(
      path: '/medicine-stock-list',
      builder: (BuildContext context, GoRouterState state) {
        return const MedicineStockListPage();
      },
    ),
     GoRoute(
      path: '/medicine-stock-form',
      builder: (BuildContext context, GoRouterState state) {
        return const MedicineStockFormPage();
      },
    )
  ]
);