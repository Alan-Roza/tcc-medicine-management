import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:tcc_medicine_management/app/modules/medicine/form/controllers/medicine_form_controller.dart';
import 'package:tcc_medicine_management/app/shared/widgets/custom_text_field/custom_text_field_widget.dart';
import 'package:tcc_medicine_management/app/shared/widgets/profile_picture_widget/presentation/profile_picture_widget.dart';

class MedicineStockOptionalFormWidget extends StatefulWidget {
  final bool? readOnly;

  const MedicineStockOptionalFormWidget({super.key, this.readOnly});

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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'DADOS COMPLEMENTARES',
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
              textEditingController: _formController.expirationDateController,
              icon: Icons.calendar_month_outlined,
              label: 'Data de Validade',
            ),
          ),
          Observer(
            builder: (_) => CustomTextFieldWidget(
              textEditingController: _formController.valuePaidController,
              icon: Icons.attach_money,
              label: 'Valor Total Pago',
            ),
          ),
          Observer(
            builder: (_) => CustomTextFieldWidget(
              textEditingController: _formController.importanceLevelController,
              icon: Icons.star_outline,
              label: 'Nível de Importância',
            ),
          ),
          const SizedBox(height: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'MÓDULO GAVETEIRO',
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
              textEditingController: _formController.drawerNumberController,
              icon: Icons.medication_rounded,
              label: 'Número da Gaveta',
            ),
          ),
          const SizedBox(height: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'IMAGEM DO MEDICAMENTO',
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
          const SizedBox(height: 20),
          widget.readOnly != null && widget.readOnly == true
              ? Observer(
                  builder: (_) => Row(
                    children: [
                      Image.asset(
                        'assets/images/generic_medicine.png',
                        fit: BoxFit.cover,
                        width: 80,
                      ),
                      const SizedBox(width: 20),
                      const Flexible(
                        child: Text(
                          'Imagem utilizada para identificação (opcional)',
                          style: TextStyle(fontSize: 14),
                        ),
                      ),
                    ],
                  ),
                )
              : Observer(
                  builder: (_) => const Row(
                    children: [
                      ProfilePictureWidget(),
                      SizedBox(width: 20),
                      Flexible(
                        child: Text(
                          'Adicione uma foto da embalagem para identificação (opcional)',
                          style: TextStyle(fontSize: 14),
                        ),
                      ),
                    ],
                  ),
                ),
        ],
      ),
    );
  }
}
