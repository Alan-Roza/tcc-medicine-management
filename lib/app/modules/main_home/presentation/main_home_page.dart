import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tcc_medicine_management/app/modules/main_home/controller/main_home_controller.dart';

class MainHomePage extends StatelessWidget {
  final MainHomeController mainHomeController = MainHomeController();

  MainHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => Scaffold(
        appBar: AppBar(
          centerTitle: true,
          surfaceTintColor: Colors.white,
          title: const Text('Tela Inicial'),
          actions: [
            IconButton(icon: const Badge(child: Icon(Icons.notifications_outlined)), onPressed: () {}),
          ],
        ),
        drawer: Drawer(
          child: ListView(
            children: [
              ListTile(
                leading: const Icon(Icons.home),
                title: const Text('Início'),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.calendar_today),
                title: const Text('Tratamento'),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.medical_services),
                title: const Text('Medicamentos'),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.person),
                title: const Text('Perfil'),
                onTap: () {},
              ),
            ],
          ),
        ),
        body: _buildBody(mainHomeController.selectedIndex),
        bottomNavigationBar: BottomNavigationBar(
          elevation: 0,
          type: BottomNavigationBarType.fixed,
          unselectedItemColor: Colors.grey.shade700,
          selectedItemColor: Colors.blue,
          showUnselectedLabels: true,
          currentIndex: mainHomeController.selectedIndex,
          onTap: (index) => mainHomeController.setSelectedIndex(index),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Início',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.calendar_month),
              label: 'Tratamento',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.health_and_safety_outlined),
              label: 'Medicamentos',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Perfil',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBody(int index) {
    switch (index) {
      case 0:
        return _buildHomePage();
      case 1:
        return const Center(child: Text('Tratamento Page'));
      case 2:
        return const Center(child: Text('Medicamentos Page'));
      case 3:
        return const Center(child: Text('Perfil Page'));
      default:
        return _buildHomePage();
    }
  }

  Widget _buildHomePage() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            _buildAlertCard(),
            _buildMenuRow(),
            _buildSectionHeader('MEDICAMENTOS', 'Mais Usados'),
            _buildMedicineRow(),
            _buildDrawerUsageWidget(),
            _buildSectionHeader('TRATAMENTOS', 'Mais Importantes'),
            _buildTreatmentRow(),
            _buildHelpSection(),
            const SizedBox(height: 16.0),
          ],
        ),
      ),
    );
  }

  Widget _buildAlertCard() {
    return const Card(
      color: Colors.red,
      child: ListTile(
        leading: Icon(Icons.warning, color: Colors.white),
        title: Text(
          'Existem pontos que precisam de atenção',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          'Houve medicamentos não ingeridos, clique aqui para mais detalhes',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  Widget _buildMenuRow() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildMenuIcon(Icons.inventory, 'Estoque'),
          _buildMenuIcon(Icons.local_hospital, 'Tratamentos'),
          _buildMenuIcon(Icons.wifi, 'Conexão'),
          _buildMenuIcon(Icons.bar_chart, 'Estatísticas'),
        ],
      ),
    );
  }

  Widget _buildMenuIcon(IconData icon, String label) {
    return Column(
      children: [
        Icon(icon, size: 40),
        Text(label),
      ],
    );
  }

  Widget _buildSectionHeader(String title, String action) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          TextButton(onPressed: () {}, child: Text(action)),
        ],
      ),
    );
  }

  Widget _buildMedicineRow() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          _buildViewCard('GARDENAL', '12/04/2023', '12/07/2024'),
          _buildViewCard('DIPIRONA', '08/02/2023', '12/07/2024'),
          _buildViewCard('DISALINA', '08/02/2023', '12/07/2024'),
        ],
      ),
    );
  }

  Widget _buildViewCard(String name, String added, String expires) {
    return Card(
      color: Colors.grey.shade900,
      margin: const EdgeInsets.all(8.0),
      child: Container(
        width: 150,
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/images/generic_medicine.png'),
                // SvgPicture.asset('assets/images/generic_medicine.svg')
                // Icon(Icons.medical_services, size: 40),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Text(name, style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
            const SizedBox(
              height: 5,
            ),
            RichText(
                text: TextSpan(children: [
              const TextSpan(
                  text: 'Adicionado em: ',
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.w200, fontSize: 10)),
              TextSpan(
                  text: added, style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 10)),
            ])),
            const SizedBox(
              height: 2,
            ),
            RichText(
                text: TextSpan(children: [
              const TextSpan(
                  text: 'Vence em: ', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w200, fontSize: 10)),
              TextSpan(
                  text: expires,
                  style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 10)),
            ])),
          ],
        ),
      ),
    );
  }

  Widget _buildDrawerUsageWidget() {
    return const Card(
      child: ListTile(
        title: Text('Uso do Widget'),
        subtitle: Column(
          children: [
            Text('Gavetas Ocupadas: 54%'),
            Text('Gavetas Livres: 37%'),
            Text('Gavetas Ociosas: 8%'),
          ],
        ),
        trailing: SizedBox(
          width: 50,
          height: 50,
          child: CircularProgressIndicator(
            value: 0.54,
            backgroundColor: Colors.grey,
            valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
          ),
        ),
      ),
    );
  }

  Widget _buildTreatmentRow() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          _buildViewCard('SINUSITE', '08/02/2023', '12/07/2024'),
          _buildViewCard('ALERGIA', '08/02/2023', '12/07/2024'),
        ],
      ),
    );
  }

  Widget _buildHelpSection() {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      elevation: 0,
      child: Container(
        padding: const EdgeInsets.only(right: 8.0),
        child: Row(
          children: [
            const SizedBox(width: 12.0),
            Container(padding: const EdgeInsets.only(left: 8.0, top: 6.0), child: SvgPicture.asset('assets/images/help.svg', fit: BoxFit.cover, height: 80,)),
            
            const Expanded(
              flex: 5,
              child: Text(
                'PRECISA DE AJUDA?',
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Expanded(
              flex: 1,
              child: Icon(
                Icons.arrow_forward,
                color: Colors.blue,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
