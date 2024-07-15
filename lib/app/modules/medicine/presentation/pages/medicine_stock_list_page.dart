import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:go_router/go_router.dart';
import 'package:tcc_medicine_management/app/modules/medicine/presentation/controllers/medicine_stock_list_controller.dart';

class MedicineStockListPage extends StatelessWidget {
  final MedicineStockListController store = MedicineStockListController();

  MedicineStockListPage({super.key});

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

    return Scaffold(
      appBar: AppBar(
        title: const Text('Estoque de Medicamentos'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
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
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Busque seu medicamento',
                      prefixIcon: const Icon(Icons.search),
                      suffixIcon: const Icon(Icons.filter_list),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: Observer(
                builder: (_) => ListView.builder(
                  itemCount: store.medicamentos.length,
                  itemBuilder: (context, index) {
                    final medicamento = store.medicamentos[index];
                    return Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  medicamento.tipo,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                if (medicamento.importante)
                                  Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                    decoration: BoxDecoration(
                                      color: Colors.red,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: const Text(
                                      'Importante',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  )
                                else
                                  Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                    decoration: BoxDecoration(
                                      color: Colors.blue,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: const Text(
                                      'Normal',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Text(
                              medicamento.nome,
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text('Quantidade: ${medicamento.quantidade} unidades'),
                            Text('Vencimento: ${medicamento.vencimento.day}/${medicamento.vencimento.month}/${medicamento.vencimento.year}'),
                            Text('Último Preço: R\$${medicamento.preco.toStringAsFixed(2)}'),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Ação do botão flutuante
        },
        child: const Icon(Icons.more_vert),
      ),
    );
  }
}