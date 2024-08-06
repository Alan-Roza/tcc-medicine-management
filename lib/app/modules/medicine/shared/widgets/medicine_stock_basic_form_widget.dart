import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:tcc_medicine_management/app/modules/medicine/form/controllers/medicine_form_controller.dart';
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
              textEditingController: _formController.nameController,
              icon: Icons.health_and_safety_outlined,
              label: 'Nome do Medicamento',
            ),
          ),
           Observer(
            builder: (_) => CustomTextFieldWidget(
              textEditingController: _formController.typeController,
              icon: Icons.medical_information_outlined,
              label: 'Tipo',
            ),
          ),
           Observer(
            builder: (_) => CustomTextFieldWidget(
              textEditingController: _formController.quantityController,
              icon: Icons.tune_outlined,
              label: 'Quantidade',
            ),
          ),
           Observer(
            builder: (_) => CustomTextFieldWidget(
              textEditingController: _formController.unityController,
              icon: Icons.medication_rounded,
              label: 'Unidade',
            ),
          ),
           Observer(
            builder: (_) => CustomTextFieldWidget(
              textEditingController: _formController.qtyByPackageController,
              icon: Icons.medical_services_outlined,
              label: 'Quantidade Por Embalagem',
            ),
          ),
        ],
      ),
    );
  }
}
