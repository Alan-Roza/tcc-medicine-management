import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:tcc_medicine_management/app/modules/first_access/user_info/controller/user_info_controller.dart';
import 'package:tcc_medicine_management/app/modules/first_access/user_info/model/dto/user_info_dto.dart';
import 'package:tcc_medicine_management/app/modules/first_access/user_info/widget/form/user_info_form.dart';
import 'package:tcc_medicine_management/app/shared/controllers/user/user_controller.dart';
import 'package:tcc_medicine_management/app/shared/widgets/padded_screen.dart';
import 'package:tcc_medicine_management/app/shared/widgets/profile_picture_widget/controller/profile_picture_controller.dart';
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
    final UserController userController = Provider.of<UserController>(context);
    final ProfilePictureController profilePictureController = Provider.of<ProfilePictureController>(context);

    return Scaffold(
      body: SafeArea(
        child: Observer(builder: (context) {
          return PaddedScreen(
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
                  flex: 6,
                  child: SingleChildScrollView(child: UserInfoFormWidget(formKey: _formKey)),
                ),
                Expanded(child: Container()),
                ElevatedButton(
                  onPressed: () async {
                    try {
                      final UserInfoDto? userPatient = await userInfoController.getPatient();
                      final UserInfoDto response = await userInfoController.onSubmit(_formKey, userPatient != null ? 1 : null);
                      if (profilePictureController.image != null) await userInfoController.uploadPhoto(profilePictureController.image!);
                      userController.login(response.name ?? 'Desconhecido');

                      profilePictureController.clear();

                      context.goNamed('AddressInfo');
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
                    textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  child: const Text('Continuar'),
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
