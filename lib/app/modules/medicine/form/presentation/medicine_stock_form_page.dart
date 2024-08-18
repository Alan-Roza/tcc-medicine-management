import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:tcc_medicine_management/app/modules/medicine/form/controllers/medicine_form_controller.dart';
import 'package:tcc_medicine_management/app/modules/medicine/shared/widgets/medicine_stock_basic_form_widget.dart';
import 'package:tcc_medicine_management/app/modules/medicine/shared/widgets/medicine_stock_optional_form_widget.dart';
import 'package:tcc_medicine_management/app/modules/medicine/shared/widgets/medicine_stock_review_form_widget.dart';
import 'package:tcc_medicine_management/app/shared/widgets/padded_screen.dart';
import 'package:tcc_medicine_management/app/shared/widgets/step_progress_widget/controller/step_progress_controller.dart';
import 'package:tcc_medicine_management/app/shared/widgets/step_progress_widget/presentation/step_progress_widget.dart';

class MedicineStockFormPage extends StatefulWidget {
  const MedicineStockFormPage({super.key});

  @override
  MedicineStockFormPageState createState() => MedicineStockFormPageState();
}

class MedicineStockFormPageState extends State<MedicineStockFormPage> with SingleTickerProviderStateMixin {
  final StepProgressController stepProgressController = StepProgressController();

  final List<String> titles = ['Dados\nBásicos', 'Dados\nComplementares', 'Revisão'];
  final List<Widget> _formWidgets = [
    const MedicineStockBasicFormWidget(),
    const MedicineStockOptionalFormWidget(),
    const MedicineStockReviewFormWidget(),
  ];

  @override
  void initState() {
    super.initState();

    MedicineFormController formController = Provider.of<MedicineFormController>(context, listen: false);
    formController.resetForm();
  }

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
                child: LayoutBuilder(builder: (context, constraint) {
                  return SingleChildScrollView(
                    child: ConstrainedBox(
                      constraints: BoxConstraints(minHeight: constraint.maxHeight),
                      child: IntrinsicHeight(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          // crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _formWidgets[stepProgressController.currentStep],
                            const SizedBox(
                              height: 24.0,
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
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
                                stepProgressController.currentStep > 0
                                    ? GestureDetector(
                                        onTap: () {
                                          stepProgressController.decreaseCurrentStep();
                                        },
                                        child: const Text(
                                          'Voltar',
                                          style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
                                          // Change color to indicate it's clickable
                                        ),
                                      )
                                    : Container(),
                                const SizedBox(
                                  height: 16.0,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),
          ],
        );
      }),
    );
  }
}
