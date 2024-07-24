import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:tcc_medicine_management/app/modules/medicine/presentation/controllers/medicine_form_controller.dart';
import 'package:tcc_medicine_management/app/modules/medicine/presentation/widgets/medicine_stock_basic_form_widget.dart';
import 'package:tcc_medicine_management/app/modules/medicine/presentation/widgets/medicine_stock_optional_form_widget.dart';
import 'package:tcc_medicine_management/app/shared/widgets/padded_screen.dart';
import 'package:tcc_medicine_management/app/shared/widgets/step_progress_widget/controller/step_progress_controller.dart';
import 'package:tcc_medicine_management/app/shared/widgets/step_progress_widget/presentation/step_progress_widget.dart';

// class MedicineStockFormPage extends StatefulWidget {
//   const MedicineStockFormPage({super.key});

//   @override
//   MedicineStockFormPageState createState() => MedicineStockFormPageState();
// }

// class MedicineStockFormPageState extends State<MedicineStockFormPage>
//     with SingleTickerProviderStateMixin {
//   final MedicineFormController _formController = MedicineFormController();
//   TabController? _tabController;

//   @override
//   void initState() {
//     super.initState();
//     _tabController = TabController(length: 2, vsync: this);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('MedicineStockListPage'),
//         bottom: TabBar(
//           controller: _tabController,
//           tabs: const [
//             Tab(text: 'Basic data'),
//             Tab(text: 'Optional data'),
//           ],
//         ),
//       ),
//       body: PaddedScreen(
//         child: Column(
//           children: [
//             Expanded(
//               child: TabBarView(
//                 controller: _tabController,
//                 children: const [
//                   MedicineStockBasicFormWidget(),
//                   MedicineStockOptionalFormWidget(),
//                 ],
//               ),
//             ),
//             ElevatedButton(
//               onPressed: () async {
//                 if (await _formController.submitForm()) {
//                   // If the form is valid, display a Snackbar.
//                   ScaffoldMessenger.of(context).showSnackBar(
//                       const SnackBar(content: Text('Processing Data')));
//                 } else {
//                   // If the form is invalid, display a Snackbar.
//                   ScaffoldMessenger.of(context).showSnackBar(
//                       const SnackBar(content: Text('Invalid Data')));
//                 }
//               },
//               child: const Text('Submit'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

class MedicineStockFormPage extends StatefulWidget {
  const MedicineStockFormPage({super.key});

  @override
  MedicineStockFormPageState createState() => MedicineStockFormPageState();
}

class MedicineStockFormPageState extends State<MedicineStockFormPage> with SingleTickerProviderStateMixin {
  final MedicineFormController _formController = MedicineFormController();
  final StepProgressController stepProgressController = StepProgressController();
  final List<String> titles = ['Dados Básicos', 'Dados Complementares', 'Revisão'];
  final List<Widget> _formWidgets = [
    const MedicineStockBasicFormWidget(),
    const MedicineStockOptionalFormWidget(),
    const Text('Your third step content here'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Medicine Stock Form Page'),
      ),
      body: Observer(builder: (_) {
        return Column(
          children: [
            StepProgressWidget(
              currentStep: stepProgressController.currentStep,
              titles: titles,
            ),
            Text(stepProgressController.currentStep.toString()),
            Expanded(
              child: _formWidgets[stepProgressController.currentStep],
            ),
            ElevatedButton(
              onPressed: () {
                stepProgressController.setCurrentStep(stepProgressController.currentStep + 1);
                // stepProgressController.increaseCurrentStep();
                // if (await _formController.submitForm()) {
                //   // If the form is valid, display a Snackbar.
                //   ScaffoldMessenger.of(context).showSnackBar(
                //       const SnackBar(content: Text('Processing Data')));
                // } else {
                //   // If the form is invalid, display a Snackbar.
                //   ScaffoldMessenger.of(context).showSnackBar(
                //       const SnackBar(content: Text('Invalid Data')));
                // }
              },
              child: const Text('Submit'),
            ),
          ],
        );
      }),
    );
  }
}

// class MedicineStockFormPage extends StatefulWidget {
//   const MedicineStockFormPage({super.key});

//   @override
//   MedicineStockFormPageState createState() => MedicineStockFormPageState();
// }

// class MedicineStockFormPageState extends State<MedicineStockFormPage> {
//   final List<String> titles = ['CART', 'ADDRESS', 'PAYMENT'];
//   int _curStep = 1;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('MedicineStockListPage'),
//       ),
//       body: PaddedScreen(
//         child: StepProgressView(
//           width: MediaQuery.of(context).size.width,
//           curStep: _curStep,
//           color: const Color(0xff50AC02),
//           titles: titles,
//           key: const Key('abc'),
//         ),
//       ),
//     );
//   }
// }
