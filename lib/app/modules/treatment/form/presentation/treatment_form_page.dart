import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:tcc_medicine_management/app/modules/treatment/form/controllers/treatment_form_controller.dart';
import 'package:tcc_medicine_management/app/modules/treatment/list/controllers/treatment_list_controller.dart';
import 'package:tcc_medicine_management/app/modules/treatment/list/model/dto/treatment_list_request.dart';
import 'package:tcc_medicine_management/app/modules/treatment/shared/widgets/treatment_basic_form_widget.dart';
import 'package:tcc_medicine_management/app/modules/treatment/shared/widgets/treatment_medicine_form_widget.dart';
import 'package:tcc_medicine_management/app/modules/treatment/shared/widgets/treatment_review_form_widget.dart';
import 'package:tcc_medicine_management/app/shared/widgets/padded_screen.dart';
import 'package:tcc_medicine_management/app/shared/widgets/step_progress_widget/controller/step_progress_controller.dart';
import 'package:tcc_medicine_management/app/shared/widgets/step_progress_widget/presentation/step_progress_widget.dart';

class TreatmentFormPage extends StatefulWidget {
  final bool? readOnly;

  const TreatmentFormPage({super.key, this.readOnly});

  @override
  TreatmentFormPageState createState() => TreatmentFormPageState();
}

class TreatmentFormPageState extends State<TreatmentFormPage> with SingleTickerProviderStateMixin {
  final StepProgressController stepProgressController = StepProgressController();

  final List<String> titles = ['Dados\nBásicos', 'Medicamentos', 'Revisão'];
  List<Widget> _formWidgets = [];

  @override
  void initState() {
    super.initState();

    TreatmentFormController formController = Provider.of<TreatmentFormController>(context, listen: false);
    formController.resetForm();

    // formController.startDateDisplayController.text = DateFormat('dd-MM-yyyy HH:mm').format(DateTime.now());
  }

  @override
  Widget build(BuildContext context) {
    TreatmentFormController formController = Provider.of<TreatmentFormController>(context);
    TreatmentListController treatmentListController = Provider.of<TreatmentListController>(context);

    _formWidgets = [
      Expanded(child: TreatmentBasicFormWidget(readOnly: widget.readOnly ?? false)),
      TreatmentMedicineFormWidget(readOnly: widget.readOnly ?? false),
      const TreatmentReviewFormWidget(),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Adicionar Tratamento'),
        centerTitle: true,
        backgroundColor: Colors.grey[200],
        surfaceTintColor: Colors.grey[200],
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
                            _formWidgets[stepProgressController.currentStep.clamp(0, _formWidgets.length - 1)],
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
                                        await formController.saveTreatment(null);
                                        await treatmentListController.getListTreatments(
                                            TreatmentListRequestDto(size: 100, search: treatmentListController.search));

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
                                    } else if (stepProgressController.currentStep == 0) {
                                      if (formController.selectedMedicines.isEmpty) {
                                        ScaffoldMessenger.of(context).showSnackBar(
                                          const SnackBar(
                                            backgroundColor: Colors.red,
                                            content: Text(
                                              'É necessário ter pelo menos um medicamento.',
                                            ),
                                          ),
                                        );
                                        return;
                                      }
                                      if (formController.nameController.text.isEmpty) {
                                        ScaffoldMessenger.of(context).showSnackBar(
                                          const SnackBar(
                                            backgroundColor: Colors.red,
                                            content: Text(
                                              'O nome do tratamento é obrigatório.',
                                            ),
                                          ),
                                        );
                                        return;
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
