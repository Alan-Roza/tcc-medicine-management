import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tcc_medicine_management/app/modules/first_access/user_info/controller/user_info_controller.dart';
import 'package:tcc_medicine_management/app/modules/main_home/profile/main/controllers/user_profile_controller.dart';
import 'package:tcc_medicine_management/app/shared/constants/constants.dart';
import 'package:tcc_medicine_management/app/shared/controllers/user/user_controller.dart';

class UserProfilePage extends StatefulWidget {
  const UserProfilePage({super.key});

  @override
  State<UserProfilePage> createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
  final userProfileController = UserProfileController();

  late String? profileImagePath;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _fetchProfileImage();
    });
  }

  Future<void> _fetchProfileImage() async {
    UserInfoController userInfoController = Provider.of<UserInfoController>(context, listen: false);

    profileImagePath = await userInfoController.getProfileImage();
  }

  Future<String?> _getToken() async {
    await _fetchProfileImage();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    return token;
  }

  @override
  Widget build(BuildContext context) {
    final userController = Provider.of<UserController>(context);

    return Scaffold(
      body: FutureBuilder<String?>(
          future: _getToken(), // Fetch the token asynchronously
          builder: (BuildContext context, AsyncSnapshot<String?> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              // While waiting for the token, you can show a loading indicator
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              // Handle any errors that might occur
              return Center(child: Text('Erro: ${snapshot.error}'));
            } else if (snapshot.hasData) {
              // When the token is retrieved, you can use it
              String? token = snapshot.data;

              return Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 40.0, bottom: 8.0),
                    child: Row(
                      children: [
                        Center(
                          child: profileImagePath == null
                              ? CircularProgressIndicator()
                              : CircleAvatar(
                                  radius: 32,
                                  backgroundImage: NetworkImage(
                                    Constants.baseUrl + (profileImagePath ?? ''),
                                    headers: {
                                      'Authorization': 'Bearer $token',
                                    },
                                  ),
                                ),
                        ),
                        SizedBox(width: 16),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              userController.name,
                              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, height: 1.1),
                            ),
                            if (userController.userEmail != null && userController.userEmail!.isNotEmpty)
                              Text(
                                userController.userEmail!,
                                style: TextStyle(fontSize: 14, color: Colors.black54, fontWeight: FontWeight.w300),
                              ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  const Divider(
                    height: 0,
                    thickness: 1,
                    color: Colors.black12,
                  ),
                  Expanded(
                    child: ListView(
                      padding: const EdgeInsets.only(top: 0),
                      children: [
                        // Menu options
                        _buildMenuItem(Icons.person_outline, 'Meus dados', 'Minhas informações da conta', context,
                            false, () => context.goNamed('UserGeneralInfo')),
                        _buildMenuItem(Icons.health_and_safety, 'Informações de Saúde', 'Minhas informações de saúde',
                            context, false, () => context.goNamed('UserHealthInfoPage')),
                        _buildMenuItem(Icons.wifi, 'Conexão', 'Gerencie seus widgets', context, false,
                            () => context.goNamed('Connection')),
                        _buildMenuItem(Icons.people_outlined, 'Pacientes', 'Gerencie seus pacientes', context, false,
                            () => context.goNamed('Patients')),
                      ],
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      _buildMenuItem(Icons.help_outline, 'Ajuda', '', context, true, () => context.goNamed('FaqHelp')),
                      _buildMenuItem(Icons.security, 'Segurança', '', context, true, () => {}),
                      _buildMenuItem(Icons.settings, 'Configurações', '', context, true,
                          () => context.goNamed('UserConfigurations')),
                    ],
                  ),
                  const SizedBox(height: 16.0),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: ElevatedButton(
                      onPressed: () async {
                        SharedPreferences prefs = await SharedPreferences.getInstance();
                        await prefs.remove('token');
                        context.goNamed('Home');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red[900],
                        minimumSize: const Size(double.infinity, 40),
                        textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.logout_outlined,
                            size: 20.0,
                          ),
                          SizedBox(width: 2.0),
                          Text('SAIR'),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 16.0),
                ],
              );
            }
            return const Center(child: Text('Nenhum Token encontrado!'));
          }),
    );
  }

  Widget _buildMenuItem(
      IconData icon, String title, String subtitle, BuildContext context, bool greyMode, Function onTap) {
    return Column(
      children: [
        ListTile(
          minTileHeight: 0,
          minVerticalPadding: 12.0,
          leading: Icon(icon, color: greyMode ? Colors.black54 : Colors.black87),
          title: Text(title,
              style: TextStyle(fontWeight: FontWeight.bold, color: greyMode ? Colors.black54 : Colors.black87)),
          subtitle: subtitle.isNotEmpty
              ? Text(
                  subtitle,
                  style: const TextStyle(fontWeight: FontWeight.normal, fontSize: 12, color: Colors.black54),
                )
              : null,
          trailing: Icon(Icons.arrow_forward_ios, size: 16, color: greyMode ? Colors.black54 : Colors.black87),
          onTap: () {
            onTap();
          },
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          child: Divider(
            height: 0,
            thickness: 1,
            color: Colors.black12,
          ),
        ),
      ],
    );
  }
}
