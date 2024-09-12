import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:tcc_medicine_management/app/modules/first_access/health_info/controller/health_info_controller.dart';
import 'package:tcc_medicine_management/app/shared/widgets/custom_text_field/custom_text_field_widget.dart';

class HealthInfoFormWidget extends StatefulWidget {
  final bool readOnly;

  const HealthInfoFormWidget({super.key, this.readOnly = false});

  @override
  HealthInfoFormWidgetState createState() => HealthInfoFormWidgetState();
}

class HealthInfoFormWidgetState extends State<HealthInfoFormWidget> with SingleTickerProviderStateMixin {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final HealthInfoController healthInfoController = Provider.of<HealthInfoController>(context);

    return Form(
      key: _formKey,
      child: Column(
        children: [
          Observer(
            builder: (_) => CustomTextFieldWidget(
              textEditingController: healthInfoController.height,
              icon: Icons.local_post_office_rounded,
              label: 'Altura (metros)',
              onChanged: (value) {
                // Add your logic here
              },
            ),
          ),

          Observer(
            builder: (_) => CustomTextFieldWidget(
              textEditingController: healthInfoController.weight,
              icon: Icons.streetview_outlined,
              label: 'Peso (kg)',
              onChanged: (value) {
                // Add your logic here
              },
            ),
          ),
          Observer(
            builder: (_) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: DropdownButtonFormField<bool>(
                value: healthInfoController.isPregnant,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.people_outline),
                  labelText: 'É Gestante?',
                ),
                items: const [
                  DropdownMenuItem<bool>(
                    value: true,
                    child: Text('SIM'),
                  ),
                  DropdownMenuItem<bool>(
                    value: false,
                    child: Text('NÃO'),
                  ),
                ],
                onChanged: (bool? value) {
                  if (value != null) {
                    healthInfoController.setPregnant(value);
                  }
                },
              ),
            ),
          ),
          Observer(
            builder: (_) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: DropdownButtonFormField<bool>(
                value: healthInfoController.isSmoker,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.people_outline),
                  labelText: 'É Fumante?',
                ),
                items: const [
                  DropdownMenuItem<bool>(
                    value: true,
                    child: Text('SIM'),
                  ),
                  DropdownMenuItem<bool>(
                    value: false,
                    child: Text('NÃO'),
                  ),
                ],
                onChanged: (bool? value) {
                  if (value != null) {
                    healthInfoController.setSmoker(value);
                  }
                },
              ),
            ),
          ),
          Observer(
            builder: (_) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: DropdownButtonFormField<bool>(
                value: healthInfoController.isAlcohol,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.people_outline),
                  labelText: 'Faz Consumo de Álcool?',
                ),
                items: const [
                  DropdownMenuItem<bool>(
                    value: true,
                    child: Text('SIM'),
                  ),
                  DropdownMenuItem<bool>(
                    value: false,
                    child: Text('NÃO'),
                  ),
                ],
                onChanged: (bool? value) {
                  if (value != null) {
                    healthInfoController.setAlcohol(value);
                  }
                },
              ),
            ),
          ),
          
          Observer(
            builder: (_) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: DropdownButtonFormField<bool>(
                value: healthInfoController.hasAllergy,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.people_outline),
                  labelText: 'Possui Alergia a Medicamentos?',
                ),
                items: const [
                  DropdownMenuItem<bool>(
                    value: true,
                    child: Text('SIM'),
                  ),
                  DropdownMenuItem<bool>(
                    value: false,
                    child: Text('NÃO'),
                  ),
                ],
                onChanged: (bool? value) {
                  if (value != null) {
                    healthInfoController.setAllergy(value);
                  }
                },
              ),
            ),
          ),
          Observer(
            builder: (_) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: DropdownButtonFormField<bool>(
                value: healthInfoController.hasChronicDisease,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.people_outline),
                  labelText: 'Possui Doenças Crônicas? (diabetes, asma, etc...)',
                ),
                items: const [
                  DropdownMenuItem<bool>(
                    value: true,
                    child: Text('SIM'),
                  ),
                  DropdownMenuItem<bool>(
                    value: false,
                    child: Text('NÃO'),
                  ),
                ],
                onChanged: (bool? value) {
                  if (value != null) {
                    healthInfoController.setChronicDisease(value);
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}