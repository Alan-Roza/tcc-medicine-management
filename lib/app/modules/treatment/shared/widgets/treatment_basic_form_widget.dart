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
                prefixIcon: Icon(Icons.star_border_rounded),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
