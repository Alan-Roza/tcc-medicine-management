import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:tcc_medicine_management/app/modules/first_access/administrator_info/controller/administrator_info_controller.dart';
import 'package:tcc_medicine_management/app/shared/controllers/user/user_controller.dart';
import 'package:tcc_medicine_management/app/shared/widgets/padded_screen.dart';

class AdministratorInfoPage extends StatefulWidget {
  const AdministratorInfoPage({super.key});

  @override
  State<AdministratorInfoPage> createState() => _AdministratorInfoPageState();
}

class _AdministratorInfoPageState extends State<AdministratorInfoPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final AdministratorInfoController administratorInfoController = Provider.of<AdministratorInfoController>(context);
    final UserController userController = Provider.of<UserController>(context);

    return Scaffold(
      body: Observer(
        builder: (_) => SafeArea(
          child: PaddedScreen(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    GestureDetector(
                        onTap: () {
                          context.goNamed('ConfigurationsInfo');
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
                          'ADICIONAR RESPONSÁVEL',
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
                RichText(
                  textAlign: TextAlign.justify,
                  text: const TextSpan(
                    children: [
                      TextSpan(
                        text:
                            "Caso deseje adicionar um usuário como seu responsável, digite o código de 6 dígitos no campo abaixo. ",
                        style: TextStyle(color: Colors.black54, fontSize: 16.0),
                      ),
                      TextSpan(
                        text: "Caso contrário clique em Não possuo Responsável.",
                        style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 16.0),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10.0),
                RichText(
                  textAlign: TextAlign.justify,
                  text: const TextSpan(
                    children: [
                      TextSpan(
                        text: "Para gerar o código, peça para o seu responsável. É possível gerar acessando em: ",
                        style: TextStyle(color: Colors.black54, fontSize: 16.0),
                      ),
                      TextSpan(
                        text: "Perfil > Administração > Gerar código",
                        style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 16.0),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10.0),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      buildTextField(
                        context,
                        null,
                        icon: Icons.lock_outline,
                        label: 'Código',
                        onChanged: (value) async {
                          administratorInfoController.code = value;
                          if (value.length >= 6) {
                            try {
                              await administratorInfoController.getAdministratorInfos(value);
                      
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  backgroundColor: Colors.green,
                                  content: Text("Encontrado com Sucesso!"),
                                ),
                              );
                            } catch (error) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  backgroundColor: Colors.red,
                                  content: Text("Não foi possível encontrar o responsável!"),
                                ),
                              );
                            }
                          } else {
                            administratorInfoController.administratorProfilePicture = '';
                            administratorInfoController.administratorName = '';
                          }
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 40),
                Row(
                  children: [
                    const Flexible(
                      child: Text(
                        'Foto de perfil do responsável através do código digitado',
                        style: TextStyle(fontSize: 14),
                      ),
                    ),
                    const SizedBox(width: 20),
                    Column(
                      children: [
                        if (administratorInfoController.administratorProfilePicture.isNotEmpty &&
                            administratorInfoController.code.length == 6)
                          CircleAvatar(
                            radius: 70,
                            backgroundImage: NetworkImage(
                              administratorInfoController.administratorProfilePicture,
                              headers: {
                                'Authorization': 'Bearer ${userController.token}',
                              },
                            ),
                          ),
                        if (administratorInfoController.administratorProfilePicture.isEmpty ||
                            administratorInfoController.code.length != 6)
                          CircleAvatar(
                              radius: 70,
                              backgroundColor: Colors.grey.shade800,
                              child: const Icon(
                                Icons.camera_alt_outlined,
                                size: 55,
                                color: Colors.white,
                              )),
                        const SizedBox(height: 5.0),
                        if (administratorInfoController.code.length == 6)
                          Text(
                            administratorInfoController.administratorName,
                            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                          ),
                      ],
                    ),
                  ],
                ),
                Expanded(child: Container()),
                ElevatedButton(
                  onPressed: () async {
                    try {
                      await administratorInfoController.onSubmit();
        
                      context.goNamed('MenuAssistance');
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
                GestureDetector(
                  onTap: () {
                    context.goNamed('MenuAssistance');
                  },
                  child: const Text(
                    'Não Possuo Responsável',
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
          if (onChanged != null) onChanged(value); // Limit to 6 characters
        },
        validator: (value) {
          if (value!.length != 6) {
            return 'O código deve ter 6 dígitos';
          }
          return null;
        },
      ),
    );
  }
}
