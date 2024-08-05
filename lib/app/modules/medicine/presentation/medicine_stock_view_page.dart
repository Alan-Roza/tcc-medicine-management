import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:tcc_medicine_management/app/modules/medicine/controllers/medicine_view_controller.dart';
import 'package:tcc_medicine_management/app/modules/medicine/widgets/medicine_stock_basic_form_widget.dart';
import 'package:tcc_medicine_management/app/modules/medicine/widgets/medicine_stock_optional_form_widget.dart';

class MedicineStockViewPage extends StatefulWidget {
  const MedicineStockViewPage({super.key});

  @override
  State<MedicineStockViewPage> createState() => _MedicineStockViewPageState();
}

class _MedicineStockViewPageState extends State<MedicineStockViewPage> with TickerProviderStateMixin {
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
              children: const [
                MedicineStockBasicFormWidget(),
                MedicineStockOptionalFormWidget(),
              ],
            ),
          );
        },
      ),
    );
  }
}
