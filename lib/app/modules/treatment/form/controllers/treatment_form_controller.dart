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
  final Map<int, TextEditingController> frequencyControllers = {};
  final Map<int, TextEditingController> quantityControllers = {};
  final Map<int, TextEditingController> medicineNameControllers = {};
  final Map<int, TextEditingController> startDateControllers = {};
  final Map<int, TextEditingController> startDateDisplayControllers = {};
  final Map<int, TextEditingController> endDateControllers = {};
  final Map<int, TextEditingController> endDateDisplayControllers = {};

  @observable
  ObservableList<Medicine> selectedMedicines = ObservableList<Medicine>();

  @observable
  Map<int, int?> selectedFrequencies = {};

  @observable
  Map<int, bool> endlessTreatments = {};

  @observable
  String? selectedMedicine = '';

  void initializeMedicineControllers(List<int> medicineIds) {
    for (int id in medicineIds) {
      frequencyControllers[id] = TextEditingController();
      quantityControllers[id] = TextEditingController();
      medicineNameControllers[id] = TextEditingController();
      startDateControllers[id] = TextEditingController();
      startDateDisplayControllers[id] = TextEditingController();
      endDateControllers[id] = TextEditingController();
      endDateDisplayControllers[id] = TextEditingController();
    }
  }

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
  void setSelectedFrequency(int medicineId, int? frequency) {
    selectedFrequencies[medicineId] = frequency;
  }

  @action
  void setEndlessTreatment(int medicineId) {
    final currentState = endlessTreatments[medicineId] ?? false;
    endlessTreatments = {
      ...endlessTreatments,
      medicineId: !currentState
    };
  }

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
                dosage: quantityControllers[medicine.medicineId]!.text.isNotEmpty
                    ? int.parse(quantityControllers[medicine.medicineId]!.text)
                    : null,
                frequency: frequencyControllers[medicine.medicineId]!.text.isNotEmpty
                    ? int.parse(frequencyControllers[medicine.medicineId]!.text)
                    : null,
                treatmentEnd: endDateControllers[medicine.medicineId]!.text.isNotEmpty && endlessTreatments[medicine.medicineId]! == false
                    ? DateTime.parse(endDateControllers[medicine.medicineId]!.text).toIso8601String()
                    : null,
                treatmentInit: startDateControllers[medicine.medicineId]!.text.isNotEmpty
                    ? DateTime.parse(startDateControllers[medicine.medicineId]!.text).toIso8601String()
                    : DateTime.now().toIso8601String(),
              ))
          .toList();

      final TreatmentMedicineDto treatmentMedicine =
          TreatmentMedicineDto(treatment: treatment, medicines: medicinesFormatted);

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

    endlessTreatments[medicineId] = false;

    selectedMedicines.add(treatmentMedicine);
  }

  @action
  removeTreatmentMedicine(int index) {
    selectedMedicines.remove(selectedMedicines[index]);
  }

  @action
  void convertEndDate(String date, int medicineId) {
    endDateControllers[medicineId]?.text = date;
    DateFormat format = DateFormat('dd-MM-yyyy HH:mm');
    endDateDisplayControllers[medicineId]?.text = format.format(DateTime.parse(date));
  }

  @action
  void convertStartDate(String date, int medicineId) {
    startDateControllers[medicineId]?.text = date;
    DateFormat format = DateFormat('dd-MM-yyyy HH:mm');
    startDateDisplayControllers[medicineId]?.text = format.format(DateTime.parse(date));
  }

  // @action
  // convertEndDate(String date) {
  //   endDateController.text = date;
  //   DateFormat format = DateFormat('dd-MM-yyyy HH:mm');
  //   endDateDisplayController.text = format.format(DateTime.parse(date));
  // }

  // @action
  // convertStartDate(String date) {
  //   startDateController.text = date;
  //   DateFormat format = DateFormat('dd-MM-yyyy HH:mm');
  //   startDateDisplayController.text = format.format(DateTime.parse(date));
  // }

  void dispose() {
    nameController.clear();
    importanceLevel = ImportanceLevel.media;
    medicinesController.clear();
    selectedFrequencies.clear();
    endlessTreatments.clear();
    selectedMedicines.clear();
    for (var controller in frequencyControllers.values) {
      controller.clear();
    }
    for (var controller in quantityControllers.values) {
      controller.clear();
    }
    for (var controller in medicineNameControllers.values) {
      controller.clear();
    }
    for (var controller in startDateControllers.values) {
      controller.clear();
    }
    for (var controller in startDateDisplayControllers.values) {
      controller.clear();
    }
    for (var controller in endDateControllers.values) {
      controller.clear();
    }
    for (var controller in endDateDisplayControllers.values) {
      controller.clear();
    }
  }

  @action
  void resetForm() {
    nameController.clear();
    importanceLevel = ImportanceLevel.media;
    medicinesController.clear();
    selectedFrequencies.clear();
    endlessTreatments.clear();
    selectedMedicines.clear();
    for (var controller in frequencyControllers.values) {
      controller.clear();
    }
    for (var controller in quantityControllers.values) {
      controller.clear();
    }
    for (var controller in medicineNameControllers.values) {
      controller.clear();
    }
    for (var controller in startDateControllers.values) {
      controller.clear();
    }
    for (var controller in startDateDisplayControllers.values) {
      controller.clear();
    }
    for (var controller in endDateControllers.values) {
      controller.clear();
    }
    for (var controller in endDateDisplayControllers.values) {
      controller.clear();
    }
  }
}
