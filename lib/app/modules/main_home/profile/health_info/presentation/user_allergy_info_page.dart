import 'package:flutter/material.dart';
import 'package:tcc_medicine_management/app/modules/first_access/allergy_info/widget/form/allergy_info_form.dart';
import 'package:tcc_medicine_management/app/shared/widgets/padded_screen.dart';

class UserAllergyInfoPage extends StatelessWidget {
  UserAllergyInfoPage({super.key});
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
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
            Expanded(child: AllergyInfoFormWidget(formKey: _formKey,)),
            ElevatedButton(
              onPressed: () {},
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
