import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:go_router/go_router.dart';
import 'package:tcc_medicine_management/app/modules/medicine/form/controllers/medicine_form_controller.dart';
import 'package:tcc_medicine_management/app/modules/medicine/shared/widgets/medicine_stock_basic_form_widget.dart';
import 'package:tcc_medicine_management/app/modules/medicine/shared/widgets/medicine_stock_optional_form_widget.dart';
import 'package:tcc_medicine_management/app/shared/widgets/padded_screen.dart';
import 'package:tcc_medicine_management/app/shared/widgets/step_progress_widget/controller/step_progress_controller.dart';
import 'package:tcc_medicine_management/app/shared/widgets/step_progress_widget/presentation/step_progress_widget.dart';

class MedicineStockFormPage extends StatefulWidget {
  const MedicineStockFormPage({super.key});

  @override
  MedicineStockFormPageState createState() => MedicineStockFormPageState();
}

class MedicineStockFormPageState extends State<MedicineStockFormPage> with SingleTickerProviderStateMixin {
  final MedicineFormController _formController = MedicineFormController();
  final StepProgressController stepProgressController = StepProgressController();
  final List<String> titles = ['Dados\nBásicos', 'Dados\nComplementares', 'Revisão'];
  final List<Widget> _formWidgets = [
    const MedicineStockBasicFormWidget(),
    const MedicineStockOptionalFormWidget(),
    const Text('Your third step content here'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Adicionar Medicamento'),
        backgroundColor: Colors.grey[200],
      ),
      body: Observer(builder: (_) {
        return Column(
          children: [
            Container(
              color: Colors.grey[200],
              child: StepProgressWidget(
                currentStep: stepProgressController.currentStep,
                titles: titles,
              ),
            ),
            Expanded(
              child: PaddedScreen(
                child: Column(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: _formWidgets[stepProgressController.currentStep],
                    ),
                    ElevatedButton(
                      onPressed: () {
                        stepProgressController.increaseCurrentStep();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        minimumSize: const Size(double.infinity, 40),
                        textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
                      ),
                      child: const Text('PRÓXIMO'),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    GestureDetector(
                      onTap: () {
                        stepProgressController.decreaseCurrentStep();
                      },
                      child: const Text(
                        'Voltar',
                        style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
                        // Change color to indicate it's clickable
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}
