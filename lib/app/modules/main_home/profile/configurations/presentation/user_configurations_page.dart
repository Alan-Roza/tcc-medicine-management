import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class UserConfigurationsPage extends StatelessWidget {
  const UserConfigurationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Configurações'),	
        centerTitle: true,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        surfaceTintColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: Column(
        children: [
            Expanded(
            child: ListView(
              padding: const EdgeInsets.only(top: 0), // Add this line to remove the top padding
              children: [
              // Menu options
                _buildMenuItem(
                Icons.person_outline, 'Informações Gerais', '', context, false, () => context.goNamed('UserGeneralConfigurations')),
              ],
            ),
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
