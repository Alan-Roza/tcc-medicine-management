import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:tcc_medicine_management/app/modules/treatment/form/controllers/treatment_form_controller.dart';
import 'package:tcc_medicine_management/app/shared/widgets/custom_text_field/custom_text_field_widget.dart';

class TreatmentBasicFormWidget extends StatefulWidget {
  final bool readOnly;

  const TreatmentBasicFormWidget({super.key, this.readOnly = false});

  @override
  TreatmentBasicFormWidgetState createState() => TreatmentBasicFormWidgetState();
}

class TreatmentBasicFormWidgetState extends State<TreatmentBasicFormWidget> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final TreatmentFormController formController = Provider.of<TreatmentFormController>(context);

    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'DADOS BÁSICOS',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Container(
                width: 40,
                height: 6,
                decoration: BoxDecoration(
                  color: const Color(0xFF00A8FF),
                  border: Border.all(
                    color: const Color(0xFF00A8FF), // Set border color
                    width: 2, // Set border width
                  ),
                  borderRadius: BorderRadius.circular(10), // Add a border radius
                ),
              )
            ],
          ),
          Observer(
            builder: (_) => CustomTextFieldWidget(
              textEditingController: formController.nameController,
              icon: Icons.health_and_safety_outlined,
              label: 'Nome do Tratamento',
              readOnly: widget.readOnly,
            ),
          ),
          const SizedBox(height: 16),
          Observer(
            builder: (_) => DropdownButtonFormField<String>(
              value: formController.importanceLevel,
              onChanged: (value) {
                if (value != null) formController.importanceLevel = value;
              },
              items: const [
                DropdownMenuItem(
                  value: 'high',
                  child: Text('Importante'),
                ),
                DropdownMenuItem(
                  value: 'medium',
                  child: Text('Normal'),
                ),
                DropdownMenuItem(
                  value: 'low',
                  child: Text('Baixo'),
                ),
              ],
              decoration: const InputDecoration(
                labelText: 'Nível de Importância',
                border: UnderlineInputBorder(),
                prefixIcon: Icon(Icons.star_purple500_sharp),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Observer(
            builder: (_) => DropdownButtonFormField<String>(
              value: formController.selectedMedicine,
              onChanged: (value) {
                if (value != null &&
                    value.isNotEmpty &&
                    !formController.selectedMedicines.any((medicine) => medicine.name == value)) {
                  formController.addTreatmentMedicine(value);
                  print(formController.selectedMedicines[0].name);
                }
              },
              items: [
                const DropdownMenuItem(
                  value: '',
                  child: Text('Selecione um medicamento'),
                ),
                ...formController.medicines.map((medicine) {
                  return DropdownMenuItem(
                    value: medicine.name,
                    child: Text(medicine.name),
                  );
                }),
              ],
              decoration: const InputDecoration(
                labelText: 'Medicamentos',
                border: UnderlineInputBorder(),
                prefixIcon: Icon(Icons.medical_services),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Observer(builder: (_) {
            return formController.selectedMedicines.isNotEmpty
                ? Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    elevation: 0,
                    color: Colors.white,
                    child: SizedBox(
                      height: formController.selectedMedicines.length * 55.0,
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: formController.selectedMedicines.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            contentPadding: const EdgeInsets.symmetric(horizontal: 0),
                            title: Padding(
                              padding: const EdgeInsets.only(left: 16.0),
                              child: Text(formController.selectedMedicines[index].name),
                            ),
                            trailing: IconButton(
                              icon: const Icon(Icons.close),
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: const Text('Remover Medicamento',
                                          style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500)),
                                      content: const Text('Vocẽ tem certeza que deseja remover este item?'),
                                      actionsPadding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                                      buttonPadding: const EdgeInsets.symmetric(horizontal: 0),
                                      actions: [
                                        TextButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: const Text('Cancelar', style: TextStyle(color: Colors.black38)),
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            formController.removeTreatmentMedicine(index);
                                            Navigator.of(context).pop();
                                          },
                                          child: const Text('Remover'),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                            ),
                          );
                        },
                      ),
                    ),
                  )
                : const SizedBox();
          }),
        ],
      ),
    );
  }
}
