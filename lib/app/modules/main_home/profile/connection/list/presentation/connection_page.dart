import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:tcc_medicine_management/app/modules/main_home/profile/connection/list/controllers/connection_controller.dart';
import 'package:tcc_medicine_management/app/shared/widgets/padded_screen.dart';

class ConnectionPage extends StatefulWidget {
  const ConnectionPage({super.key});

  @override
  State<ConnectionPage> createState() => _ConnectionPageState();
}

class _ConnectionPageState extends State<ConnectionPage> {
  late ConnectionController connectionController;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    connectionController = Provider.of<ConnectionController>(context);

    connectionController.getListConnections();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Conexão'),
        centerTitle: true,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        surfaceTintColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: PaddedScreen(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'GAVETEIROS VÍNCULADOS',
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
            ),
            const SizedBox(height: 16.0),
            Expanded(
              child: RefreshIndicator(
                onRefresh: () => connectionController.getListConnections(),
                child: Observer(
                  builder: (_) => ListView.builder(
                    itemCount: connectionController.drawerItems.length,
                    itemBuilder: (context, index) {
                      final item = connectionController.drawerItems[index];
                      return Column(
                        children: [
                          ListTile(
                            contentPadding: const EdgeInsets.symmetric(vertical: 0),
                            minVerticalPadding: 0,
                            title: Text(item, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, fontFamily: 'Roboto')),
                            // TODO: Implementar ação de remoção quando existir no servidor
                            // trailing: IconButton(
                            //   icon: const Icon(Icons.remove, color: Colors.red),
                            //   onPressed: () {
                            //     connectionController.removeItem(item);
                            //   },
                            // ),
                          ),
                          const Divider(
                            height: 0,
                            thickness: 1,
                            color: Colors.black12,
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                context.goNamed('ConnectionForm');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                minimumSize: const Size(double.infinity, 40),
                textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
              ),
              child: const Text('ADICIONAR MÓDULO'),
            ),
          ],
        ),
      ),
    );
  }
}
