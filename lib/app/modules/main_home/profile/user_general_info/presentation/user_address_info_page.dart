import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:tcc_medicine_management/app/modules/first_access/address_info/controller/address_info_controller.dart';
import 'package:tcc_medicine_management/app/modules/first_access/address_info/model/dto/address_info_dto.dart';
import 'package:tcc_medicine_management/app/modules/first_access/address_info/widget/form/address_info_form.dart';
import 'package:tcc_medicine_management/app/shared/widgets/padded_screen.dart';

class UserAddressInfoPage extends StatefulWidget {
  const UserAddressInfoPage({super.key});

  @override
  State<UserAddressInfoPage> createState() => _UserAddressInfoPageState();
}

class _UserAddressInfoPageState extends State<UserAddressInfoPage> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  int? userId;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
    final AddressInfoController addressInfoController = Provider.of<AddressInfoController>(context, listen: false);

      addressInfoController.dispose();

      AddressInfoDto patientAddress = await addressInfoController.getPatientAddress();

      addressInfoController.postalCode.text = patientAddress.zipcode ?? '';
      addressInfoController.street.text = patientAddress.street ?? '';
      addressInfoController.neighborhood.text = patientAddress.neighborhood ?? '';
      addressInfoController.city.text = patientAddress.city ?? '';
      addressInfoController.state.text = patientAddress.state ?? '';

      if (patientAddress.zipcode != null) userId = 1; // 1 == already registered
    });
  }

  @override
  Widget build(BuildContext context) {
    final AddressInfoController addressInfoController = Provider.of<AddressInfoController>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Endereço'),
        centerTitle: true,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        surfaceTintColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: PaddedScreen(
        child: Column(
          children: [
            Expanded(child: AddressInfoFormWidget(formKey: formKey)),
            ElevatedButton(
              onPressed: () async {
                try {
                  await addressInfoController.onSubmit(formKey, userId);

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
