import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MedicineStockFormPage extends StatefulWidget {
  const MedicineStockFormPage({super.key});

  @override
  _MedicineStockFormPageState createState() => _MedicineStockFormPageState();
}

class _MedicineStockFormPageState extends State<MedicineStockFormPage> with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MedicineStockListPage'),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'Basic data'),
            Tab(text: 'Optional data'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildBasicDataForm(),
          _buildOptionalDataForm(),
        ],
      ),
    );
  }

  Widget _buildBasicDataForm() {
    return Form(
      child: Column(
        children: [
          TextFormField(
            decoration: const InputDecoration(labelText: 'Name'),
          ),
          TextFormField(
            decoration: const InputDecoration(labelText: 'Type'),
          ),
          TextFormField(
            decoration: const InputDecoration(labelText: 'Quantity'),
          ),
          TextFormField(
            decoration: const InputDecoration(labelText: 'Unity'),
          ),
          TextFormField(
            decoration: const InputDecoration(labelText: 'Qty by package'),
          ),
        ],
      ),
    );
  }

  Widget _buildOptionalDataForm() {
    return Form(
      child: Column(
        children: [
          TextFormField(
            decoration: const InputDecoration(labelText: 'Expiration date'),
          ),
          TextFormField(
            decoration: const InputDecoration(labelText: 'Number'),
          ),
          TextFormField(
            decoration: const InputDecoration(labelText: 'Total paid'),
          ),
        ],
      ),
    );
  }
}