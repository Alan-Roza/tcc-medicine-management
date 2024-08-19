import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:tcc_medicine_management/app/modules/medicine/form/model/medicine_model.dart';

part 'medicine_form_controller.g.dart';

class MedicineFormController = MedicineFormControllerBase with _$MedicineFormController;

abstract class MedicineFormControllerBase with Store {
  TextEditingController nameController = TextEditingController();
  TextEditingController typeController = TextEditingController();
  TextEditingController quantityController = TextEditingController();
  TextEditingController unityController = TextEditingController();
  TextEditingController qtyByPackageController = TextEditingController();

  TextEditingController valuePaidController = TextEditingController();
  TextEditingController expirationDateController = TextEditingController();
  TextEditingController importanceLevelController = TextEditingController();
  TextEditingController drawerNumberController = TextEditingController();

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
  Future<bool> saveMedicine() async {
    final medicine = Medicine(
      name: nameController.text,
      type: typeController.text,
      quantity: int.parse(quantityController.text),
      unity: int.parse(unityController.text),
      qtyByPackage: int.parse(qtyByPackageController.text),
      valuePaid: double.parse(valuePaidController.text),
      expirationDate: expirationDateController.text,
      drawerNumber: int.parse(drawerNumberController.text),
      importanceLevel: importanceLevelController.text,
    );

    print(medicine);
    return true;
  }

  void dispose() {
    nameController.dispose();
    typeController.dispose();
    quantityController.dispose();
    unityController.dispose();
    qtyByPackageController.dispose();
    valuePaidController.dispose();
    expirationDateController.dispose();
    importanceLevelController.dispose();
    drawerNumberController.dispose();
  }

  @action
  void resetForm() {
    nameController.clear();
    typeController.clear();
    quantityController.clear();
    unityController.clear();
    qtyByPackageController.clear();
    valuePaidController.clear();
    expirationDateController.clear();
    importanceLevelController.clear();
    drawerNumberController.clear();
  }
}
