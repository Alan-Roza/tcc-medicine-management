import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:tcc_medicine_management/app/modules/first_access/user_info/controller/user_info_controller.dart';
import 'package:tcc_medicine_management/app/modules/first_access/user_info/model/dto/user_info_dto.dart';
import 'package:tcc_medicine_management/app/modules/first_access/user_info/widget/form/user_info_form.dart';
import 'package:tcc_medicine_management/app/shared/controllers/user/user_controller.dart';
import 'package:tcc_medicine_management/app/shared/widgets/padded_screen.dart';
import 'package:tcc_medicine_management/app/shared/widgets/profile_picture_widget/controller/profile_picture_controller.dart';
import 'package:tcc_medicine_management/app/shared/widgets/profile_picture_widget/presentation/profile_picture_widget.dart';

class GeneralInfoPage extends StatefulWidget {
  const GeneralInfoPage({super.key});

  @override
  State<GeneralInfoPage> createState() => _GeneralInfoPageState();
}

class _GeneralInfoPageState extends State<GeneralInfoPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  int? userId;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final UserInfoController userInfoController = Provider.of<UserInfoController>(context, listen: false);

      userInfoController.dispose();

      UserInfoDto patient = await userInfoController.getPatient();

      userInfoController.nameController.text = patient.name ?? '';
      userInfoController.setBirthDate(DateTime.parse(patient.birthdate!));
      switch (patient.gender) {
        case 'Masculino':
          userInfoController.setGender(Gender.Masculino);
          break;
        case 'Feminino':
          userInfoController.setGender(Gender.Feminino);
          break;
        default:
          userInfoController.setGender(Gender.Masculino);
      }
      userInfoController.phoneController.text = patient.telephone?.substring(2) ?? '';

      if (patient.name != null) userId = 1; // 1 == already registered
    });
  }

  @override
  Widget build(BuildContext context) {
    final UserInfoController userInfoController = Provider.of<UserInfoController>(context);
    final UserController userController = Provider.of<UserController>(context);
    final ProfilePictureController profilePictureController = Provider.of<ProfilePictureController>(context);


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
            const Row(
              children: [
                ProfilePictureWidget(),
                SizedBox(width: 20),
                Flexible(
                  child: Text(
                    'Envie nova foto de perfil',
                    style: TextStyle(fontSize: 14),
                  ),
                ),
              ],
            ),
            SizedBox(height: 15.0),
            Expanded(child: UserInfoFormWidget(formKey: _formKey)),
            ElevatedButton(
              onPressed: () async {
                try {
                  final UserInfoDto response = await userInfoController.onSubmit(_formKey, userId);
                  if (profilePictureController.image != null) await userInfoController.uploadPhoto(profilePictureController.image!);
                  if (response.name != null) userController.login(response.name!);

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
