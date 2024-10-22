import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:tcc_medicine_management/app/modules/first_access/chronical_disease_info/controller/chronical_disease_info_controller.dart';
import 'package:tcc_medicine_management/app/modules/first_access/chronical_disease_info/model/dto/chronical_disease_info_dto.dart';
import 'package:tcc_medicine_management/app/modules/first_access/chronical_disease_info/widget/form/chronical_disease_info_form.dart';
import 'package:tcc_medicine_management/app/shared/widgets/padded_screen.dart';

class UserChronicalDiseaseInfoPage extends StatefulWidget {
  const UserChronicalDiseaseInfoPage({super.key});

  @override
  State<UserChronicalDiseaseInfoPage> createState() => _UserChronicalDiseaseInfoPageState();
}

class _UserChronicalDiseaseInfoPageState extends State<UserChronicalDiseaseInfoPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  int? userId;

 @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final ChronicalDiseaseInfoController chronicalDiseaseInfoController = Provider.of<ChronicalDiseaseInfoController>(context, listen: false);

      chronicalDiseaseInfoController.dispose();

      List<ChronicalDiseaseInfoDto>? diseasesInfo = await chronicalDiseaseInfoController.getDiseases();

      // chronicalDiseaseInfoController.setDiseases(diseasesInfo);

      if (diseasesInfo.isNotEmpty) userId = 1; // 1 == already registered
    });
  }

  @override
  Widget build(BuildContext context) {
    final ChronicalDiseaseInfoController chronicalDiseaseInfoController = Provider.of<ChronicalDiseaseInfoController>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Doenças Crônicas'),
        centerTitle: true,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        surfaceTintColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: PaddedScreen(
        child: Column(
          children: [
            Expanded(child: ChronicalDiseaseInfoFormWidget(formKey: _formKey)),
            ElevatedButton(
              onPressed: () async {
                try {
                  await chronicalDiseaseInfoController.onSubmit(userId);

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
