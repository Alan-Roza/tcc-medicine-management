import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MedicineStockListPage extends StatelessWidget {
  const MedicineStockListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('MedicineStockListPage')),
      body: Center(
        child: ElevatedButton(
          onPressed: () => context.go('/medicine-stock-form'),
          child: const Text('Go to the Unauth Route'),
        ),
      ),
    );
  }
}