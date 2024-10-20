import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:tcc_medicine_management/app/modules/first_access/allergy_info/controller/allergy_info_controller.dart';
import 'package:tcc_medicine_management/app/modules/first_access/allergy_info/widget/form/allergy_info_form.dart';
import 'package:tcc_medicine_management/app/modules/first_access/health_info/controller/health_info_controller.dart';
import 'package:tcc_medicine_management/app/shared/widgets/padded_screen.dart';

class AllergyInfoPage extends StatefulWidget {
  const AllergyInfoPage({super.key});

  @override
  State<AllergyInfoPage> createState() => _AllergyInfoPageState();
}

class _AllergyInfoPageState extends State<AllergyInfoPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final HealthInfoController healthInfoController = Provider.of<HealthInfoController>(context);
    final AllergyInfoController allergyInfoController = Provider.of<AllergyInfoController>(context);

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
                        context.goNamed('HealthInfo');
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
                        'ALERGIA A MEDICAMENTOS',
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
                  child: AllergyInfoFormWidget(formKey: _formKey),
                ),
              ),
              Expanded(child: Container()),
              ElevatedButton(
                onPressed: () async {
                  try {
                    await allergyInfoController.onSubmit();

                    if (healthInfoController.hasChronicDisease) {
                      context.goNamed('ChronicalDiseaseInfo');
                    } else {
                      context.goNamed('ConfigurationsInfo');
                    }

                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        backgroundColor: Colors.green,
                        content: Text("Salvo com Sucesso!"),
                      ),
                    );
                  } catch (error) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor: Colors.red,
                        content: Text(error.toString()),
                      ),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  minimumSize: const Size(double.infinity, 40),
                  textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                child: const Text('Continuar'),
              ),
              const SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {
                  if (healthInfoController.hasChronicDisease) {
                    context.goNamed('ChronicalDiseaseInfo');
                  } else {
                    context.goNamed('ConfigurationsInfo');
                  }
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
