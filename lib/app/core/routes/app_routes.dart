import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tcc_medicine_management/app/modules/first_access/address_info/presentation/address_info_page.dart';
import 'package:tcc_medicine_management/app/modules/first_access/administrator_info/presentation/administrator_info_page.dart';
import 'package:tcc_medicine_management/app/modules/first_access/allergy_info/presentation/allergy_info_page.dart';
import 'package:tcc_medicine_management/app/modules/first_access/chronical_disease_info/presentation/chronical_disease_info_page.dart';
import 'package:tcc_medicine_management/app/modules/first_access/configurations/presentation/configurations_page.dart';
import 'package:tcc_medicine_management/app/modules/first_access/health_info/presentation/health_info_page.dart';
import 'package:tcc_medicine_management/app/modules/first_access/health_assistance/presentation/health_assistance_page.dart';
import 'package:tcc_medicine_management/app/modules/first_access/menu_assistance/presentation/menu_assistance_page.dart';
import 'package:tcc_medicine_management/app/modules/first_access/user_info/presentation/user_info_page.dart';
import 'package:tcc_medicine_management/app/modules/first_access/user_level_assistance/presentation/user_level_assistance_page.dart';
import 'package:tcc_medicine_management/app/modules/main_home/daily_summary/presentation/daily_summary_page.dart';
import 'package:tcc_medicine_management/app/modules/main_home/main/presentation/main_home_page.dart';
import 'package:tcc_medicine_management/app/modules/main_home/profile/connection/presentation/connection_page.dart';
import 'package:tcc_medicine_management/app/modules/main_home/profile/faq_help/presentation/faq_help_item_page.dart';
import 'package:tcc_medicine_management/app/modules/main_home/profile/faq_help/presentation/faq_help_page.dart';
import 'package:tcc_medicine_management/app/modules/main_home/profile/health_info/presentation/general_health_info_page.dart';
import 'package:tcc_medicine_management/app/modules/main_home/profile/health_info/presentation/user_allergy_info_page.dart';
import 'package:tcc_medicine_management/app/modules/main_home/profile/health_info/presentation/user_chronical_disease_info_page.dart';
import 'package:tcc_medicine_management/app/modules/main_home/profile/health_info/presentation/user_health_info_page.dart';
import 'package:tcc_medicine_management/app/modules/main_home/profile/main/presentation/user_profile_page.dart';
import 'package:tcc_medicine_management/app/modules/main_home/profile/patient/presentation/patient_page.dart';
import 'package:tcc_medicine_management/app/modules/main_home/profile/user_general_info/presentation/general_info_page.dart';
import 'package:tcc_medicine_management/app/modules/main_home/profile/user_general_info/presentation/user_address_info_page.dart';
import 'package:tcc_medicine_management/app/modules/main_home/profile/user_general_info/presentation/user_general_info_page.dart';
import 'package:tcc_medicine_management/app/modules/medicine/form/presentation/medicine_stock_form_page.dart';
import 'package:tcc_medicine_management/app/modules/medicine/view/presentation/medicine_stock_view_page.dart';
import 'package:tcc_medicine_management/app/modules/treatment/form/presentation/treatment_form_page.dart';
import 'package:tcc_medicine_management/app/modules/unauth/home/presentation/unauth_home_page.dart';
import 'package:tcc_medicine_management/app/modules/unauth/login/presentation/unauth_login_page.dart';
import 'package:tcc_medicine_management/app/modules/unauth/signup/presentation/unauth_signup_page.dart';

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
        GoRoute(
          path: 'allergy-info',
          name: 'AllergyInfo',
          builder: (BuildContext context, GoRouterState state) {
            return const AllergyInfoPage();
          },
        ),
        GoRoute(
          path: 'chronical-disease-info',
          name: 'ChronicalDiseaseInfo',
          builder: (BuildContext context, GoRouterState state) {
            return const ChronicalDiseaseInfoPage();
          },
        ),
        GoRoute(
          path: 'configurations-info',
          name: 'ConfigurationsInfo',
          builder: (BuildContext context, GoRouterState state) {
            return const ConfigurationsPage();
          },
        ),
        GoRoute(
          path: 'administrator-info',
          name: 'AdministratorInfo',
          builder: (BuildContext context, GoRouterState state) {
            return const AdministratorInfoPage();
          },
        ),
        GoRoute(
          path: 'menu-assistance',
          name: 'MenuAssistance',
          builder: (BuildContext context, GoRouterState state) {
            return const MenuAssistancePage();
          },
        ),
      ],
    ),
    GoRoute(
      path: '/main-home',
      name: 'MainHome',
      builder: (BuildContext context, GoRouterState state) {
        return const MainHomePage();
      },
      routes: [
        GoRoute(
          path: 'daily_summary',
          name: 'DailySummary',
          builder: (BuildContext context, GoRouterState state) {
            return DailySummaryPage();
          },
        ),
        GoRoute(
          path: 'medicine-stock-form',
          name: 'MedicineStockForm',
          builder: (BuildContext context, GoRouterState state) {
            return const MedicineStockFormPage();
          },
        ),
        GoRoute(
          path: 'medicine-stock-view',
          name: 'MedicineStockView',
          builder: (BuildContext context, GoRouterState state) {
            Map<String, String> params = state.uri.queryParameters;
            bool readOnly = params['readOnly'] == 'true';

            return MedicineStockViewPage(readOnly: readOnly);
          },
        ),
        GoRoute(
          path: 'treatment-form',
          name: 'TreatmentForm',
          builder: (BuildContext context, GoRouterState state) {
            return const TreatmentFormPage();
          },
        ),
        GoRoute(
          path: 'connection',
          name: 'Connection',
          builder: (BuildContext context, GoRouterState state) {
            return ConnectionPage();
          },
        ),
        GoRoute(
          path: 'patients',
          name: 'Patients',
          builder: (BuildContext context, GoRouterState state) {
            return PatientPage();
          },
        ),
        GoRoute(
          path: 'user-general-info',
          name: 'UserGeneralInfo',
          builder: (BuildContext context, GoRouterState state) {
            return const UserGeneralInfoPage();
          },
          routes: [
            GoRoute(
              path: 'general-user-info',
              name: 'GeneralUserInfo',
              builder: (BuildContext context, GoRouterState state) {
                return const GeneralInfoPage();
              },
            ),
            GoRoute(
              path: 'user-address-info',
              name: 'UserAddressInfo',
              builder: (BuildContext context, GoRouterState state) {
                return const UserAddressInfoPage();
              },
            ),
          ],
        ),
        GoRoute(
          path: 'user-health-info-page',
          name: 'UserHealthInfoPage',
          builder: (BuildContext context, GoRouterState state) {
            return const UserHealthInfoPage();
          },
          routes: [
            GoRoute(
              path: 'general-health-info',
              name: 'GeneralHealthInfo',
              builder: (BuildContext context, GoRouterState state) {
                return const GeneralHealthInfoPage();
              },
            ),
            GoRoute(
              path: 'user-allergy-info-page',
              name: 'UserAllergyInfoPage',
              builder: (BuildContext context, GoRouterState state) {
                return const UserAllergyInfoPage();
              },
            ),
            GoRoute(
              path: 'user-chronical-disease-info-page',
              name: 'UserChronicalDiseaseInfoPage',
              builder: (BuildContext context, GoRouterState state) {
                return const UserChronicalDiseaseInfoPage();
              },
            ),
          ],
        ),
        GoRoute(
            path: 'faq-help',
            name: 'FaqHelp',
            builder: (BuildContext context, GoRouterState state) {
              return const FaqHelpPage();
            },
            routes: [
              GoRoute(
                path: 'faq-help-answer',
                name: 'FaqHelpAnswer',
                builder: (BuildContext context, GoRouterState state) {
                  return const FaqHelpItemPage();
                },
              )
            ]),
        // GoRoute(
        //   path: 'treatment-view',
        //   name: 'TreatmentView',
        //   builder: (BuildContext context, GoRouterState state) {
        //     Map<String, String> params = state.uri.queryParameters;
        //     bool readOnly = params['readOnly'] == 'true';

        //     return TreatmentViewPage(readOnly: readOnly);
        //   },
        // ),
      ],
    ),
    // GoRoute(
    //   path: '/medicine-stock-list',
    //   name: 'MedicineStockList',
    //   builder: (BuildContext context, GoRouterState state) {
    //     return MedicineStockListPage();
    //   },
    //   routes: [
    //     GoRoute(
    //       path: 'medicine-stock-form',
    //       name: 'MedicineStockForm',
    //       builder: (BuildContext context, GoRouterState state) {
    //         return const MedicineStockFormPage();
    //       },
    //     ),
    //     // Add more authenticated routes here.
    //   ],
    // ),
  ],
);
