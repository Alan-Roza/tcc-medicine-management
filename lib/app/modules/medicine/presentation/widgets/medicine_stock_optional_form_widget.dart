import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:tcc_medicine_management/app/modules/medicine/presentation/controllers/medicine_form_controller.dart';

class MedicineStockOptionalFormWidget extends StatefulWidget {
  const MedicineStockOptionalFormWidget({super.key});

  @override
  MedicineStockOptionalFormWidgetState createState() => MedicineStockOptionalFormWidgetState();
}

class MedicineStockOptionalFormWidgetState extends State<MedicineStockOptionalFormWidget>
    with SingleTickerProviderStateMixin {
  final MedicineFormController _formController = MedicineFormController();

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          Observer(builder: (_) {
            return TextFormField(
              decoration: const InputDecoration(labelText: 'Expiration date'),
              onChanged: _formController.setExpirationDate,
            );
          }),
          Observer(builder: (_) {
            return TextFormField(
              decoration: const InputDecoration(labelText: 'Number'),
              onChanged: _formController.setNumber,
            );
          }),
          Observer(builder: (_) {
            return TextFormField(
              decoration: const InputDecoration(labelText: 'Total paid'),
              onChanged: _formController.setTotalPaid,
            );
          }),
        ],
      ),
    );
  }
}