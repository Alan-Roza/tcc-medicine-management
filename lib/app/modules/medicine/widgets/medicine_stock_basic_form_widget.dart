import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:tcc_medicine_management/app/modules/medicine/controllers/medicine_form_controller.dart';
import 'package:tcc_medicine_management/app/shared/widgets/custom_text_field/custom_text_field_widget.dart';

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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'DADOS BÁSICOS',
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
          Observer(
            builder: (_) => CustomTextFieldWidget(
              textEditingController: _formController.medicineNameController,
              icon: Icons.streetview_outlined,
              label: 'Medicamento',
            ),
          ),
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
