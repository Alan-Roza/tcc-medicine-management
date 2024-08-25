import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';
import 'package:tcc_medicine_management/app/modules/medicine/form/model/medicine_model.dart';
import 'package:tcc_medicine_management/app/modules/treatment/form/model/medicine_model.dart';
import 'package:tcc_medicine_management/app/modules/treatment/form/model/treatment_medicine_model.dart';

part 'treatment_form_controller.g.dart';

class TreatmentFormController = TreatmentFormControllerBase with _$TreatmentFormController;

abstract class TreatmentFormControllerBase with Store {
  @observable
  String importanceLevel = 'low';
  TextEditingController nameController = TextEditingController();
  TextEditingController medicinesController = TextEditingController();

  @observable
  String frequencyType = 'hourly';
  @observable
  String? frequency;
  TextEditingController frequencyDisplayController = TextEditingController();
  TextEditingController frequencyController = TextEditingController();
  TextEditingController quantityController = TextEditingController();
  TextEditingController medicineNameController = TextEditingController();
  TextEditingController startDateController = TextEditingController();
  TextEditingController startDateDisplayController = TextEditingController();
  TextEditingController endDateController = TextEditingController();
  TextEditingController endDateDisplayController = TextEditingController();

  @observable
  bool _endlessTreatment = false;

  @computed
  bool get endlessTreatment => _endlessTreatment;

  @observable
  String? selectedMedicine = '';

  @observable
  ObservableList<TreatmentMedicine> selectedMedicines = ObservableList<TreatmentMedicine>();

  // TODO: use medicines list from server
  List<Medicine> medicines = [
    Medicine(
      name: 'Dipirona',
      type: 'Comprimido',
      quantity: 20,
      expirationDate: '2022-12-31',
      qtyByPackage: 10,
      unity: 1,
      valuePaid: 10.0,
      importanceLevel: 'low',
      drawerNumber: 1,
    ),
    Medicine(
      name: 'Paracetamol',
      type: 'Comprimido',
      quantity: 20,
      expirationDate: '2022-12-31',
      qtyByPackage: 10,
      unity: 1,
      valuePaid: 10.0,
      importanceLevel: 'low',
      drawerNumber: 1,
    ),
  ];

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
          frequency: frequency,
          quantity: int.parse(quantityController.text),
          frequencyType: frequencyType,
          startDate: startDateController.text.isNotEmpty ? DateTime.parse(startDateController.text) : DateTime.now(),
          endDate: endDateController.text.isNotEmpty ? DateTime.parse(endDateController.text) : null,
        ),
      ],
    );

    print(treatment);
    return true;
  }

  @action
  void addTreatmentMedicine(String name) {
    final treatmentMedicine = TreatmentMedicine(
      name: name,
      startDate: DateTime.now(),
    );

    selectedMedicines.add(treatmentMedicine);

    print(treatmentMedicine);
  }

  @action
  removeTreatmentMedicine(int index) {
    selectedMedicines.remove(selectedMedicines[index]);
  }

  @action
  convertEndDate(String date) {
    endDateController.text = date;
    DateFormat format = DateFormat('dd-MM-yyyy HH:mm');
    endDateDisplayController.text = format.format(DateTime.parse(date));
  }

  @action
  convertFrequencyTime(TimeOfDay selectedTime) {
    final now = DateTime.now();
    final dateTime = DateTime(now.year, now.month, now.day, selectedTime.hour, selectedTime.minute);

    String formattedTime = DateFormat.Hm().format(dateTime);

    frequencyController.text = dateTime.toString();
    frequencyDisplayController.text = formattedTime;
  }

  @action
  convertStartDate(String date) {
    startDateController.text = date;
    DateFormat format = DateFormat('dd-MM-yyyy HH:mm');
    startDateDisplayController.text = format.format(DateTime.parse(date));
  }

  @action
  setEndlessTreatment() {
    _endlessTreatment = !_endlessTreatment;
  }

  void dispose() {
    nameController.dispose();
    importanceLevel = 'low';
    medicinesController.dispose();
    frequency = null;
    frequencyType = 'hourly';
    quantityController.dispose();
    medicineNameController.dispose();
    startDateController.dispose();
    endDateController.dispose();
    startDateDisplayController.dispose();
    endDateDisplayController.dispose();
    selectedMedicines.clear();
    _endlessTreatment = false;
  }

  @action
  void resetForm() {
    nameController.clear();
    importanceLevel = 'low';
    medicinesController.clear();
    frequency = null;
    frequencyType = 'hourly';
    quantityController.clear();
    medicineNameController.clear();
    startDateController.clear();
    endDateController.clear();
    selectedMedicines.clear();
    startDateDisplayController.clear();
    endDateDisplayController.clear();
    _endlessTreatment = false;
  }
}
