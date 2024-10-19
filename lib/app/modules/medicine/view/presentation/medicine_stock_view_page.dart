import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:tcc_medicine_management/app/modules/medicine/form/controllers/medicine_form_controller.dart';
import 'package:tcc_medicine_management/app/modules/medicine/view/controllers/medicine_view_controller.dart';
import 'package:tcc_medicine_management/app/modules/medicine/shared/widgets/medicine_stock_basic_form_widget.dart';
import 'package:tcc_medicine_management/app/modules/medicine/shared/widgets/medicine_stock_optional_form_widget.dart';
import 'package:tcc_medicine_management/app/modules/medicine/view/model/dto/medicine_view_response_dto.dart';

class MedicineStockViewPage extends StatefulWidget {
  bool? readOnly;
  String medicineId;

  MedicineStockViewPage({super.key, required this.medicineId, this.readOnly});

  @override
  State<MedicineStockViewPage> createState() => _MedicineStockViewPageState();
}

class _MedicineStockViewPageState extends State<MedicineStockViewPage> with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    // Ensuring the widget tree is built before accessing the context
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final medicineViewController = Provider.of<MedicineViewController>(context, listen: false);
      final MedicineFormController formController = Provider.of<MedicineFormController>(context, listen: false);

      medicineViewController.reset();
      formController.resetForm();

      // Assuming getByIdMedicine takes a String argument for the medicine ID
      MedicineViewResponseDto dataResponse = await medicineViewController.getByIdMedicine(int.parse(widget.medicineId));

      formController.nameController.text = dataResponse.name!;
      //  formController.typeController.text = dataResponse.type!;
       formController.quantityController.text = dataResponse.storageQuantity!.toString();
      //  formController.unityController.text = dataResponse.unity!;
      //  formController.qtyByPackageController.text = dataResponse.qtyByPackage!;
      //  formController.importanceLevel = dataResponse.importance!;
      //  formController.valuePaidController.text = dataResponse.price!;
       formController.expirationDateController.text =  dataResponse.expirationDate!;
       formController.drawerNumberController.text =  dataResponse.drawerNumber!.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    final medicineViewController = Provider.of<MedicineViewController>(context);

    const List<Tab> medicineViewTabs = <Tab>[
      Tab(text: 'Dados Básicos'),
      Tab(text: 'Dados Complementares'),
    ];

    TabController tabController = TabController(vsync: this, length: medicineViewTabs.length);

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
        title: const Text('Visualizar Medicamento', style: TextStyle(color: Colors.white)),
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
            medicineViewController.setSelectedIndex(index);
          },
          tabs: medicineViewTabs,
        ),
      ),
      body: Observer(
        builder: (_) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
            child: IndexedStack(
              index: medicineViewController.selectedIndex,
              children: [
                MedicineStockBasicFormWidget(readOnly: widget.readOnly ?? true),
                MedicineStockOptionalFormWidget(readOnly: widget.readOnly ?? true),
              ],
            ),
          );
        },
      ),
    );
  }
}
