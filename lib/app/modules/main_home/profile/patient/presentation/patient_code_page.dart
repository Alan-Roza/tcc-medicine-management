import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:tcc_medicine_management/app/modules/main_home/profile/patient/controllers/patient_controller.dart';
import 'package:tcc_medicine_management/app/shared/widgets/padded_screen.dart';

class PatientCodePage extends StatefulWidget {
  const PatientCodePage({super.key});

  @override
  State<PatientCodePage> createState() => _PatientCodePageState();
}

class _PatientCodePageState extends State<PatientCodePage> {
  late PatientController patientController;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      patientController = Provider.of<PatientController>(context, listen: false);

      patientController.code = '';
      await patientController.generateCode();
    });
  }

  @override
  Widget build(BuildContext context) {
    PatientController patientController = Provider.of<PatientController>(context);

    return Scaffold(
      body: SafeArea(
        child: PaddedScreen(
          child: Observer(
            builder: (_) => Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    GestureDetector(
                        onTap: () {
                          context.pop();
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
                          'ADICIONAR PACIENTE',
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
                const Text(
                  textAlign: TextAlign.justify,
                  'Forneça o código para o paciente, através dele ele poderá associar-se ao seu usuário e você será o Responsável por ele.',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Colors.black54, height: 1.4),
                ),
                const SizedBox(height: 10.0),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: patientController.code.split('').map((char) {
                          return Container(
                            margin: const EdgeInsets.symmetric(horizontal: 5.0),
                            padding: const EdgeInsets.all(14.0),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8.0),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.1),
                                  spreadRadius: 1,
                                  blurRadius: 3,
                                  offset: Offset(0, 2), // changes position of shadow
                                ),
                              ],
                            ),
                            child: Text(
                              char,
                              style: const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                      const SizedBox(height: 16.0),
                      ElevatedButton(
                        onPressed: () {
                          Clipboard.setData(ClipboardData(text: patientController.code));
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Código copiado para a área de transferência!')),
                          );
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.copy),
                            const SizedBox(width: 5),
                            Text('Copiar Código'),
                          ],
                        ),
                      ),
                      const SizedBox(height: 40.0),
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: () async {
                    try {
                      await patientController.generateCode();

                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          backgroundColor: Colors.green,
                          content: Text("Gerado com Sucesso!"), // Customize with your success message
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
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    minimumSize: const Size(double.infinity, 40),
                    textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
                  ),
                  child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.refresh),
                            const SizedBox(width: 5),
                            Text('GERAR CÓDIGO'),
                          ],
                        ),
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
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
