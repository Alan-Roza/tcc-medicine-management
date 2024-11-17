import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:tcc_medicine_management/app/modules/first_access/allergy_info/controller/allergy_info_controller.dart';
import 'package:tcc_medicine_management/app/modules/first_access/allergy_info/model/dto/allergy_info_dto.dart';
import 'package:tcc_medicine_management/app/modules/first_access/allergy_info/widget/form/allergy_info_form.dart';
import 'package:tcc_medicine_management/app/shared/widgets/padded_screen.dart';

class UserAllergyInfoPage extends StatefulWidget {
  const UserAllergyInfoPage({super.key});

  @override
  State<UserAllergyInfoPage> createState() => _UserAllergyInfoPageState();
}

class _UserAllergyInfoPageState extends State<UserAllergyInfoPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

   @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final AllergyInfoController allergyInfoController = Provider.of<AllergyInfoController>(context, listen: false);

      List<AllergyInfoDto>? allergiesInfo = await allergyInfoController.getAllergies();

      allergyInfoController.setAllergies(allergiesInfo);

      // if (allergiesInfo.isNotEmpty) userId = 1; // 1 == already registered
    });
  }

  @override
  Widget build(BuildContext context) {
      final AllergyInfoController allergyInfoController = Provider.of<AllergyInfoController>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Alergia a Medicamentos'),
        centerTitle: true,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        surfaceTintColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: PaddedScreen(
        child: Column(
          children: [
            Expanded(child: SingleChildScrollView(child: AllergyInfoFormWidget(formKey: _formKey,))),
            ElevatedButton(
              onPressed: () async {
                try {
                  await allergyInfoController.onSubmit();

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
