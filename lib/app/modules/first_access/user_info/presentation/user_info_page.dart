import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:tcc_medicine_management/app/modules/first_access/user_info/controller/user_info_controller.dart';
import 'package:tcc_medicine_management/app/modules/first_access/user_info/model/dto/user_info_dto.dart';
import 'package:tcc_medicine_management/app/modules/first_access/user_info/widget/form/user_info_form.dart';
import 'package:tcc_medicine_management/app/shared/widgets/padded_screen.dart';
import 'package:tcc_medicine_management/app/shared/widgets/profile_picture_widget/presentation/profile_picture_widget.dart';

class UserInfoPage extends StatefulWidget {
  const UserInfoPage({super.key});

  @override
  State<UserInfoPage> createState() => _UserInfoPageState();
}

class _UserInfoPageState extends State<UserInfoPage> {
  final GlobalKey<UserInfoFormWidgetState> userInfoFormKey = GlobalKey<UserInfoFormWidgetState>();

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
                child: SingleChildScrollView(child: UserInfoFormWidget(key: userInfoFormKey)),
              ),
              Expanded(child: Container()),
              ElevatedButton(
                onPressed: () async {
                  // if (userInfoFormKey.currentState?.formKey() ?? false) {
                    // Form is valid
                    try {
                      final UserInfoDto response = await userInfoController.onSubmit(null);
 
                      context.goNamed('AddressInfo');

                      // Or show a success snackbar message
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
                  // } 
                  // else {
                  //   // Form is not valid
                  //   print("Form is not valid");
                  //   ScaffoldMessenger.of(context).showSnackBar(
                  //     const SnackBar(
                  //       backgroundColor: Colors.red,
                  //       content: Text("Form is not valid"), // Provide feedback to the user
                  //     ),
                  //   );
                  // }
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
