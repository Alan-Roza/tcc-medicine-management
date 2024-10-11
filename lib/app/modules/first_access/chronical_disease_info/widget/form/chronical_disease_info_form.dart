import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:tcc_medicine_management/app/modules/first_access/chronical_disease_info/controller/chronical_disease_info_controller.dart';

class ChronicalDiseaseInfoFormWidget extends StatefulWidget {
  final bool readOnly;
  final GlobalKey<FormState> formKey;

  const ChronicalDiseaseInfoFormWidget({super.key, required this.formKey, this.readOnly = false});

  @override
  ChronicalDiseaseInfoFormWidgetState createState() => ChronicalDiseaseInfoFormWidgetState();
}

class ChronicalDiseaseInfoFormWidgetState extends State<ChronicalDiseaseInfoFormWidget>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final ChronicalDiseaseInfoController chronicalDiseaseInfoController =
        Provider.of<ChronicalDiseaseInfoController>(context);

    return Form(
      key: widget.formKey,
      child: Column(
        children: [
          Observer(
            builder: (_) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: DropdownButtonFormField<bool>(
                value: chronicalDiseaseInfoController.hasHypertension,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.people_outline),
                  labelText: 'Possui Hipertensão? (pressão alta)',
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
                    chronicalDiseaseInfoController.setHypertension(value);
                  }
                },
              ),
            ),
          ),
          Observer(
            builder: (_) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: DropdownButtonFormField<bool>(
                value: chronicalDiseaseInfoController.hasDiabetes,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.people_outline),
                  labelText: 'Possui Diabetes?',
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
                    chronicalDiseaseInfoController.setDiabetes(value);
                  }
                },
              ),
            ),
          ),
          Observer(
            builder: (_) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: DropdownButtonFormField<bool>(
                value: chronicalDiseaseInfoController.hasAlzheimer,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.people_outline),
                  labelText: 'Possui Alzheimer?',
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
                    chronicalDiseaseInfoController.setAlzheimer(value);
                  }
                },
              ),
            ),
          ),
          Observer(
            builder: (_) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: DropdownButtonFormField<bool>(
                value: chronicalDiseaseInfoController.hasOsteoporosis,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.people_outline),
                  labelText: 'Possui Osteoporose?',
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
                    chronicalDiseaseInfoController.setOsteoporosis(value);
                  }
                },
              ),
            ),
          ),
          Observer(
            builder: (_) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: DropdownButtonFormField<bool>(
                value: chronicalDiseaseInfoController.hasParkinsonDisease,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.people_outline),
                  labelText: 'Possui Mal de Parkinson?',
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
                    chronicalDiseaseInfoController.setParkinsonDisease(value);
                  }
                },
              ),
            ),
          ),
          TextField(
            controller: chronicalDiseaseInfoController.diseasesController,
            decoration: InputDecoration(
              labelText: 'Outras Doenças Crônicas',
              suffixIcon: IconButton(
                icon: const Icon(
                  Icons.add,
                  color: Colors.blue,
                ),
                onPressed: () {
                  chronicalDiseaseInfoController.addDisease(chronicalDiseaseInfoController.diseasesController.text);
                  chronicalDiseaseInfoController.diseasesController.clear();
                },
              ),
            ),
          ),
          const SizedBox(height: 16),
          Observer(
            builder: (_) => Wrap(
              spacing: 8.0,
              children: chronicalDiseaseInfoController.otherDiseases
                  .map((medicine) => Chip(
                        label: Text(
                          medicine,
                          style: TextStyle(
                            color: Theme.of(context).primaryColor, // Set text color to primaryColor
                          ),
                        ),
                        onDeleted: () => chronicalDiseaseInfoController.removeDisease(medicine),
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            color: Theme.of(context).primaryColor, // Set border color to primaryColor
                            width: 1, // Set border width
                          ),
                          borderRadius: BorderRadius.circular(10), // Add a border radius
                        ),
                        deleteIconColor: Theme.of(context).primaryColor, // Set delete icon color to primaryColor
                      ))
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
