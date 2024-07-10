import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:tcc_medicine_management/app/modules/first_access/user_info/controller/user_info_controller.dart';
import 'package:tcc_medicine_management/app/shared/widgets/profile_picture_widget/presentation/profile_picture_widget.dart';

class UserInfoPage extends StatefulWidget {
  const UserInfoPage({super.key});

  @override
  State<UserInfoPage> createState() => _UserInfoPageState();
}

class _UserInfoPageState extends State<UserInfoPage> {
  final UserInfoController userInfoController = UserInfoController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // late final TextEditingController textFieldController;

  @override
  void initState() {
    super.initState();
    reaction((_) => userInfoController.nameController.text, (String value) {
      userInfoController.nameController.text = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'INFORMAÇÕES DO USUÁRIO',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
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
                          borderRadius:
                              BorderRadius.circular(10), // Add a border radius
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
              Container(
                child: SingleChildScrollView(
                    child: Form(
                        key: _formKey,
                        child: Column(children: [
                          Observer(
                            builder: (_) => buildTextField(
                              context,
                              userInfoController.nameController,
                              icon: Icons.person,
                              label: 'Nome',
                              onClear: userInfoController.clearName,
                              onChanged: (value) =>
                                  userInfoController.setName(value),
                            ),
                          ),
                          Observer(
                            builder: (_) => buildTextField(
                              context,
                              userInfoController.birthDateController,
                              icon: Icons.calendar_today,
                              label: 'Data de Nascimento',
                              onClear: userInfoController.clearBirthDate,
                              onChanged: (value) => userInfoController
                                  .birthDateController.text = value,
                            ),
                          ),
                          Observer(
                            builder: (_) => buildTextField(
                              context,
                              userInfoController.genderController,
                              icon: Icons.people,
                              label: 'Gênero',
                              onClear: userInfoController.clearGender,
                              onChanged: (value) => userInfoController
                                  .genderController.text = value,
                            ),
                          ),
                          Observer(
                            builder: (_) => buildTextField(
                              context,
                              userInfoController.phoneController,
                              icon: Icons.phone,
                              label: 'Celular',
                              onClear: userInfoController.clearPhone,
                              onChanged: (value) =>
                                  userInfoController.phoneController.text = value,
                            ),
                          ),
                        ]))),
              ),
              Expanded(child: Container()),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  minimumSize: const Size(double.infinity, 50),
                ),
                child: const Text('Continuar'),
              ),
              TextButton(
                onPressed: () {},
                child: const Text('Pular Etapa'),
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
    required IconData icon,
    required String label,
    required Function onChanged,
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
          onChanged(value);
        },
      ),
    );
  }
}
