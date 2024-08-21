import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:tcc_medicine_management/app/modules/medicine/form/controllers/medicine_form_controller.dart';
import 'package:tcc_medicine_management/app/shared/widgets/custom_text_field/custom_text_field_widget.dart';

class MedicineStockBasicFormWidget extends StatefulWidget {
  final bool readOnly;

  const MedicineStockBasicFormWidget({super.key, this.readOnly = false});

  @override
  MedicineStockBasicFormWidgetState createState() => MedicineStockBasicFormWidgetState();
}

class MedicineStockBasicFormWidgetState extends State<MedicineStockBasicFormWidget>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final MedicineFormController formController = Provider.of<MedicineFormController>(context);

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
              textEditingController: formController.nameController,
              icon: Icons.health_and_safety_outlined,
              label: 'Nome do Medicamento',
              readOnly: widget.readOnly,
            ),
          ),
          Observer(
            builder: (_) => CustomTextFieldWidget(
              textEditingController: formController.typeController,
              icon: Icons.medical_information_outlined,
              label: 'Tipo',
              readOnly: widget.readOnly,
            ),
          ),
          Observer(
            builder: (_) => CustomTextFieldWidget(
              textEditingController: formController.quantityController,
              icon: Icons.tune_outlined,
              label: 'Quantidade',
              readOnly: widget.readOnly,
            ),
          ),
          Observer(
            builder: (_) => CustomTextFieldWidget(
              textEditingController: formController.unityController,
              icon: Icons.medication_rounded,
              label: 'Unidade',
              readOnly: widget.readOnly,
            ),
          ),
          Observer(
            builder: (_) => CustomTextFieldWidget(
              textEditingController: formController.qtyByPackageController,
              icon: Icons.medical_services_outlined,
              label: 'Quantidade Por Embalagem',
              readOnly: widget.readOnly,
            ),
          ),
        ],
      ),
    );
  }
}
