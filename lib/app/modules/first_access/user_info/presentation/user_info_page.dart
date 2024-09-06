import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';
import 'package:tcc_medicine_management/app/modules/first_access/user_info/controller/user_info_controller.dart';
import 'package:tcc_medicine_management/app/shared/widgets/custom_text_field/custom_text_field_widget.dart';
import 'package:tcc_medicine_management/app/shared/widgets/padded_screen.dart';
import 'package:tcc_medicine_management/app/shared/widgets/profile_picture_widget/presentation/profile_picture_widget.dart';

class UserInfoPage extends StatefulWidget {
  const UserInfoPage({super.key});

  @override
  State<UserInfoPage> createState() => _UserInfoPageState();
}

class _UserInfoPageState extends State<UserInfoPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final UserInfoController userInfoController = Provider.of<UserInfoController>(context);

    return Scaffold(
      body: SafeArea(
        child: PaddedScreen(
          child: Column(
            children: [
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'INFORMAÇÕES DO USUÁRIO',
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
              const SizedBox(height: 40),
              const Row(
                children: [
                  ProfilePictureWidget(),
                  SizedBox(width: 20),
                  Flexible(
                    child: Text(
                      'Adicione uma foto de perfil (opcional)',
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40),
              Expanded(
                flex: 4,
                child: SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Observer(
                          builder: (_) => CustomTextFieldWidget(
                            textEditingController: userInfoController.nameController,
                            icon: Icons.person_outline,
                            label: 'Nome',
                          ),
                        ),
                        Observer(
                          builder: (_) => Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: TextFormField(
                              controller: userInfoController.birthDateController,
                              decoration: const InputDecoration(
                                prefixIcon: Icon(Icons.calendar_month_rounded),
                                labelText: 'Data de Nascimento',
                              ),
                              readOnly: true, // Makes the field not editable; only selectable
                              onTap: () async {
                                DateTime? pickedDate = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(1900),
                                  lastDate: DateTime.now(),
                                );
                                if (pickedDate != null) {
                                  // Update the text field with the selected date
                                  userInfoController
                                      .setBirthDate(pickedDate); // Update your controller/state management solution
                                }
                              },
                            ),
                          ),
                        ),
                        Observer(
                          builder: (_) => Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: DropdownButtonFormField<Gender>(
                              value: userInfoController.gender,
                              decoration: const InputDecoration(
                                prefixIcon: Icon(Icons.people_outline),
                                labelText: 'Gênero',
                                // Add other decorations here if necessary
                              ),
                              items: Gender.values.map((Gender value) {
                                return DropdownMenuItem<Gender>(
                                  value: value,
                                  child: Text(value.toString().split('.').last),
                                );
                              }).toList(),
                              onChanged: (Gender? value) {
                                if (value != null) {
                                  userInfoController.setGender(value);
                                }
                              },
                            ),
                          ),
                        ),
                        Observer(
                          builder: (_) => CustomTextFieldWidget(
                            textEditingController: userInfoController.phoneController,
                            icon: Icons.phone_outlined,
                            label: 'Celular',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(child: Container()),
              ElevatedButton(
                onPressed: () {
                  context.goNamed('AddressInfo');
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
                  context.goNamed('AddressInfo');
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
}
