import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:tcc_medicine_management/app/core/infra/api_service.dart';
import 'package:tcc_medicine_management/app/core/infra/dio_factory.dart';
import 'package:tcc_medicine_management/app/core/infra/http_client.dart';
import 'package:tcc_medicine_management/app/core/infra/network_info.dart';
import 'package:tcc_medicine_management/app/core/routes/app_routes.dart';
import 'package:tcc_medicine_management/app/core/services/background_service.dart';
import 'package:tcc_medicine_management/app/core/services/notification_service.dart';
import 'package:tcc_medicine_management/app/modules/first_access/address_info/controller/address_info_controller.dart';
import 'package:tcc_medicine_management/app/modules/first_access/administrator_info/controller/administrator_info_controller.dart';
import 'package:tcc_medicine_management/app/modules/first_access/administrator_info/repository/administrator_info_repository.dart';
import 'package:tcc_medicine_management/app/modules/first_access/allergy_info/controller/allergy_info_controller.dart';
import 'package:tcc_medicine_management/app/modules/first_access/allergy_info/repository/allergy_info_repository.dart';
import 'package:tcc_medicine_management/app/modules/first_access/chronical_disease_info/controller/chronical_disease_info_controller.dart';
import 'package:tcc_medicine_management/app/modules/first_access/chronical_disease_info/repository/chronical_disease_info_repository.dart';
import 'package:tcc_medicine_management/app/modules/first_access/configurations/controller/configurations_controller.dart';
import 'package:tcc_medicine_management/app/modules/first_access/configurations/repository/configurations_info_repository.dart';
import 'package:tcc_medicine_management/app/modules/first_access/health_info/controller/health_info_controller.dart';
import 'package:tcc_medicine_management/app/modules/first_access/health_info/repository/health_info_repository.dart';
import 'package:tcc_medicine_management/app/modules/first_access/user_info/controller/user_info_controller.dart';
import 'package:tcc_medicine_management/app/modules/first_access/address_info/repository/address_info_repository.dart';
import 'package:tcc_medicine_management/app/modules/first_access/user_info/repository/user_info_repository.dart';
import 'package:tcc_medicine_management/app/modules/main_home/profile/connection/form/controller/connect_controller.dart';
import 'package:tcc_medicine_management/app/modules/main_home/profile/connection/list/controllers/connection_controller.dart';
import 'package:tcc_medicine_management/app/modules/main_home/profile/connection/list/repository/connection_list_repository.dart';
import 'package:tcc_medicine_management/app/modules/main_home/profile/faq_help/controllers/faq_help_controller.dart';
import 'package:tcc_medicine_management/app/modules/medicine/form/controllers/medicine_form_controller.dart';
import 'package:tcc_medicine_management/app/modules/medicine/form/repository/medicine_repository.dart';
import 'package:tcc_medicine_management/app/modules/medicine/list/controllers/medicine_stock_list_controller.dart';
import 'package:tcc_medicine_management/app/modules/medicine/list/repository/medicine_list_repository.dart';
import 'package:tcc_medicine_management/app/modules/medicine/view/controllers/medicine_view_controller.dart';
import 'package:tcc_medicine_management/app/modules/medicine/view/repository/medicine_view_repository.dart';
import 'package:tcc_medicine_management/app/modules/treatment/form/controllers/treatment_form_controller.dart';
import 'package:tcc_medicine_management/app/modules/treatment/form/repository/treatment_medicine_repository.dart';
import 'package:tcc_medicine_management/app/modules/treatment/list/controllers/treatment_list_controller.dart';
import 'package:tcc_medicine_management/app/modules/treatment/list/repository/treatment_list_repository.dart';
import 'package:tcc_medicine_management/app/modules/treatment/view/controllers/treatment_view_controller.dart';
import 'package:tcc_medicine_management/app/modules/treatment/view/repository/treatment_view_repository.dart';
import 'package:tcc_medicine_management/app/modules/unauth/login/repository/auth_repository.dart';
import 'package:tcc_medicine_management/app/shared/controllers/user/user_controller.dart';
// import 'package:tcc_medicine_management/app/shared/style/app_theme.dart';
import 'package:tcc_medicine_management/app/shared/themes/theme.dart';
import 'package:tcc_medicine_management/app/shared/themes/util.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:tcc_medicine_management/app/shared/widgets/notification/controller/notification_controller.dart';
import 'package:tcc_medicine_management/app/shared/widgets/profile_picture_widget/controller/profile_picture_controller.dart';
import 'package:timezone/data/latest.dart' as tz;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await NotificationService.initialize();
  tz.initializeTimeZones();

  setupDependencies();
  enableBackgroundExecution();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Intl.defaultLocale = 'pt_BR';
    // final brightness = View.of(context).platformDispatcher.platformBrightness; // TODO - Will be used at the future

    TextTheme textTheme = createTextTheme(context, "Roboto", "Roboto");

    MaterialTheme theme = MaterialTheme(textTheme);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('pt', 'BR'), // Portuguese Brazil
        // Add other supported locales
      ],
      home: MultiProvider(
        providers: [
          Provider<UserController>(create: (_) => UserController()),
          Provider<MedicineViewController>(create: (_) => MedicineViewController()),
          Provider<MedicineStockListController>(create: (_) => MedicineStockListController()),
          Provider<MedicineFormController>(
            create: (_) => MedicineFormController(),
            dispose: (_, MedicineFormController controller) => controller.dispose(),
          ),
          Provider<TreatmentListController>(create: (_) => TreatmentListController()),
          Provider<TreatmentFormController>(
            create: (_) => TreatmentFormController(),
            dispose: (_, TreatmentFormController controller) => controller.dispose(),
          ),
          Provider<AddressInfoController>(create: (_) => AddressInfoController()),
          Provider<AdministratorInfoController>(create: (_) => AdministratorInfoController()),
          Provider<AllergyInfoController>(create: (_) => AllergyInfoController()),
          Provider<ChronicalDiseaseInfoController>(create: (_) => ChronicalDiseaseInfoController()),
          Provider<ConfigurationsController>(create: (_) => ConfigurationsController()),
          Provider<HealthInfoController>(create: (_) => HealthInfoController()),
          Provider<UserInfoController>(create: (_) => UserInfoController()),
          Provider<AllergyInfoController>(create: (_) => AllergyInfoController()),
          Provider<FaqHelpController>(create: (_) => FaqHelpController()),
          Provider<NotificationController>(create: (_) => NotificationController()),
          Provider<ConnectController>(create: (_) => ConnectController()),
          Provider<TreatmentViewController>(create: (_) => TreatmentViewController()),
          Provider<ConnectionController>(create: (_) => ConnectionController()),
          Provider<ProfilePictureController>(create: (_) => ProfilePictureController()),
        ],
        child: MaterialApp.router(
          routerConfig: appRouter,
          // theme: AppTheme.lightTheme
          // theme: brightness == Brightness.light ? theme.light() : theme.dark() // TODO - Will be used at the future
          theme: theme.light(),
        ),
      ),
    );
  }
}

final GetIt getIt = GetIt.instance;

void setupDependencies() {
  // Register Dio instance
  getIt.registerLazySingleton<DioConfig>(() => DioConfig());

  // Register AuthRepository with a Dio instance from DioFactory
  getIt.registerLazySingleton<AuthRepository>(
      () => AuthRepository(NetworkInfoImpl(InternetConnectionChecker()), ApiService(DioFactory().getDio())));

  // Register UserInfoRepository with a new Dio instance
  getIt.registerLazySingleton<UserInfoRepository>(
      () => UserInfoRepository(NetworkInfoImpl(InternetConnectionChecker()), ApiService(DioFactory().getDio())));

  getIt.registerLazySingleton<MedicineListRepository>(
      () => MedicineListRepository(NetworkInfoImpl(InternetConnectionChecker()), ApiService(DioFactory().getDio())));

  getIt.registerLazySingleton<MedicineViewRepository>(
      () => MedicineViewRepository(NetworkInfoImpl(InternetConnectionChecker()), ApiService(DioFactory().getDio())));

  getIt.registerLazySingleton<AddressInfoRepository>(
      () => AddressInfoRepository(NetworkInfoImpl(InternetConnectionChecker()), ApiService(DioFactory().getDio())));

  getIt.registerLazySingleton<HealthInfoRepository>(
      () => HealthInfoRepository(NetworkInfoImpl(InternetConnectionChecker()), ApiService(DioFactory().getDio())));

  getIt.registerLazySingleton<AllergyInfoRepository>(
      () => AllergyInfoRepository(NetworkInfoImpl(InternetConnectionChecker()), ApiService(DioFactory().getDio())));

  getIt.registerLazySingleton<ChronicalDiseaseInfoRepository>(() =>
      ChronicalDiseaseInfoRepository(NetworkInfoImpl(InternetConnectionChecker()), ApiService(DioFactory().getDio())));

  getIt.registerLazySingleton<ConfigurationsInfoRepository>(() =>
      ConfigurationsInfoRepository(NetworkInfoImpl(InternetConnectionChecker()), ApiService(DioFactory().getDio())));

  getIt.registerLazySingleton<MedicineRepository>(
      () => MedicineRepository(NetworkInfoImpl(InternetConnectionChecker()), ApiService(DioFactory().getDio())));

  getIt.registerLazySingleton<TreatmentMedicineRepository>(() =>
      TreatmentMedicineRepository(NetworkInfoImpl(InternetConnectionChecker()), ApiService(DioFactory().getDio())));

  getIt.registerLazySingleton<TreatmentListRepository>(
      () => TreatmentListRepository(NetworkInfoImpl(InternetConnectionChecker()), ApiService(DioFactory().getDio())));

  getIt.registerLazySingleton<TreatmentViewRepository>(
      () => TreatmentViewRepository(NetworkInfoImpl(InternetConnectionChecker()), ApiService(DioFactory().getDio())));

  getIt.registerLazySingleton<ConnectionListRepository>(
      () => ConnectionListRepository(NetworkInfoImpl(InternetConnectionChecker()), ApiService(DioFactory().getDio())));

  getIt.registerLazySingleton<AdministratorInfoRepository>(() =>
      AdministratorInfoRepository(NetworkInfoImpl(InternetConnectionChecker()), ApiService(DioFactory().getDio())));
}
