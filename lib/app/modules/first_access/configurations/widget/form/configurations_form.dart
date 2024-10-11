import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:tcc_medicine_management/app/modules/first_access/configurations/controller/configurations_controller.dart';

class ConfigurationsFormWidget extends StatefulWidget {
  final bool readOnly;
  final GlobalKey<FormState> formKey;

  const ConfigurationsFormWidget({super.key, required this.formKey, this.readOnly = false});

  @override
  ConfigurationsFormWidgetState createState() => ConfigurationsFormWidgetState();
}

class ConfigurationsFormWidgetState extends State<ConfigurationsFormWidget> with SingleTickerProviderStateMixin {

  @override
  Widget build(BuildContext context) {
    final ConfigurationsController configurationsController = Provider.of<ConfigurationsController>(context);

    return Form(
      key: widget.formKey,
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
    );
  }
}
