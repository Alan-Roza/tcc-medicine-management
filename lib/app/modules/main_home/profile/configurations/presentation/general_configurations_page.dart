import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:tcc_medicine_management/app/modules/first_access/configurations/controller/configurations_controller.dart';
import 'package:tcc_medicine_management/app/modules/first_access/configurations/widget/form/configurations_form.dart';
import 'package:tcc_medicine_management/app/shared/widgets/padded_screen.dart';

class GeneralConfigurationsPage extends StatefulWidget {
  const GeneralConfigurationsPage({super.key});

  @override
  State<GeneralConfigurationsPage> createState() => _GeneralConfigurationsPageState();
}

class _GeneralConfigurationsPageState extends State<GeneralConfigurationsPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late ConfigurationsController configurationsController;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    configurationsController = Provider.of<ConfigurationsController>(context);

    configurationsController.getConfigurations();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Informações Gerais'),
        centerTitle: true,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        surfaceTintColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: PaddedScreen(
        child: Column(
          children: [
            Expanded(child: SingleChildScrollView(child: ConfigurationsFormWidget(formKey: _formKey))),
            ElevatedButton(
              onPressed: () async {
                  try {
                    await configurationsController.onSubmit();

                    context.goNamed('UserConfigurations');

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
                textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
              ),
              child: const Text('SALVAR'),
            ),
            const SizedBox(height: 15.0),
          ],
        ),
      ),
    );
  }
}
