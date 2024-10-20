import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:tcc_medicine_management/app/modules/first_access/chronical_disease_info/controller/chronical_disease_info_controller.dart';
import 'package:tcc_medicine_management/app/modules/first_access/chronical_disease_info/widget/form/chronical_disease_info_form.dart';
import 'package:tcc_medicine_management/app/modules/first_access/health_info/controller/health_info_controller.dart';
import 'package:tcc_medicine_management/app/shared/widgets/padded_screen.dart';

class ChronicalDiseaseInfoPage extends StatefulWidget {
  const ChronicalDiseaseInfoPage({super.key});

  @override
  State<ChronicalDiseaseInfoPage> createState() => _ChronicalDiseaseInfoPageState();
}

class _ChronicalDiseaseInfoPageState extends State<ChronicalDiseaseInfoPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final HealthInfoController healthInfoController = Provider.of<HealthInfoController>(context);
    final ChronicalDiseaseInfoController chronicalDiseaseInfoController =
        Provider.of<ChronicalDiseaseInfoController>(context);

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
                        if (healthInfoController.hasAllergy) {
                          context.goNamed('AllergyInfo');
                        } else {
                          context.goNamed('HealthInfo');
                        }
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
                child: SingleChildScrollView(child: ChronicalDiseaseInfoFormWidget(formKey: _formKey)),
              ),
              Expanded(child: Container()),
              ElevatedButton(
                onPressed: () async {
                  try {
                    await chronicalDiseaseInfoController.onSubmit();

                    context.goNamed('ConfigurationsInfo');

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
                  context.goNamed('ConfigurationsInfo');
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
