import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:tcc_medicine_management/app/modules/treatment/form/controllers/treatment_form_controller.dart';
import 'package:tcc_medicine_management/app/shared/widgets/custom_text_field/custom_text_field_widget.dart';

class TreatmentMedicineFormWidget extends StatefulWidget {
  final bool readOnly;

  const TreatmentMedicineFormWidget({super.key, this.readOnly = false});

  @override
  TreatmentMedicineFormWidgetState createState() => TreatmentMedicineFormWidgetState();
}

class TreatmentMedicineFormWidgetState extends State<TreatmentMedicineFormWidget> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final TreatmentFormController formController = Provider.of<TreatmentFormController>(context);

    return Form(
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: formController.selectedMedicines
              .map((medicine) => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        medicine.name!.toUpperCase(),
                        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
                      ),
                      Observer(
                        builder: (_) => CustomTextFieldWidget(
                          textEditingController: formController.quantityController,
                          icon: Icons.medication_liquid_rounded,
                          label: 'Dosagem',
                          readOnly: widget.readOnly,
                          enabled: !widget.readOnly,
                        ),
                      ),
                      Observer(
                        builder: (_) => DropdownButtonFormField<int>(
                          value: formController.selectedFrequency,
                          onChanged: widget.readOnly
                              ? null
                              : (value) {
                                  if (value != null) {
                                    formController.frequencyController.text = value.toString();
                                    formController.selectedFrequency = value;
                                  }
                                },
                          items: List.generate(24, (index) {
                            final hour = index + 1;
                            return DropdownMenuItem<int>(
                              value: hour,
                              child:
                                  Text('A cada $hour ${hour > 1 ? 'horas' : 'hora'}'), // Pluraliza conforme necessário
                            );
                          }),
                          decoration: const InputDecoration(
                            labelText: 'Frequência',
                            border: UnderlineInputBorder(),
                            prefixIcon: Icon(Icons.timelapse_sharp),
                          ),
                        ),
                      ),
                      Observer(
                        builder: (_) => CustomTextFieldWidget(
                          textEditingController: formController.startDateDisplayController,
                          icon: Icons.access_time,
                          label: 'Início do Tratamento',
                          readOnly: widget.readOnly,
                          enabled: !widget.readOnly,
                          onTap: () {
                            showDatePicker(
                              context: context,
                              initialDate: formController.startDateController.text.isNotEmpty
                                  ? DateTime.parse(formController.startDateController.text)
                                  : DateTime.now(),
                              firstDate: DateTime(2000),
                              lastDate: DateTime(2100),
                            ).then((selectedDate) {
                              showTimePicker(
                                context: context,
                                initialTime: formController.startDateController.text.isNotEmpty
                                    ? TimeOfDay.fromDateTime(DateTime.parse(formController.startDateController.text))
                                    : TimeOfDay.now(),
                              ).then((selectedTime) {
                                if (selectedTime != null && selectedDate != null) {
                                  DateTime selectedDateTime = DateTime(
                                    selectedDate.year,
                                    selectedDate.month,
                                    selectedDate.day,
                                    selectedTime.hour,
                                    selectedTime.minute,
                                  );
                                  formController.convertStartDate(selectedDateTime.toString());
                                }
                                if (selectedTime == null && selectedDate != null) {
                                  formController.convertStartDate(selectedDate.toString());
                                }
                              });
                            });
                          },
                        ),
                      ),
                      Observer(
                        builder: (_) => CustomTextFieldWidget(
                          textEditingController: formController.endDateDisplayController,
                          icon: Icons.access_time,
                          label: 'Fim do Tratamento',
                          enabled: !formController.endlessTreatment && !widget.readOnly,
                          readOnly: widget.readOnly,
                          onTap: () {
                            showDatePicker(
                              context: context,
                              initialDate: formController.endDateController.text.isNotEmpty
                                  ? DateTime.parse(formController.endDateController.text)
                                  : DateTime.now(),
                              firstDate: DateTime(2000),
                              lastDate: DateTime(2100),
                            ).then((selectedDate) {
                              showTimePicker(
                                context: context,
                                initialTime: formController.endDateController.text.isNotEmpty
                                    ? TimeOfDay.fromDateTime(DateTime.parse(formController.endDateController.text))
                                    : TimeOfDay.now(),
                              ).then((selectedTime) {
                                if (selectedTime != null && selectedDate != null) {
                                  DateTime selectedDateTime = DateTime(
                                    selectedDate.year,
                                    selectedDate.month,
                                    selectedDate.day,
                                    selectedTime.hour,
                                    selectedTime.minute,
                                  );
                                  formController.convertEndDate(selectedDateTime.toString());
                                }
                                if (selectedTime == null && selectedDate != null) {
                                  formController.convertEndDate(selectedDate.toString());
                                }
                              });
                            });
                          },
                        ),
                      ),
                      Observer(
                        builder: (_) => CheckboxListTile(
                          title: const Text('Tratamento sem fim'),
                          value: formController.endlessTreatment,
                          enabled: !widget.readOnly,
                          onChanged: (value) {
                            formController.setEndlessTreatment();
                          },
                        ),
                      ),
                      const SizedBox(height: 16.0),
                    ],
                  ))
              .toList()),
    );
  }
}
