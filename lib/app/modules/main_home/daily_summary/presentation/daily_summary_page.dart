import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:tcc_medicine_management/app/modules/main_home/daily_summary/controllers/daily_summary_controller.dart';
import 'package:tcc_medicine_management/app/shared/widgets/padded_screen.dart';

class DailySummaryPage extends StatefulWidget {
  const DailySummaryPage({super.key});

  @override
  State<DailySummaryPage> createState() => _DailySummaryPageState();
}

class _DailySummaryPageState extends State<DailySummaryPage> {
  final dailySummaryController = DailySummaryController();

  @override
  void initState() {
    super.initState();
    dailySummaryController.getResumeDaily();
  }

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
                dailySummaryController.treatmentDetails.isEmpty
                    ? const Center(
                        child: Padding(
                          padding: EdgeInsets.only(top: 30),
                          child: Text(
                            'Sem informações',
                            style: TextStyle(fontSize: 22, fontWeight: FontWeight.w100),
                          ),
                        ),
                      )
                    : Column(
                        children: dailySummaryController.treatmentDetails.map((treatment) {
                          return _buildMedicationDetails(
                            treatment.name!,
                            treatment.medicines!.map((med) {
                              Color color;
                              switch (med.status) {
                                case 'Consumed':
                                  color = Colors.green;
                                  break;
                                case 'Delayed':
                                  color = Colors.red;
                                  break;
                                case 'Normal':
                                  color = Colors.grey;
                                  break;
                                default:
                                  color = Colors.blue;
                              }
                              return Medication(name: med.name!, color: color);
                            }).toList(),
                          );
                        }).toList(),
                      )
                // _buildMedicationDetails('Sinusite', [
                //   Medication(name: 'Dipirona', time: '08:30h', color: Colors.red),
                //   Medication(name: 'Acetilcisteína', time: '14:00h', color: Colors.green),
                // ]),
                // _buildMedicationDetails('Bronquite', [
                //   Medication(name: 'Azitromicina', time: '19:00h', color: Colors.grey),
                // ]),
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
        Row(
          children: [
            Text(title.toUpperCase(), style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            Text(' (Tratamento)', style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w300)),
          ],
        ),
        ...medications.map((med) => ListTile(
              minTileHeight: 0,
              leading: CircleAvatar(radius: 8, backgroundColor: med.color),
              title: Text(
                med.name,
                style: const TextStyle(fontWeight: FontWeight.w500),
              ),
              // subtitle: Text(med.time), TODO: Removido para simplificar
            )),
      ],
    );
  }
}

class Medication {
  final String name;
  final Color color;
  final String? time;

  Medication({required this.name, required this.color, this.time});
}
