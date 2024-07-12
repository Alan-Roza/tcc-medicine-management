import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:go_router/go_router.dart';
import 'package:mobx/mobx.dart';
import 'package:tcc_medicine_management/app/modules/first_access/health_info/controller/health_info_controller.dart';
import 'package:tcc_medicine_management/app/shared/widgets/padded_screen.dart';

class HealthInfoPage extends StatefulWidget {
  const HealthInfoPage({super.key});

  @override
  State<HealthInfoPage> createState() => _HealthInfoPageState();
}

class _HealthInfoPageState extends State<HealthInfoPage> {
  final HealthInfoController healthInfoController = HealthInfoController();
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
                    )
                  ),
                  const SizedBox(width: 6.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'INFORMAÇÕES DE SAÚDE',
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
                          builder: (_) => buildTextField(
                            context,
                            healthInfoController.height,
                            icon: Icons.local_post_office_rounded,
                            label: 'Altura (metros)',
                          ),
                        ),
                    
                         Observer(
                          builder: (_) => buildTextField(
                            context,
                            healthInfoController.weight,
                            icon: Icons.streetview_outlined,
                            label: 'Peso (kg)',
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
                  ),
                ),
              ),
              Expanded(child: Container()),
              ElevatedButton(
                onPressed: () {
                  context.goNamed('UserAddressInfo');
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
                  context.goNamed('UserAddressInfo');
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
