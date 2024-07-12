import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tcc_medicine_management/app/modules/first_access/address_info/presentation/address_info_page.dart';
import 'package:tcc_medicine_management/app/modules/first_access/health_info/presentation/health_info_page.dart';
import 'package:tcc_medicine_management/app/modules/first_access/health_assistance/presentation/health_assistance_page.dart';
import 'package:tcc_medicine_management/app/modules/first_access/user_info/presentation/user_info_page.dart';
import 'package:tcc_medicine_management/app/modules/first_access/user_level_assistance/presentation/user_level_assistance_page.dart';
import 'package:tcc_medicine_management/app/modules/medicine/presentation/pages/medicine_stock_view_form_page.dart';
import 'package:tcc_medicine_management/app/modules/medicine/presentation/pages/medicine_stock_list_page.dart';
import 'package:tcc_medicine_management/app/modules/unauth/home/presentation/unauth_home_page.dart';
import 'package:tcc_medicine_management/app/modules/unauth/login/presentation/unauth_login_page.dart';
import 'package:tcc_medicine_management/app/modules/unauth/signup/presentation/unauth_signup_page.dart';

// final GoRouter appRouter = GoRouter (
//   routes: <RouteBase>[
//     GoRoute(
//       path: '/',
//       builder: (BuildContext context, GoRouterState state) {
//         return const UnauthLoginPage();
//       },
//     ),
//     GoRoute(
//       path: '/medicine-stock-list',
//       builder: (BuildContext context, GoRouterState state) {
//         return const MedicineStockListPage();
//       },
//     ),
//      GoRoute(
//       path: '/medicine-stock-form',
//       builder: (BuildContext context, GoRouterState state) {
//         return const MedicineStockFormPage();
//       },
//     )
//   ]
// );

final GoRouter appRouter = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      name: 'Home',
      builder: (BuildContext context, GoRouterState state) {
        // Return a placeholder widget. The actual widget will be determined by the subroutes.
        // return const UnauthLoginPage();
        return const UnauthHomePage();
        // return const MedicineStockFormPage();
      },
      routes: [
        GoRoute(
          path: 'login',
          name: 'Login',
          builder: (BuildContext context, GoRouterState state) {
            return const UnauthLoginPage();
          },
        ),
        GoRoute(
          path: 'signup',
          name: 'Signup',
          builder: (BuildContext context, GoRouterState state) {
            return const UnauthSignupPage();
          },
        ),
      ],
    ),
    GoRoute(
        path: '/first-access',
        name: 'FirstAccess',
        builder: (BuildContext context, GoRouterState state) {
          return const UserLevelAssistancePage();
        },
        routes: [
          GoRoute(
            path: 'user-info',
            name: 'UserInfo',
            builder: (BuildContext context, GoRouterState state) {
              return const UserInfoPage();
            },
          ),
          GoRoute(
            path: 'address-info',
            name: 'AddressInfo',
            builder: (BuildContext context, GoRouterState state) {
              return const AddressInfoPage();
            },
          ),
          GoRoute(
            path: 'health-assistance',
            name: 'HealthAssistance',
            builder: (BuildContext context, GoRouterState state) {
              return const HealthAssistancePage();
            },
          ),
          GoRoute(
            path: 'health-info',
            name: 'HealthInfo',
            builder: (BuildContext context, GoRouterState state) {
              return const HealthInfoPage();
            },
          ),
        ]),
    GoRoute(
      path: '/medicine-stock-list',
      name: 'MedicineStockList',
      builder: (BuildContext context, GoRouterState state) {
        return const MedicineStockListPage();
      },
      routes: [
        GoRoute(
          path: 'medicine-stock-form',
          name: 'MedicineStockForm',
          builder: (BuildContext context, GoRouterState state) {
            return const MedicineStockFormPage();
          },
        ),
        // Add more authenticated routes here.
      ],
    ),
  ],
);
