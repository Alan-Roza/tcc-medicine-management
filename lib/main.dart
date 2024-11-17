import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:tcc_medicine_management/app/core/infra/api_service.dart';
import 'package:tcc_medicine_management/app/core/infra/dio_factory.dart';
import 'package:tcc_medicine_management/app/core/infra/http_client.dart';
import 'package:tcc_medicine_management/app/core/infra/mqtt_client.dart';
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
import 'package:tcc_medicine_management/app/modules/main_home/main/controllers/main_home_controller.dart';
import 'package:tcc_medicine_management/app/modules/main_home/main/repository/resume_repository.dart';
import 'package:tcc_medicine_management/app/modules/main_home/profile/connection/form/controller/connect_controller.dart';
import 'package:tcc_medicine_management/app/modules/main_home/profile/connection/list/controllers/connection_controller.dart';
import 'package:tcc_medicine_management/app/modules/main_home/profile/connection/list/repository/connection_list_repository.dart';
import 'package:tcc_medicine_management/app/modules/main_home/profile/faq_help/controllers/faq_help_controller.dart';
import 'package:tcc_medicine_management/app/modules/main_home/profile/patient/controllers/patient_controller.dart';
import 'package:tcc_medicine_management/app/modules/main_home/profile/patient/repository/patient_repository.dart';
import 'package:tcc_medicine_management/app/modules/main_home/profile/shared/patient_card_widget/controllers/patient_card_controller.dart';
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
import 'package:tcc_medicine_management/app/modules/treatment/schedule/controllers/treatment_schedule_controller.dart';
import 'package:tcc_medicine_management/app/modules/treatment/schedule/repository/treatment_schedule_repository.dart';
import 'package:tcc_medicine_management/app/modules/treatment/view/controllers/treatment_view_controller.dart';
import 'package:tcc_medicine_management/app/modules/treatment/view/repository/treatment_view_repository.dart';
import 'package:tcc_medicine_management/app/modules/unauth/forgot_password/controller/forgot_password_controller.dart';
import 'package:tcc_medicine_management/app/modules/unauth/forgot_password/repository/forgot_password_repository.dart';
import 'package:tcc_medicine_management/app/modules/unauth/login/repository/auth_repository.dart';
import 'package:tcc_medicine_management/app/shared/controllers/user/user_controller.dart';
// import 'package:tcc_medicine_management/app/shared/style/app_theme.dart';
import 'package:tcc_medicine_management/app/shared/themes/theme.dart';
import 'package:tcc_medicine_management/app/shared/themes/util.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:tcc_medicine_management/app/shared/widgets/notification/controller/notification_controller.dart';
import 'package:tcc_medicine_management/app/shared/widgets/profile_picture_widget/controller/profile_picture_controller.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:permission_handler/permission_handler.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
final GlobalKey<_MyAppState> myAppKey = GlobalKey<_MyAppState>();
final GlobalKey<LoadingOverlayState> loadingOverlayKey = GlobalKey<LoadingOverlayState>();

Future<void> requestPermissions() async {
  // Request notification permission
  if (await Permission.notification.isDenied) {
    await Permission.notification.request();
  }

  if (await Permission.notification.isGranted) {
    print('notification permission granted');
  } else {
    print('notification permission denied');
  }

  // Request vibration permission
  // if (await Permission.vibration.isDenied) {
  //   await Permission.vibration.request();
  // }
}

class AppRouteObserver extends NavigatorObserver {
  String? currentRoute;

  @override
  void didPush(Route route, Route? previousRoute) {
    super.didPush(route, previousRoute);
    currentRoute = route.settings.name;
    print('Current Route: $currentRoute');
  }

  @override
  void didPop(Route route, Route? previousRoute) {
    super.didPop(route, previousRoute);
    currentRoute = previousRoute?.settings.name;
    print('Current Route: $currentRoute');
  }
}

final AppRouteObserver appRouteObserver = AppRouteObserver();

class LoadingOverlay extends StatefulWidget {
  const LoadingOverlay({super.key});

  @override
  LoadingOverlayState createState() => LoadingOverlayState();
}

class LoadingOverlayState extends State<LoadingOverlay> {
  bool _isLoading = false;

  void show() {
    setState(() {
      _isLoading = true;
    });
  }

  void hide() {
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (!_isLoading) {
      return const SizedBox.shrink();
    }
    return Container(
      color: Colors.white.withOpacity(0.2),
      child: const Center(
        child: CircularProgressIndicator(
          color: Color(0xFF00A8FF),
        ),
      ),
    );
  }
}

// void restartApp(BuildContext context) {
//   main();
//   GetIt.instance.reset();
//   setupDependencies(); // Registra as dependências novamente
//   context.findAncestorStateOfType<_MyAppState>()?.restartApp();
// }

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await NotificationService.initializeNotifications();
  tz.initializeTimeZones();

  setupDependencies();

  await requestPermissions();

  enableBackgroundExecution();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(MyApp(key: myAppKey));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  Key key = UniqueKey();

  void restartApp() {
    setState(() {
      key = UniqueKey();
    });
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.detached) {
      main();
    }
  }

  @override
  Widget build(BuildContext context) {
    Intl.defaultLocale = 'pt_BR';
    // final brightness = View.of(context).platformDispatcher.platformBrightness; // TODO - Will be used at the future

    TextTheme textTheme = createTextTheme(context, "Roboto", "Roboto");

    MaterialTheme theme = MaterialTheme(textTheme);

    return MaterialApp(
      key: key,
      // navigatorObservers: [appRouteObserver],
      navigatorKey: navigatorKey,
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
      home: Stack(
        children: [
          MultiProvider(
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
              Provider<MainHomeController>(create: (_) => MainHomeController()),
              Provider<PatientController>(create: (_) => PatientController()),
              Provider<PatientCardController>(create: (_) => PatientCardController()),
              Provider<ForgotPasswordController>(create: (_) => ForgotPasswordController()),
              Provider<TreatmentScheduleController>(create: (_) => TreatmentScheduleController()),
            ],
            child: MaterialApp.router(
              key: key, 
              debugShowCheckedModeBanner: false,
              routerConfig: appRouter,
              // theme: AppTheme.lightTheme
              // theme: brightness == Brightness.light ? theme.light() : theme.dark() // TODO - Will be used at the future
              theme: theme.light(),
            ),
          ),
          LoadingOverlay(key: loadingOverlayKey),
        ],
      ),
    );
  }
}

final GetIt getIt = GetIt.instance;
MqttService mqttService = MqttService();

void setupDependencies() {
  // Register Dio instance
  getIt.registerLazySingleton<DioConfig>(() => DioConfig());

  getIt.registerSingleton<MqttService>(mqttService);

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

  getIt.registerLazySingleton<ResumeRepository>(
      () => ResumeRepository(NetworkInfoImpl(InternetConnectionChecker()), ApiService(DioFactory().getDio())));

  getIt.registerLazySingleton<PatientRepository>(
      () => PatientRepository(NetworkInfoImpl(InternetConnectionChecker()), ApiService(DioFactory().getDio())));

  getIt.registerLazySingleton<ForgotPasswordRepository>(
      () => ForgotPasswordRepository(NetworkInfoImpl(InternetConnectionChecker()), ApiService(DioFactory().getDio())));

  getIt.registerLazySingleton<TreatmentScheduleRepository>(
      () => TreatmentScheduleRepository(NetworkInfoImpl(InternetConnectionChecker()), ApiService(DioFactory().getDio())));
}
