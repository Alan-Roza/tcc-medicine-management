import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:tcc_medicine_management/app/modules/treatment/form/controllers/treatment_form_controller.dart';
import 'package:tcc_medicine_management/app/modules/treatment/form/model/dto/treatment_medicine_dto.dart';
import 'package:tcc_medicine_management/app/modules/treatment/shared/widgets/treatment_basic_form_widget.dart';
import 'package:tcc_medicine_management/app/modules/treatment/shared/widgets/treatment_medicine_form_widget.dart';
import 'package:tcc_medicine_management/app/modules/treatment/view/controllers/treatment_view_controller.dart';
import 'package:tcc_medicine_management/app/modules/treatment/view/model/dto/treatment_view_response_dto.dart';
import 'package:tcc_medicine_management/app/modules/medicine/form/controllers/medicine_form_controller.dart';
import 'dart:math';

class TreatmentViewPage extends StatefulWidget {
  bool? readOnly;
  String treatmentId;

  TreatmentViewPage({super.key, required this.treatmentId, this.readOnly});

  @override
  State<TreatmentViewPage> createState() => _TreatmentViewPageState();
}

class _TreatmentViewPageState extends State<TreatmentViewPage> with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    // Ensuring the widget tree is built before accessing the context
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final treatmentViewController = Provider.of<TreatmentViewController>(context, listen: false);
      final TreatmentFormController formController = Provider.of<TreatmentFormController>(context, listen: false);

      treatmentViewController.reset();
      formController.resetForm();

      TreatmentViewResponseDto dataResponse =
          await treatmentViewController.getByTreatmentId(int.parse(widget.treatmentId));

// Preenche os valores de nome e nível de importância do tratamento
      formController.nameController.text = dataResponse.treatment?.name ?? '';
      formController.importanceLevel = (dataResponse.treatment?.importance ?? '').toString().importanceLevel;

// Limpa os medicamentos selecionados antes de carregar novos dados
      formController.selectedMedicines.clear();

// Itera sobre a lista de medicamentos na resposta
      for (int i = 0; i < (dataResponse.medicines?.length ?? 0); i++) {
        final treatmentMedicine = Medicine(
          medicineId: dataResponse.medicines?[i].medicineId ?? Random().nextInt(100000),
          name: (dataResponse.medicines?[i].medicine ?? 'Desconhecido').toString(),
          dosage: dataResponse.medicines?[i].dosage,
          frequency: dataResponse.medicines?[i].frequency,
          treatmentInit: dataResponse.medicines?[i].treatmentInit,
          treatmentEnd: dataResponse.medicines?[i].treatmentEnd,
        );

        // Adiciona o medicamento à lista de medicamentos selecionados
        formController.selectedMedicines.add(treatmentMedicine);

        formController.setSelectedFrequency(treatmentMedicine.medicineId!, treatmentMedicine.frequency);

        // Inicializa controladores para os campos associados a esse medicamento
        formController.frequencyControllers[treatmentMedicine.medicineId!] = TextEditingController(
          text: treatmentMedicine.frequency?.toString() ?? '',
        );
        formController.quantityControllers[treatmentMedicine.medicineId!] = TextEditingController(
          text: treatmentMedicine.dosage?.toString() ?? '',
        );
        formController.medicineNameControllers[treatmentMedicine.medicineId!] = TextEditingController(
          text: treatmentMedicine.name,
        );
        formController.startDateControllers[treatmentMedicine.medicineId!] = TextEditingController(
          text: treatmentMedicine.treatmentInit ?? '',
        );
        formController.endDateControllers[treatmentMedicine.medicineId!] = TextEditingController(
          text: treatmentMedicine.treatmentEnd ?? '',
        );

        formController.startDateDisplayControllers[treatmentMedicine.medicineId!] = TextEditingController(
          text: treatmentMedicine.treatmentInit ?? '',
        );

        formController.endDateDisplayControllers[treatmentMedicine.medicineId!] = TextEditingController(
          text: treatmentMedicine.treatmentEnd ?? '',
        );

        // Formatação para exibição de data
        if (treatmentMedicine.treatmentInit != null) {
          formController.convertStartDate(treatmentMedicine.treatmentInit!, treatmentMedicine.medicineId!);
        }
        if (treatmentMedicine.treatmentEnd != null) {
          formController.convertEndDate(treatmentMedicine.treatmentEnd!, treatmentMedicine.medicineId!);
        }

        // Define o tratamento infinito por medicamento, caso necessário
        bool isEndless = treatmentMedicine.treatmentEnd == null;
        formController.endlessTreatments[treatmentMedicine.medicineId!] = isEndless;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final treatmentViewController = Provider.of<TreatmentViewController>(context);

    const List<Tab> treatmentViewTabs = <Tab>[
      Tab(text: 'Dados Básicos'),
      Tab(text: 'Medicamentos'),
    ];

    TabController tabController = TabController(vsync: this, length: treatmentViewTabs.length);

    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          systemNavigationBarColor: Colors.white,
          statusBarIconBrightness: Brightness.light,
          statusBarBrightness: Brightness.light,
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios), // Change the icon here
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        foregroundColor: Colors.white,
        title: const Text('Visualizar Tratamento', style: TextStyle(color: Colors.white)),
        actions: [
          IconButton(icon: const Badge(child: Icon(Icons.notifications_outlined)), onPressed: () {}),
        ],
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
        surfaceTintColor: Theme.of(context).primaryColor,
        bottom: TabBar(
          indicatorColor: Colors.white,
          labelColor: Colors.white,
          indicator: const BoxDecoration(border: Border(bottom: BorderSide(color: Colors.white, width: 3))),
          unselectedLabelColor: Colors.blue[100],
          indicatorSize: TabBarIndicatorSize.tab,
          // labelColor: Colors.white,
          controller: tabController,
          onTap: (index) {
            treatmentViewController.setSelectedIndex(index);
          },
          tabs: treatmentViewTabs,
        ),
      ),
      body: Observer(
        builder: (_) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
            child: SingleChildScrollView(
              child: IndexedStack(
                index: treatmentViewController.selectedIndex,
                children: [
                  TreatmentBasicFormWidget(readOnly: widget.readOnly ?? true),
                  TreatmentMedicineFormWidget(readOnly: widget.readOnly ?? true),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
