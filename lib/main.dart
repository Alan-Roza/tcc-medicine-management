import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tcc_medicine_management/app/core/routes/app_routes.dart';
import 'package:tcc_medicine_management/app/modules/medicine/form/controllers/medicine_form_controller.dart';
import 'package:tcc_medicine_management/app/modules/medicine/list/controllers/medicine_stock_list_controller.dart';
import 'package:tcc_medicine_management/app/modules/medicine/view/controllers/medicine_view_controller.dart';
import 'package:tcc_medicine_management/app/modules/treatment/list/controllers/treatment_list_controller.dart';
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
// final brightness = View.of(context).platformDispatcher.platformBrightness; // TODO - Will be used at the future

    TextTheme textTheme = createTextTheme(context, "Roboto", "Roboto");

    MaterialTheme theme = MaterialTheme(textTheme);

    return MultiProvider(
      providers: [
        Provider<MedicineViewController>(create: (_) => MedicineViewController()),
        Provider<MedicineStockListController>(create: (_) => MedicineStockListController()),
        Provider<MedicineFormController>(
          create: (_) => MedicineFormController(),
          dispose: (_, MedicineFormController controller) => controller.dispose(),
        ),
        Provider<TreatmentListController>(create: (_) => TreatmentListController()),
        // Provider<TreatmentFormController>(
        //   create: (_) => TreatmentFormController(),
        //   dispose: (_, TreatmentFormController controller) => controller.dispose(),
        // ),
      ],
      child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          routerConfig: appRouter,
          // theme: AppTheme.lightTheme
          // theme: brightness == Brightness.light ? theme.light() : theme.dark() // TODO - Will be used at the future
          theme: theme.light()),
    );
  }
}
