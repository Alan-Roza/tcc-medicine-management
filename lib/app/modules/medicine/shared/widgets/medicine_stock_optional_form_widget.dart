import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:tcc_medicine_management/app/modules/medicine/form/controllers/medicine_form_controller.dart';
import 'package:tcc_medicine_management/app/shared/constants/constants.dart';
import 'package:tcc_medicine_management/app/shared/controllers/user/user_controller.dart';
import 'package:tcc_medicine_management/app/shared/widgets/profile_picture_widget/controller/profile_picture_controller.dart';
import 'package:tcc_medicine_management/app/shared/widgets/profile_picture_widget/presentation/profile_picture_widget.dart';

class MedicineStockOptionalFormWidget extends StatefulWidget {
  final bool readOnly;

  const MedicineStockOptionalFormWidget({super.key, this.readOnly = false});

  @override
  MedicineStockOptionalFormWidgetState createState() => MedicineStockOptionalFormWidgetState();
}

class MedicineStockOptionalFormWidgetState extends State<MedicineStockOptionalFormWidget>
    with SingleTickerProviderStateMixin {
  late MedicineFormController formController;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final MedicineFormController formController = Provider.of<MedicineFormController>(context);

    formController.getDrawersResource();
  }

  @override
  Widget build(BuildContext context) {
    final MedicineFormController formController = Provider.of<MedicineFormController>(context);
    final ProfilePictureController profilePictureController = Provider.of<ProfilePictureController>(context);
    final UserController userController = Provider.of<UserController>(context);

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
          const SizedBox(height: 20),
          Observer(
            builder: (_) => TextFormField(
              enabled: !widget.readOnly,
              readOnly: true, // Makes the field not editable; only selectable
              controller: formController.expirationDateController,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.calendar_month_rounded),
                labelText: 'Data de Validade',
              ),
              onTap: () async {
                DateTime? pickedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(DateTime.now().year),
                  lastDate: DateTime(DateTime.now().year + 2),
                );
                if (pickedDate != null) {
                  // Update the text field with the selected date
                  formController.setExpirationDate(pickedDate); // Update your controller/state management solution
                }
              },
            ),
          ),
          Observer(
            builder: (_) => CustomTextFieldWidget(
              textEditingController: formController.valuePaidController,
              icon: Icons.attach_money,
              label: 'Valor Total Pago',
              enabled: !widget.readOnly,
              readOnly: widget.readOnly,
            ),
          ),
          Observer(
            builder: (_) => DropdownButtonFormField<ImportanceLevel>(
              value: formController.importanceLevel,
              onChanged: widget.readOnly
                  ? null
                  : (value) {
                      if (value != null) formController.importanceLevel = value;
                    },
              items: const [
                DropdownMenuItem(
                  value: ImportanceLevel.nenhuma,
                  child: Text('Nenhuma'),
                ),
                DropdownMenuItem(
                  value: ImportanceLevel.baixa,
                  child: Text('Baixa'),
                ),
                DropdownMenuItem(
                  value: ImportanceLevel.media,
                  child: Text('Média'),
                ),
                DropdownMenuItem(
                  value: ImportanceLevel.alta,
                  child: Text('Alta'),
                ),
                DropdownMenuItem(
                  value: ImportanceLevel.critica,
                  child: Text('Crítica'),
                ),
              ],
              decoration: const InputDecoration(
                labelText: 'Nível de Importância',
                border: UnderlineInputBorder(),
                prefixIcon: Icon(Icons.warning_amber),
              ),
            ),
          ),
          formController.drawers.isEmpty || (widget.readOnly && formController.hardwareIdController.text.isEmpty)
              ? const SizedBox()
              : const SizedBox(height: 20),
          formController.drawers.isEmpty || (widget.readOnly && formController.hardwareIdController.text.isEmpty)
              ? const SizedBox()
              : Column(
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
          formController.drawers.isEmpty || (widget.readOnly && formController.hardwareIdController.text.isEmpty)
              ? const SizedBox()
              : widget.readOnly
                  ? Observer(
                      builder: (_) => CustomTextFieldWidget(
                        textEditingController: formController.hardwareIdController,
                        icon: Icons.account_box,
                        label: 'Identificação do Gaveteiro',
                        readOnly: widget.readOnly,
                        enabled: !widget.readOnly,
                      ),
                    )
                  : Observer(
                      builder: (_) => DropdownButtonFormField<dynamic>(
                        value: formController.hardwareIdController.text,
                        onChanged: (value) {
                          if (value != null && value.isNotEmpty) {
                            formController.hardwareIdController.text = value['id'] ?? '';
                            formController.drawerNumber = int.parse(value['drawerNumber'] ?? 0);
                          }
                        },
                        items: [
                          const DropdownMenuItem(
                            value: '',
                            child: Text('Selecione um gaveteiro'),
                          ),
                          ...formController.drawers.map((drawer) {
                            // Ajustar para que os itens venham do servidor
                            return DropdownMenuItem(
                              value: drawer,
                              child: Text(drawer['name'] ?? ''),
                            );
                          }),
                        ],
                        decoration: const InputDecoration(
                          labelText: 'Identificação do Gaveteiro',
                          border: UnderlineInputBorder(),
                          prefixIcon: Icon(Icons.medical_services),
                        ),
                      ),
                    ),
          formController.drawers.isEmpty ||
                  (widget.readOnly &&
                      (formController.drawerNumberController.text.isEmpty ||
                          formController.drawerNumberController.text == '0'))
              ? const SizedBox()
              : widget.readOnly
                  ? const SizedBox()
                  : const SizedBox(height: 16),
          formController.drawers.isEmpty ||
                  (widget.readOnly &&
                      (formController.drawerNumberController.text.isEmpty ||
                          formController.drawerNumberController.text == '0'))
              ? const SizedBox()
              : widget.readOnly
                  ? Observer(
                      builder: (_) => CustomTextFieldWidget(
                        textEditingController: formController.drawerNumberController,
                        icon: Icons.medication_rounded,
                        label: 'Número da Gaveta',
                        readOnly: widget.readOnly,
                        enabled: !widget.readOnly,
                      ),
                    )
                  : Observer(
                      builder: (_) => DropdownButtonFormField<dynamic>(
                        value: formController.drawerNumberController.text,
                        onChanged: widget.readOnly
                            ? null
                            : (value) {
                                if (value != null && value.isNotEmpty) {
                                  formController.hardwareIdController.text = value['id'] ?? '';
                                  formController.drawerNumber = int.parse(value['drawerNumber'] ?? 0);
                                }
                              },
                        items: [
                          const DropdownMenuItem(
                            value: '',
                            child: Text('Selecione a Gaveta'),
                          ),
                          ...List.generate(formController.drawerNumber, (index) => index + 1).map((drawerNumber) {
                            return DropdownMenuItem(
                              value: drawerNumber.toString(),
                              child: Text(drawerNumber.toString()),
                            );
                          }),
                        ],
                        decoration: const InputDecoration(
                          labelText: 'Número da Gaveta',
                          border: UnderlineInputBorder(),
                          prefixIcon: Icon(Icons.medication_rounded),
                        ),
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
          profilePictureController.image == null && widget.readOnly
              ? Observer(
                  builder: (_) => Row(
                    children: [
                      if (formController.medicineImageUrl != null && formController.medicineImageUrl!.isNotEmpty)
                        Image.network(
                          Constants.baseUrl + formController.medicineImageUrl!,
                          fit: BoxFit.cover,
                          width: 80,
                          headers: {
                            'Authorization': 'Bearer ${userController.token}',
                          },
                        ),
                      if (formController.medicineImageUrl == null || formController.medicineImageUrl!.isEmpty)
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

class CustomNumberFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    final String newText = newValue.text;

    // Regex que permite dígitos e até duas casas decimais separadas por vírgula
    final RegExp regex = RegExp(r'^\d+,\d{0,2}$|^\d*$');

    if (regex.hasMatch(newText)) {
      // Se o novo valor seguir o regex, ele será aceito
      return newValue;
    } else {
      // Caso contrário, o valor anterior será mantido
      return oldValue;
    }
  }
}

class CustomTextFieldWidget extends StatelessWidget {
  final TextEditingController textEditingController;
  final IconData icon;
  final String label;
  final bool enabled;
  final bool readOnly;

  const CustomTextFieldWidget({
    super.key,
    required this.textEditingController,
    required this.icon,
    required this.label,
    required this.enabled,
    required this.readOnly,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        controller: textEditingController,
        decoration: InputDecoration(
          prefixIcon: Icon(icon),
          labelText: label,
          border: UnderlineInputBorder(),
        ),
        enabled: enabled,
        readOnly: readOnly,
        keyboardType: TextInputType.numberWithOptions(decimal: true),
        inputFormatters: [
          CustomNumberFormatter(), // Formata a entrada sem limpar o campo
        ],
      ),
    );
  }
}
