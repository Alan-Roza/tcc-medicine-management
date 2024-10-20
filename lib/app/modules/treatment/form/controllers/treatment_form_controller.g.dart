// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'treatment_form_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TreatmentFormController on TreatmentFormControllerBase, Store {
  late final _$medicinesAtom =
      Atom(name: 'TreatmentFormControllerBase.medicines', context: context);

  @override
  List<Map<String, String>> get medicines {
    _$medicinesAtom.reportRead();
    return super.medicines;
  }

  @override
  set medicines(List<Map<String, String>> value) {
    _$medicinesAtom.reportWrite(value, super.medicines, () {
      super.medicines = value;
    });
  }

  late final _$importanceLevelAtom = Atom(
      name: 'TreatmentFormControllerBase.importanceLevel', context: context);

  @override
  ImportanceLevel get importanceLevel {
    _$importanceLevelAtom.reportRead();
    return super.importanceLevel;
  }

  @override
  set importanceLevel(ImportanceLevel value) {
    _$importanceLevelAtom.reportWrite(value, super.importanceLevel, () {
      super.importanceLevel = value;
    });
  }

  late final _$medicineIdAtom =
      Atom(name: 'TreatmentFormControllerBase.medicineId', context: context);

  @override
  int? get medicineId {
    _$medicineIdAtom.reportRead();
    return super.medicineId;
  }

  @override
  set medicineId(int? value) {
    _$medicineIdAtom.reportWrite(value, super.medicineId, () {
      super.medicineId = value;
    });
  }

  late final _$selectedMedicinesAtom = Atom(
      name: 'TreatmentFormControllerBase.selectedMedicines', context: context);

  @override
  ObservableList<Medicine> get selectedMedicines {
    _$selectedMedicinesAtom.reportRead();
    return super.selectedMedicines;
  }

  @override
  set selectedMedicines(ObservableList<Medicine> value) {
    _$selectedMedicinesAtom.reportWrite(value, super.selectedMedicines, () {
      super.selectedMedicines = value;
    });
  }

  late final _$selectedFrequenciesAtom = Atom(
      name: 'TreatmentFormControllerBase.selectedFrequencies',
      context: context);

  @override
  Map<int, int?> get selectedFrequencies {
    _$selectedFrequenciesAtom.reportRead();
    return super.selectedFrequencies;
  }

  @override
  set selectedFrequencies(Map<int, int?> value) {
    _$selectedFrequenciesAtom.reportWrite(value, super.selectedFrequencies, () {
      super.selectedFrequencies = value;
    });
  }

  late final _$endlessTreatmentsAtom = Atom(
      name: 'TreatmentFormControllerBase.endlessTreatments', context: context);

  @override
  Map<int, bool> get endlessTreatments {
    _$endlessTreatmentsAtom.reportRead();
    return super.endlessTreatments;
  }

  @override
  set endlessTreatments(Map<int, bool> value) {
    _$endlessTreatmentsAtom.reportWrite(value, super.endlessTreatments, () {
      super.endlessTreatments = value;
    });
  }

  late final _$selectedMedicineAtom = Atom(
      name: 'TreatmentFormControllerBase.selectedMedicine', context: context);

  @override
  String? get selectedMedicine {
    _$selectedMedicineAtom.reportRead();
    return super.selectedMedicine;
  }

  @override
  set selectedMedicine(String? value) {
    _$selectedMedicineAtom.reportWrite(value, super.selectedMedicine, () {
      super.selectedMedicine = value;
    });
  }

  late final _$getMedicineResourceAsyncAction = AsyncAction(
      'TreatmentFormControllerBase.getMedicineResource',
      context: context);

  @override
  Future<List<Map<String, String>>> getMedicineResource() {
    return _$getMedicineResourceAsyncAction
        .run(() => super.getMedicineResource());
  }

  late final _$saveTreatmentAsyncAction = AsyncAction(
      'TreatmentFormControllerBase.saveTreatment',
      context: context);

  @override
  Future<TreatmentMedicineDto> saveTreatment(GlobalKey<FormState>? formKey) {
    return _$saveTreatmentAsyncAction.run(() => super.saveTreatment(formKey));
  }

  late final _$TreatmentFormControllerBaseActionController =
      ActionController(name: 'TreatmentFormControllerBase', context: context);

  @override
  void setSelectedFrequency(int medicineId, int? frequency) {
    final _$actionInfo = _$TreatmentFormControllerBaseActionController
        .startAction(name: 'TreatmentFormControllerBase.setSelectedFrequency');
    try {
      return super.setSelectedFrequency(medicineId, frequency);
    } finally {
      _$TreatmentFormControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setEndlessTreatment(int medicineId) {
    final _$actionInfo = _$TreatmentFormControllerBaseActionController
        .startAction(name: 'TreatmentFormControllerBase.setEndlessTreatment');
    try {
      return super.setEndlessTreatment(medicineId);
    } finally {
      _$TreatmentFormControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addTreatmentMedicine(int medicineId) {
    final _$actionInfo = _$TreatmentFormControllerBaseActionController
        .startAction(name: 'TreatmentFormControllerBase.addTreatmentMedicine');
    try {
      return super.addTreatmentMedicine(medicineId);
    } finally {
      _$TreatmentFormControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic removeTreatmentMedicine(int index) {
    final _$actionInfo =
        _$TreatmentFormControllerBaseActionController.startAction(
            name: 'TreatmentFormControllerBase.removeTreatmentMedicine');
    try {
      return super.removeTreatmentMedicine(index);
    } finally {
      _$TreatmentFormControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void convertEndDate(String date, int medicineId) {
    final _$actionInfo = _$TreatmentFormControllerBaseActionController
        .startAction(name: 'TreatmentFormControllerBase.convertEndDate');
    try {
      return super.convertEndDate(date, medicineId);
    } finally {
      _$TreatmentFormControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void convertStartDate(String date, int medicineId) {
    final _$actionInfo = _$TreatmentFormControllerBaseActionController
        .startAction(name: 'TreatmentFormControllerBase.convertStartDate');
    try {
      return super.convertStartDate(date, medicineId);
    } finally {
      _$TreatmentFormControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void resetForm() {
    final _$actionInfo = _$TreatmentFormControllerBaseActionController
        .startAction(name: 'TreatmentFormControllerBase.resetForm');
    try {
      return super.resetForm();
    } finally {
      _$TreatmentFormControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
medicines: ${medicines},
importanceLevel: ${importanceLevel},
medicineId: ${medicineId},
selectedMedicines: ${selectedMedicines},
selectedFrequencies: ${selectedFrequencies},
endlessTreatments: ${endlessTreatments},
selectedMedicine: ${selectedMedicine}
    ''';
  }
}
