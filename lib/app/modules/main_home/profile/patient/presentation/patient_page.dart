import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:tcc_medicine_management/app/core/routes/app_routes.dart';
import 'package:tcc_medicine_management/app/modules/main_home/profile/patient/controllers/patient_controller.dart';
import 'package:tcc_medicine_management/app/modules/main_home/profile/shared/patient_card_widget/presentation/patient_card_widget.dart';
import 'package:tcc_medicine_management/app/shared/widgets/padded_screen.dart';

class PatientPage extends StatefulWidget {
  const PatientPage({super.key});

  @override
  State<PatientPage> createState() => _PatientPageState();
}

class _PatientPageState extends State<PatientPage> {
  late PatientController patientController;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      patientController = Provider.of<PatientController>(context, listen: false);

      patientController.clearPatientCards();

      await patientController.getPatientList();
    });
  }

  Future<void> refreshPatientListData() async {
    patientController.clearPatientCards();
    await patientController.getPatientList();
  }

  @override
  Widget build(BuildContext context) {
    PatientController patientController = Provider.of<PatientController>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pacientes'),
        centerTitle: true,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        surfaceTintColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: RefreshIndicator(
        onRefresh: refreshPatientListData,
        child: PaddedScreen(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'ACESSAR PACIENTES',
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
                child: Observer(
                  builder: (_) {
                    if (patientController.patientCards.isEmpty) {
                      return const Center(
                        child: Text(
                          'Nenhum dado encontrado',
                          style: TextStyle(fontSize: 18, color: Colors.grey),
                        ),
                      );
                    } else {
                      return ListView.builder(
                        padding: const EdgeInsets.only(bottom: 50.0),
                        itemCount: patientController.patientCards.length,
                        itemBuilder: (context, index) {
                          final item = patientController.patientCards[index];
                          return PatientCardWidget(
                            key: Key(item.hashCode.toString()),
                            patientCard: item,
                          );
                        },
                      );
                    }
                  },
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  context.goNamed("PatientGenerateCode");
                  // patientController.addItem(['Gaveteiro 1', 'Gaveteiro 2', 'Gaveteiro 3']);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  minimumSize: const Size(double.infinity, 40),
                  textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
                ),
                child: const Text('ADICIONAR PACIENTE'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
