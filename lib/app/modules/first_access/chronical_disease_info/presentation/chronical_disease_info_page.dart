import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:go_router/go_router.dart';
import 'package:mobx/mobx.dart';
import 'package:tcc_medicine_management/app/modules/first_access/chronical_disease_info/controller/chronical_disease_info_controller.dart';
import 'package:tcc_medicine_management/app/shared/widgets/padded_screen.dart';

class ChronicalDiseaseInfoPage extends StatefulWidget {
  const ChronicalDiseaseInfoPage({super.key});

  @override
  State<ChronicalDiseaseInfoPage> createState() => _ChronicalDiseaseInfoPageState();
}

class _ChronicalDiseaseInfoPageState extends State<ChronicalDiseaseInfoPage> {
  final ChronicalDiseaseInfoController chronicalDiseaseInfoController = ChronicalDiseaseInfoController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PaddedScreen(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  GestureDetector(
                      onTap: () {
                        context.goNamed('HealthAssistance');
                      },
                      child: const Padding(
                        padding: EdgeInsets.only(bottom: 7.0),
                        child: Icon(Icons.arrow_back_ios, size: 20),
                      )),
                  const SizedBox(width: 6.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'DOENÇAS CRÔNICAS',
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
                ],
              ),
              const SizedBox(height: 30.0),
              Expanded(
                flex: 10,
                child: SingleChildScrollView(
                  child: Form(
                    key: _formKey,
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
                                chronicalDiseaseInfoController
                                    .addDisease(chronicalDiseaseInfoController.diseasesController.text);
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
                                      deleteIconColor:
                                          Theme.of(context).primaryColor, // Set delete icon color to primaryColor
                                    ))
                                .toList(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(child: Container()),
              ElevatedButton(
                onPressed: () {
                  context.goNamed('AllergyInfo');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  minimumSize: const Size(double.infinity, 50),
                  textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                child: const Text('Continuar'),
              ),
              const SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {
                  context.goNamed('AllergyInfo');
                },
                child: const Text(
                  'Pular Etapa',
                  style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
                  // Change color to indicate it's clickable
                ),
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Widget buildTextField(BuildContext context,
  Widget buildTextField(
    BuildContext context,
    TextEditingController? textEditingController, {
    required String label,
    Function? onChanged,
    IconData? icon,
    Function? onClear,
    bool? clearable,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        decoration: InputDecoration(
          prefixIcon: Icon(icon),
          suffixIcon: clearable != null && clearable
              ? IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: () {
                    if (onClear != null) onClear();
                    textEditingController?.clear(); // Clear the text field
                  },
                )
              : null,
          labelText: label,
        ),
        controller: textEditingController,
        onChanged: (value) {
          if (onChanged != null) onChanged(value);
        },
      ),
    );
  }
}
