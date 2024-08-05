import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:tcc_medicine_management/app/modules/medicine/controllers/medicine_view_controller.dart';

class MedicineStockViewPage extends StatefulWidget {
  const MedicineStockViewPage({super.key});

  @override
  State<MedicineStockViewPage> createState() => _MedicineStockViewPageState();
}

class _MedicineStockViewPageState extends State<MedicineStockViewPage> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final medicineViewController = Provider.of<MedicineViewController>(context);

    const List<Tab> myTabs = <Tab>[
       Tab(text: 'Dados Básicos'),
            Tab(text: 'Dados Complementares'),
    ];

    TabController tabController = TabController(vsync: this, length: myTabs.length);

    @override
    void initState() {
      super.initState();
      tabController = TabController(vsync: this, length: myTabs.length);
    }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Visualizar Medicamento'),
        bottom: TabBar(
          controller: tabController,
          onTap: (index) {
            medicineViewController.setSelectedIndex(index);
          },
          tabs: myTabs
        ),
      ),
      body: Observer(
        builder: (_) {
          return IndexedStack(
            index: medicineViewController.selectedIndex,
            children: const [
              DadosBasicosTab(),
              DadosComplementaresTab(),
            ],
          );
        },
      ),
    );
  }
}

class DadosBasicosTab extends StatelessWidget {
  const DadosBasicosTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Dados Básicos'),
    );
  }
}

class DadosComplementaresTab extends StatelessWidget {
  const DadosComplementaresTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Dados Complementares'),
    );
  }
}