import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:tcc_medicine_management/app/modules/medicine/form/controllers/medicine_form_controller.dart';
import 'package:tcc_medicine_management/app/modules/medicine/list/controllers/medicine_stock_list_controller.dart';
import 'package:tcc_medicine_management/app/modules/medicine/list/model/dto/medicine_list_request.dart';
import 'package:tcc_medicine_management/app/modules/medicine/shared/widgets/medicine_stock_basic_form_widget.dart';
import 'package:tcc_medicine_management/app/modules/medicine/shared/widgets/medicine_stock_optional_form_widget.dart';
import 'package:tcc_medicine_management/app/modules/medicine/shared/widgets/medicine_stock_review_form_widget.dart';
import 'package:tcc_medicine_management/app/shared/widgets/padded_screen_without_bottom.dart';
import 'package:tcc_medicine_management/app/shared/widgets/step_progress_widget/controller/step_progress_controller.dart';
import 'package:tcc_medicine_management/app/shared/widgets/step_progress_widget/presentation/step_progress_widget.dart';

class MedicineStockFormPage extends StatefulWidget {
  final bool? readOnly;

  const MedicineStockFormPage({super.key, this.readOnly});

  @override
  MedicineStockFormPageState createState() => MedicineStockFormPageState();
}

class MedicineStockFormPageState extends State<MedicineStockFormPage> with SingleTickerProviderStateMixin {
  final StepProgressController stepProgressController = StepProgressController();

  final List<String> titles = ['Dados\nBásicos', 'Dados\nComplementares', 'Revisão'];
  List<Widget> _formWidgets = [];

  @override
  void initState() {
    super.initState();

    MedicineFormController formController = Provider.of<MedicineFormController>(context, listen: false);
    formController.resetForm();
  }

  @override
  Widget build(BuildContext context) {
    MedicineFormController formController = Provider.of<MedicineFormController>(context);
    MedicineStockListController medicineListController = Provider.of<MedicineStockListController>(context);

    _formWidgets = [
      Expanded(child: MedicineStockBasicFormWidget(readOnly: widget.readOnly ?? false)),
      MedicineStockOptionalFormWidget(readOnly: widget.readOnly ?? false),
      const MedicineStockReviewFormWidget(),
    ];

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.grey[200],
        surfaceTintColor: Colors.grey[200],
        title: const Text('Adicionar Medicamento'),
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
              child: PaddedScreenWithoutBottom(
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
                                  onPressed: () async {
                                    if (stepProgressController.currentStep == _formWidgets.length - 1) {
                                      try {
                                        await formController.saveMedicine(null);
                                        medicineListController
                                          .getListMedicines(MedicineListRequestDto(size: 100, search: medicineListController.search));

                                        context.pop();
                                        ScaffoldMessenger.of(context).showSnackBar(
                                          const SnackBar(
                                            backgroundColor: Colors.green,
                                            content: Text("Salvo com Sucesso!"), // Customize with your success message
                                          ),
                                        );
                                        return;
                                      } catch (error) {
                                        ScaffoldMessenger.of(context).showSnackBar(
                                          SnackBar(
                                            backgroundColor: Colors.red,
                                            content: Text(error.toString()),
                                          ),
                                        );
                                      }
                                    }

                                    stepProgressController.increaseCurrentStep();
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.blue,
                                    minimumSize: const Size(double.infinity, 40),
                                    textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
                                  ),
                                  child: stepProgressController.currentStep < _formWidgets.length - 2
                                      ? const Text('PRÓXIMO')
                                      : stepProgressController.currentStep == _formWidgets.length - 2
                                          ? const Text('PRÓXIMO E REVISAR')
                                          : const Text('SALVAR'),
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
                              ],
                            ),
                            const SizedBox(
                              height: 16.0,
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
