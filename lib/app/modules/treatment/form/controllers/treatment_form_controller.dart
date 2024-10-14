import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';
import 'package:tcc_medicine_management/app/modules/medicine/form/controllers/medicine_form_controller.dart';
import 'package:tcc_medicine_management/app/modules/treatment/form/model/dto/treatment_medicine_dto.dart';
import 'package:tcc_medicine_management/app/modules/treatment/form/repository/treatment_medicine_repository.dart';
import 'package:tcc_medicine_management/main.dart';

part 'treatment_form_controller.g.dart';

class TreatmentFormController = TreatmentFormControllerBase with _$TreatmentFormController;

abstract class TreatmentFormControllerBase with Store {
  final TreatmentMedicineRepository _treatmentMedicineRepository = getIt<TreatmentMedicineRepository>();

  @observable
  List<Map<String, String>> medicines = [];

  @observable
  ImportanceLevel importanceLevel = ImportanceLevel.media;
  TextEditingController nameController = TextEditingController();
  TextEditingController medicinesController = TextEditingController();

  @observable
  int? medicineId;
  TextEditingController frequencyController = TextEditingController();
  @observable
  int? selectedFrequency;
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
  ObservableList<Medicine> selectedMedicines = ObservableList<Medicine>();

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
  Future<List<Map<String, String>>> getMedicineResource() async {
    try {
      final List<Map<String, String>> dataResponse = await _treatmentMedicineRepository.resource();

      medicines = dataResponse;

      return dataResponse;
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  @action
  Future<TreatmentMedicineDto> saveTreatment(GlobalKey<FormState>? formKey) async {
    try {
      // TODO: will be implemented at future
      // if (!formKey.currentState!.validate()) {
      //   return Future.error('Preencha os campos corretamente!');
      // }

      final treatment = Treatment(importance: importanceLevel.displayName, name: nameController.text);

      final medicinesFormatted = selectedMedicines
          .map((medicine) => Medicine(
                name: medicine.name,
                medicineId: medicine.medicineId,
                dosage: quantityController.text.isNotEmpty ? int.parse(quantityController.text) : null,
                frequency: frequencyController.text.isNotEmpty ? int.parse(frequencyController.text) : null,
                treatmentEnd: endDateController.text.isNotEmpty && endlessTreatment == false
                    ? DateTime.parse(endDateController.text).toIso8601String()
                    : null,
                treatmentInit: startDateController.text.isNotEmpty
                    ? DateTime.parse(startDateController.text).toIso8601String()
                    : DateTime.now().toIso8601String(),
              ))
          .toList();

      final TreatmentMedicineDto treatmentMedicine = TreatmentMedicineDto(treatment: treatment, medicines: medicinesFormatted);

      final TreatmentMedicineDto dataResponse = await _treatmentMedicineRepository.exec(treatmentMedicine);
      return dataResponse;
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  @action
  void addTreatmentMedicine(int medicineId) {
    final treatmentMedicine = Medicine(
      medicineId: medicineId,
      name: medicines.firstWhere((medicine) => medicine['id'] == medicineId.toString())['name'],
      treatmentInit: DateTime.now().toString(),
    );

    selectedMedicines.add(treatmentMedicine);
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
    importanceLevel = ImportanceLevel.media;
    medicinesController.dispose();
    frequencyController.dispose();
    quantityController.dispose();
    medicineNameController.dispose();
    startDateController.dispose();
    endDateController.dispose();
    selectedFrequency = null;
    startDateDisplayController.dispose();
    endDateDisplayController.dispose();
    selectedMedicines.clear();
    _endlessTreatment = false;
  }

  @action
  void resetForm() {
    nameController.clear();
    importanceLevel = ImportanceLevel.media;
    medicinesController.clear();
    frequencyController.clear();
    selectedFrequency = null;
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
