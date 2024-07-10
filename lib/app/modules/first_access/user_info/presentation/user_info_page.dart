import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:tcc_medicine_management/app/modules/first_access/user_info/controller/user_info_controller.dart';
import 'package:tcc_medicine_management/app/shared/widgets/profile_picture_widget/presentation/profile_picture_widget.dart';

class UserInfoPage extends StatelessWidget {
  final UserInfoController store = UserInfoController();

  UserInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(height: 20),
            const Text(
              'INFORMAÇÕES DO USUÁRIO',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'Adicione uma foto de perfil (opcional)',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            // CircleAvatar(
            //   radius: 40,
            //   backgroundColor: Colors.grey.shade200,
            //   child: Icon(Icons.camera_alt, size: 40, color: Colors.grey.shade700),
            // ),
            const ProfilePictureWidget(),
            const SizedBox(height: 20),
            Observer(
              builder: (_) => buildTextField(
                context,
                icon: Icons.person,
                label: 'Nome',
                value: store.name,
                onClear: store.clearName,
              ),
            ),
            Observer(
              builder: (_) => buildTextField(
                context,
                icon: Icons.calendar_today,
                label: 'Data de Nascimento',
                value: store.birthDate,
                onClear: store.clearBirthDate,
              ),
            ),
            Observer(
              builder: (_) => buildTextField(
                context,
                icon: Icons.people,
                label: 'Gênero',
                value: store.gender,
                onClear: store.clearGender,
              ),
            ),
            Observer(
              builder: (_) => buildTextField(
                context,
                icon: Icons.phone,
                label: 'Celular',
                value: store.phone,
                onClear: store.clearPhone,
              ),
            ),
            const SizedBox(height: 20),
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
    );
  }

  Widget buildTextField(BuildContext context,
      {required IconData icon, required String label, required String value, required Function onClear}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        decoration: InputDecoration(
          prefixIcon: Icon(icon),
          suffixIcon: IconButton(
            icon: const Icon(Icons.clear),
            onPressed: () => onClear(),
          ),
          labelText: label,
          border: const OutlineInputBorder(),
        ),
        controller: TextEditingController(text: value),
      ),
    );
  }
}
