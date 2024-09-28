import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:tcc_medicine_management/app/modules/main_home/daily_summary/controllers/daily_summary_controller.dart';
import 'package:tcc_medicine_management/app/shared/widgets/padded_screen.dart';

class DailySummaryPage extends StatelessWidget {
  final dailySummaryController = DailySummaryController();

  DailySummaryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Informações do Dia'),
        centerTitle: true,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        surfaceTintColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: SingleChildScrollView(
        child: Observer(
          builder: (_) => PaddedScreen(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'RESUMO DIÁRIO',
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
                const SizedBox(height: 12.0),
                _buildStatusWidget('Total para ser Consumido', dailySummaryController.totalToConsume, Colors.blue),
                _buildStatusWidget('Consumidos', dailySummaryController.consumed, Colors.green),
                _buildStatusWidget('Não Consumidos', dailySummaryController.notConsumed, Colors.red),
                _buildStatusWidget('Em Curso Normal', dailySummaryController.inProgress, Colors.grey),
                const SizedBox(height: 16.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'DETALHAMENTO DIÁRIO',
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
                const SizedBox(height: 16.0),
                _buildMedicationDetails('Sinusite', [
                  Medication(name: 'Dipirona', time: '08:30h', color: Colors.red),
                  Medication(name: 'Acetilcisteína', time: '14:00h', color: Colors.green),
                ]),
                _buildMedicationDetails('Bronquite', [
                  Medication(name: 'Azitromicina', time: '19:00h', color: Colors.grey),
                ]),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildStatusWidget(String label, int count, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 12.0),
      child: Row(
        children: [
          CircleAvatar(
            radius: 10,
            backgroundColor: color,
            child:
                Text('$count', style: const TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold)),
          ),
          const SizedBox(width: 8),
          Expanded(child: Text(label.toUpperCase(), style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600))),
        ],
      ),
    );
  }

  Widget _buildMedicationDetails(String title, List<Medication> medications) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title.toUpperCase(), style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        ...medications.map((med) => ListTile(
              minTileHeight: 0,
              leading: CircleAvatar(radius: 8, backgroundColor: med.color),
              title: Text(
                med.name,
                style: const TextStyle(fontWeight: FontWeight.w500),
              ),
              subtitle: Text(med.time),
            )),
      ],
    );
  }
}

class Medication {
  final String name;
  final String time;
  final Color color;

  Medication({required this.name, required this.time, required this.color});
}
