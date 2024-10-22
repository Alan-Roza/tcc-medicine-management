import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:tcc_medicine_management/app/modules/first_access/health_info/controller/health_info_controller.dart';
import 'package:tcc_medicine_management/app/modules/first_access/health_info/model/dto/health_info_dto.dart';
import 'package:tcc_medicine_management/app/modules/first_access/health_info/widget/form/health_info_form.dart';
import 'package:tcc_medicine_management/app/shared/widgets/padded_screen.dart';

class GeneralHealthInfoPage extends StatefulWidget {
  const GeneralHealthInfoPage({super.key});

  @override
  State<GeneralHealthInfoPage> createState() => _GeneralHealthInfoPageState();
}

class _GeneralHealthInfoPageState extends State<GeneralHealthInfoPage> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  int? userId;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final HealthInfoController healthInfoController = Provider.of<HealthInfoController>(context, listen: false);

      healthInfoController.dispose();

      HealthInfoDto? healthInfo = await healthInfoController.getHealth();

      healthInfoController.setHeight(healthInfo.height.toString());
      healthInfoController.setWeight(healthInfo.weight.toString());
      healthInfoController.setPregnant(healthInfo.pregnant ?? false);
      healthInfoController.setSmoker(healthInfo.smoking ?? false);
      healthInfoController.setAlcohol(healthInfo.alcohol ?? false);

      if (healthInfo.height != null || healthInfo.weight != null) userId = 1; // 1 == already registered
    });
  }

  @override
  Widget build(BuildContext context) {
    final HealthInfoController healthInfoController = Provider.of<HealthInfoController>(context);

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
            Expanded(child: HealthInfoFormWidget(formKey: formKey)),
            ElevatedButton(
              onPressed: () async {
                try {
                  await healthInfoController.onSubmit(formKey, userId);

                  context.pop();
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      backgroundColor: Colors.green,
                      content: Text("Salvo com Sucesso!"), // Customize with your success message
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
