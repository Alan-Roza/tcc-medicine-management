import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:tcc_medicine_management/app/modules/treatment/form/model/medicine_model.dart';
import 'package:tcc_medicine_management/app/modules/treatment/form/model/treatment_medicine_model.dart';

part 'treatment_form_controller.g.dart';

class TreatmentFormController = TreatmentFormControllerBase with _$TreatmentFormController;

abstract class TreatmentFormControllerBase with Store {
  TextEditingController nameController = TextEditingController();
  @observable
  String importanceLevel = 'low';
  TextEditingController medicinesController = TextEditingController();

  TextEditingController frequencyController = TextEditingController();
  TextEditingController frequencyTypeController = TextEditingController();
  TextEditingController quantityController = TextEditingController();
  TextEditingController medicineNameController = TextEditingController();
  TextEditingController startDateController = TextEditingController();
  TextEditingController endDateController = TextEditingController();

  // @computed
  // bool get isFormValid =>
  //   name.isNotEmpty &&
  //   type.isNotEmpty &&
  //   quantity.isNotEmpty &&
  //   unity.isNotEmpty &&
  //   qtyByPackage.isNotEmpty &&
  //   expirationDate.isNotEmpty &&
  //   number.isNotEmpty &&
  //   totalPaid.isNotEmpty;

  // @action
  // Future<bool> submitForm() async {
  //   if (isFormValid) {
  //   // Se o formulário for válido, processe os dados aqui...
  //   print('Formulário enviado com sucesso!');
  //   print('Nome: $name');
  //   print('Tipo: $type');
  //   print('Quantidade: $quantity');
  //   print('Unidade: $unity');
  //   print('Quantidade por pacote: $qtyByPackage');
  //   print('Data de validade: $expirationDate');
  //   print('Número: $number');
  //   print('Total pago: $totalPaid');

  //   return true;
  // } else {
  //   // Se o formulário não for válido, você pode lançar uma exceção ou lidar com o erro de alguma outra maneira...
  //   return false;
  // }
  // }

  @action
  Future<bool> saveTreatment() async {
    final treatment = Treatment(
      name: nameController.text,
      importanceLevel: importanceLevel,
      medicines: [
        TreatmentMedicine(
          name: nameController.text,
          frequency: frequencyController.text,
          quantity: int.parse(quantityController.text),
          frequencyType: frequencyTypeController.text,
          startDate: startDateController.text.isNotEmpty
              ? DateTime.parse(startDateController.text)
              : DateTime.now(),
          endDate: endDateController.text.isNotEmpty
              ? DateTime.parse(endDateController.text)
              : null,
        ),
      ],
    );

    print(treatment);
    return true;
  }

  void dispose() {
    nameController.dispose();
    importanceLevel = 'low';
    medicinesController.dispose();
    frequencyController.dispose();
    frequencyTypeController.dispose();
    quantityController.dispose();
    medicineNameController.dispose();
    startDateController.dispose();
    endDateController.dispose();
  }

  @action
  void resetForm() {
    nameController.clear();
    importanceLevel = 'low';
    medicinesController.clear();
    frequencyController.clear();
    frequencyTypeController.clear();
    quantityController.clear();
    medicineNameController.clear();
    startDateController.clear();
    endDateController.clear();
  }
}
