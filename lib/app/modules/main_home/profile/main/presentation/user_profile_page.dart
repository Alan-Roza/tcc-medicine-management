import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tcc_medicine_management/app/modules/main_home/profile/main/controllers/user_profile_controller.dart';

class UserProfilePage extends StatelessWidget {
  final userProfileController = UserProfileController();

  UserProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 40.0, bottom: 8.0),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 32,
                  backgroundImage: NetworkImage('https://via.placeholder.com/150'), // Replace with your image
                ),
                SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Luna Roza',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Responsável',
                      style: TextStyle(fontSize: 16, color: Colors.black54, fontWeight: FontWeight.w300),
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
              _buildMenuItem(
                Icons.person_outline, 'Meus dados', 'Minhas informações da conta', context, false, () => context.goNamed('UserGeneralInfo')),
              _buildMenuItem(Icons.health_and_safety, 'Informações de Saúde', 'Minhas informações de saúde', context,
                false, () => context.goNamed('UserHealthInfoPage')),
              _buildMenuItem(Icons.wifi, 'Conexão', 'Gerencie seus widgets', context, false, () => context.goNamed('Connection')),
              _buildMenuItem(Icons.people_outlined, 'Pacientes', 'Gerencie seus pacientes', context, false, () => context.goNamed('Patients')),
              ],
            ),
            ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              _buildMenuItem(Icons.help_outline, 'Ajuda', '', context, true, () => context.goNamed('FaqHelp')),
              _buildMenuItem(Icons.security, 'Segurança', '', context, true, () => {}),
              _buildMenuItem(Icons.settings, 'Configurações', '', context, true, () => context.goNamed('UserConfigurations')),
            ],
          ),
          const SizedBox(height: 8.0),
        ],
      ),
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
