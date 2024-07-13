import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:go_router/go_router.dart';
import 'package:mobx/mobx.dart';
import 'package:tcc_medicine_management/app/modules/first_access/configurations/controller/configurations_controller.dart';
import 'package:tcc_medicine_management/app/shared/widgets/padded_screen.dart';

class ConfigurationsPage extends StatefulWidget {
  const ConfigurationsPage({super.key});

  @override
  State<ConfigurationsPage> createState() => _ConfigurationsPageState();
}

class _ConfigurationsPageState extends State<ConfigurationsPage> {
  final ConfigurationsController configurationsController = ConfigurationsController();
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
                        context.goNamed('ChronicalDiseaseAssistance');
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
                        'CONFIGURAÇÕES DO SISTEMA',
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // const SizedBox(height: 30.0),
                        const Text(
                          'DADOS ESTÁTICOS',
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 10.0),
                        Observer(builder: (_) {
                          return Row(
                            children: [
                              Checkbox(
                                value: configurationsController.allowDataStorage,
                                onChanged: (value) {
                                  configurationsController.toggleDataStorage();
                                },
                              ),
                              const SizedBox(width: 10.0),
                              const Expanded(
                                child: Text(
                                  'Permito o armazenamento dos meus dados para geração de dados estatísticos',
                                  style: TextStyle(fontSize: 16),
                                ),
                              ),
                            ],
                          );
                        }),
                        const SizedBox(height: 30.0),

                        const Text(
                          'NOTIFICAÇÃO',
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Observer(
                          builder: (_) => Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: DropdownButtonFormField<bool>(
                              value: configurationsController.notifyWhatsapp,
                              decoration: const InputDecoration(
                                prefixIcon: Icon(Icons.people_outline),
                                labelText: 'Whatsapp',
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
                                  configurationsController.setNotifyWhatsapp(value);
                                }
                              },
                            ),
                          ),
                        ),
                        Observer(
                          builder: (_) => Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: DropdownButtonFormField<bool>(
                              value: configurationsController.notifyEmail,
                              decoration: const InputDecoration(
                                prefixIcon: Icon(Icons.people_outline),
                                labelText: 'E-mail',
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
                                  configurationsController.setNotifyEmail(value);
                                }
                              },
                            ),
                          ),
                        ),
                        Observer(
                          builder: (_) => Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: DropdownButtonFormField<bool>(
                              value: configurationsController.notifyPopup,
                              decoration: const InputDecoration(
                                prefixIcon: Icon(Icons.people_outline),
                                labelText: 'Pop-up',
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
                                  configurationsController.setNotifyPopup(value);
                                }
                              },
                            ),
                          ),
                        ),
                        const SizedBox(height: 30.0),

                        const Text(
                          'TIPOGRAFIA',
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Observer(
                          builder: (_) => Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: DropdownButtonFormField<String>(
                              value: configurationsController.fontSize,
                              decoration: const InputDecoration(
                                prefixIcon: Icon(Icons.people_outline),
                                labelText: 'Tamanho da Fonte',
                              ),
                              items: const [
                                DropdownMenuItem<String>(
                                  value: "normal",
                                  child: Text('NORMAL'),
                                ),
                                DropdownMenuItem<String>(
                                  value: "plus",
                                  child: Text('AUMENTADA'),
                                ),
                              ],
                              onChanged: (String? value) {
                                if (value != null) {
                                  configurationsController.setFontSize(value);
                                }
                              },
                            ),
                          ),
                        ),
                        const SizedBox(height: 30.0),
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
