import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tcc_medicine_management/app/modules/main_home/controller/main_home_controller.dart';
import 'package:tcc_medicine_management/app/modules/medicine/presentation/controllers/medicine_stock_list_controller.dart';
import 'package:tcc_medicine_management/app/modules/medicine/presentation/pages/medicine_stock_list_page.dart';

class MainHomePage extends StatelessWidget {
  final MainHomeController mainHomeController = MainHomeController();
  final MedicineStockListController store = MedicineStockListController();
  
  MainHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Adicionando medicamentos de exemplo
    store.adicionarMedicamento(Medicamento(
      tipo: 'Comprimido',
      nome: 'Gardenal',
      quantidade: 22,
      vencimento: DateTime(2023, 11, 15),
      preco: 12.99,
      importante: true,
    ));
    store.adicionarMedicamento(Medicamento(
      tipo: 'Gotas',
      nome: 'Dipirona',
      quantidade: 1,
      vencimento: DateTime(2024, 7, 29),
      preco: 15.75,
      importante: false,
    ));

    return Observer(
      builder: (_) => Scaffold(
        appBar: mainHomeController.selectedIndex == 0 ? AppBar(
          centerTitle: true,
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          surfaceTintColor: Theme.of(context).scaffoldBackgroundColor,
          title: const Text('Tela Inicial'),
          actions: [
            IconButton(icon: const Badge(child: Icon(Icons.notifications_outlined)), onPressed: () {}),
          ],
        ) : null,
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
        return _buildMedicinePage();
      case 3:
        return const Center(child: Text('Perfil Page'));
      default:
        return _buildHomePage();
    }
  }

  Widget _buildMedicinePage() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
            child: Expanded(
              flex: 3,
              child: _medicineStockListPage(),
            ),
      ),
    );
  }

   Widget _medicineStockListPage() {
    return  Column(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            color: Colors.blue[100],
            borderRadius: BorderRadius.circular(10),
          ),
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              const Text(
                'Estoque de medicamentos',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
                Stack(
                  children: [
                  Positioned(
                    top: 100,
                    child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Busque seu medicamento',
                      prefixIcon: const Icon(Icons.search),
                      suffixIcon: const Icon(Icons.filter_list),
                      border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    ),
                  ),
                  // Other stack widgets go here
                  ],
                ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        // Expanded(
        //   child: Observer(
        //     builder: (_) => ListView.builder(
        //       itemCount: store.medicamentos.length,
        //       itemBuilder: (context, index) {
        //         final medicamento = store.medicamentos[index];
        //         return Card(
        //           shape: RoundedRectangleBorder(
        //             borderRadius: BorderRadius.circular(10),
        //           ),
        //           child: Padding(
        //             padding: const EdgeInsets.all(16.0),
        //             child: Column(
        //               crossAxisAlignment: CrossAxisAlignment.start,
        //               children: <Widget>[
        //                 Row(
        //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //                   children: <Widget>[
        //                     Text(
        //                       medicamento.tipo,
        //                       style: const TextStyle(
        //                         fontSize: 16,
        //                         fontWeight: FontWeight.bold,
        //                       ),
        //                     ),
        //                     if (medicamento.importante)
        //                       Container(
        //                         padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        //                         decoration: BoxDecoration(
        //                           color: Colors.red,
        //                           borderRadius: BorderRadius.circular(8),
        //                         ),
        //                         child: const Text(
        //                           'Importante',
        //                           style: TextStyle(
        //                             color: Colors.white,
        //                             fontWeight: FontWeight.bold,
        //                           ),
        //                         ),
        //                       )
        //                     else
        //                       Container(
        //                         padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        //                         decoration: BoxDecoration(
        //                           color: Colors.blue,
        //                           borderRadius: BorderRadius.circular(8),
        //                         ),
        //                         child: const Text(
        //                           'Normal',
        //                           style: TextStyle(
        //                             color: Colors.white,
        //                             fontWeight: FontWeight.bold,
        //                           ),
        //                         ),
        //                       ),
        //                   ],
        //                 ),
        //                 const SizedBox(height: 8),
        //                 Text(
        //                   medicamento.nome,
        //                   style: const TextStyle(
        //                     fontSize: 20,
        //                     fontWeight: FontWeight.bold,
        //                   ),
        //                 ),
        //                 const SizedBox(height: 8),
        //                 Text('Quantidade: ${medicamento.quantidade} unidades'),
        //                 Text('Vencimento: ${medicamento.vencimento.day}/${medicamento.vencimento.month}/${medicamento.vencimento.year}'),
        //                 Text('Último Preço: R\$${medicamento.preco.toStringAsFixed(2)}'),
        //               ],
        //             ),
        //           ),
        //         );
        //       },
        //     ),
        //   ),
        // ),
      ],
    );
  }

// BELOW IS THE WIDGETS FOR MAIN HOME PAGE
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
    return Card(
      color: const Color(0xFFB3261E),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      elevation: 0,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            SvgPicture.asset(
            'assets/images/graphic_down.svg',
            fit: BoxFit.cover,
            height: 80,
            ),
            const SizedBox(width: 12.0),
            Expanded(
              flex: 5,
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 18.0),
                child: Column(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Existem pontos que precisam de atenção',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            height: 1.1,
                          ),
                        ),
                        Container(
                          width: 40,
                          height: 6,
                          margin: const EdgeInsets.only(top: 6.0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              color: Colors.white, // Set border color
                              width: 2, // Set border width
                            ),
                            borderRadius: BorderRadius.circular(10), // Add a border radius
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    const Text(
                      'Houve medicamentos não ingeridos, clique aqui para mais detalhes',
                      style: TextStyle(
                        color: Colors.white,
                        height: 1.1,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
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
          _buildMenuIcon(Icons.health_and_safety_outlined, 'Estoque'),
          _buildMenuIcon(Icons.calendar_month, 'Tratamentos'),
          _buildMenuIcon(Icons.wifi, 'Conexão'),
          _buildMenuIcon(Icons.language_outlined, 'Estatísticas'),
        ],
      ),
    );
  }

  Widget _buildMenuIcon(IconData icon, String label) {
    return Column(
      children: [
        Card(
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          color: Colors.white,
          child: Container(
            padding: const EdgeInsets.all(16.0),
            child: Icon(icon, size: 24),
          ),
        ),
        Text(label, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
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
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          _buildViewCard(name: 'GARDENAL', added: '12/04/2023', expires: '12/07/2024'),
          _buildViewCard(name: 'DIPIRONA', added: '08/02/2023', expires: '12/07/2024'),
          _buildViewCard(name: 'DISALINA', added: '08/02/2023', expires: '12/07/2024'),
        ],
      ),
    );
  }

  Widget _buildViewCard({required String name, required String added, required String expires}) {
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
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          _buildViewCard(name: 'SINUSITE', added: '08/02/2023', expires: '12/07/2024'),
          _buildViewCard(name: 'ALERGIA', added: '08/02/2023', expires: '12/07/2024'),
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
            Container(
                padding: const EdgeInsets.only(left: 8.0, top: 6.0),
                child: SvgPicture.asset(
                  'assets/images/help.svg',
                  fit: BoxFit.cover,
                  height: 80,
                )),
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
