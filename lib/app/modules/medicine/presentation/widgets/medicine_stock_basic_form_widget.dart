import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:tcc_medicine_management/app/modules/medicine/presentation/controllers/medicine_form_controller.dart';

class MedicineStockBasicFormWidget extends StatefulWidget {
  const MedicineStockBasicFormWidget({super.key});

  @override
  MedicineStockBasicFormWidgetState createState() => MedicineStockBasicFormWidgetState();
}

class MedicineStockBasicFormWidgetState extends State<MedicineStockBasicFormWidget>
    with SingleTickerProviderStateMixin {
  final MedicineFormController _formController = MedicineFormController();

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          Observer(builder: (_) {
            return TextFormField(
              decoration: const InputDecoration(labelText: 'Name'),
              onChanged: _formController.setName,
            );
          }),
          Observer(builder: (_) {
            return TextFormField(
              decoration: const InputDecoration(labelText: 'Type'),
              onChanged: _formController.setType,
            );
          }),
          Observer(builder: (_) {
            return TextFormField(
              decoration: const InputDecoration(labelText: 'Quantity'),
              onChanged: _formController.setQuantity,
            );
          }),
          Observer(builder: (_) {
            return TextFormField(
              decoration: const InputDecoration(labelText: 'Unity'),
              onChanged: _formController.setUnity,
            );
          }),
          Observer(builder: (_) {
            return TextFormField(
              decoration: const InputDecoration(labelText: 'Qty by package'),
              onChanged: _formController.setQtyByPackage,
            );
          }),
        ],
      ),
    );
  }
}