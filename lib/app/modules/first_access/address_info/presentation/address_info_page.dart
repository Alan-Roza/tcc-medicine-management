import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:tcc_medicine_management/app/modules/first_access/address_info/controller/address_info_controller.dart';
import 'package:tcc_medicine_management/app/modules/first_access/address_info/model/dto/address_info_dto.dart';
import 'package:tcc_medicine_management/app/modules/first_access/address_info/widget/form/address_info_form.dart';
import 'package:tcc_medicine_management/app/shared/widgets/padded_screen.dart';

class AddressInfoPage extends StatefulWidget {
  const AddressInfoPage({super.key});

  @override
  State<AddressInfoPage> createState() => _AddressInfoPageState();
}

class _AddressInfoPageState extends State<AddressInfoPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final AddressInfoController addressInfoController = Provider.of<AddressInfoController>(context);

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
                        context.goNamed('UserInfo');
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
                        'ENDEREÇO DO USUÁRIO',
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
                'Os dados de endereço são utilizados apenas para sugerir a você as farmácias mais próximas, para quando o seu medicamento estiver prestes a acabar.',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Colors.black54, height: 1.4),
              ),
              const SizedBox(height: 10.0),
              Expanded(
                flex: 4,
                child: SingleChildScrollView(
                  child: AddressInfoFormWidget(formKey: _formKey),
                ),
              ),
              Expanded(child: Container()),
              ElevatedButton(
                onPressed: () async {
                  try {
                    await addressInfoController.onSubmit(_formKey);

                    context.goNamed('HealthAssistance');
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
                  context.goNamed('HealthAssistance');
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
