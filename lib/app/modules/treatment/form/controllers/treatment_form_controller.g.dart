// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'treatment_form_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TreatmentFormController on TreatmentFormControllerBase, Store {
  Computed<bool>? _$endlessTreatmentComputed;

  @override
  bool get endlessTreatment => (_$endlessTreatmentComputed ??= Computed<bool>(
          () => super.endlessTreatment,
          name: 'TreatmentFormControllerBase.endlessTreatment'))
      .value;

  late final _$importanceLevelAtom = Atom(
      name: 'TreatmentFormControllerBase.importanceLevel', context: context);

  @override
  String get importanceLevel {
    _$importanceLevelAtom.reportRead();
    return super.importanceLevel;
  }

  @override
  set importanceLevel(String value) {
    _$importanceLevelAtom.reportWrite(value, super.importanceLevel, () {
      super.importanceLevel = value;
    });
  }

  late final _$frequencyTypeAtom =
      Atom(name: 'TreatmentFormControllerBase.frequencyType', context: context);

  @override
  String get frequencyType {
    _$frequencyTypeAtom.reportRead();
    return super.frequencyType;
  }

  @override
  set frequencyType(String value) {
    _$frequencyTypeAtom.reportWrite(value, super.frequencyType, () {
      super.frequencyType = value;
    });
  }

  late final _$frequencyAtom =
      Atom(name: 'TreatmentFormControllerBase.frequency', context: context);

  @override
  String? get frequency {
    _$frequencyAtom.reportRead();
    return super.frequency;
  }

  @override
  set frequency(String? value) {
    _$frequencyAtom.reportWrite(value, super.frequency, () {
      super.frequency = value;
    });
  }

  late final _$_endlessTreatmentAtom = Atom(
      name: 'TreatmentFormControllerBase._endlessTreatment', context: context);

  @override
  bool get _endlessTreatment {
    _$_endlessTreatmentAtom.reportRead();
    return super._endlessTreatment;
  }

  @override
  set _endlessTreatment(bool value) {
    _$_endlessTreatmentAtom.reportWrite(value, super._endlessTreatment, () {
      super._endlessTreatment = value;
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

  late final _$selectedMedicinesAtom = Atom(
      name: 'TreatmentFormControllerBase.selectedMedicines', context: context);

  @override
  ObservableList<TreatmentMedicine> get selectedMedicines {
    _$selectedMedicinesAtom.reportRead();
    return super.selectedMedicines;
  }

  @override
  set selectedMedicines(ObservableList<TreatmentMedicine> value) {
    _$selectedMedicinesAtom.reportWrite(value, super.selectedMedicines, () {
      super.selectedMedicines = value;
    });
  }

  late final _$saveTreatmentAsyncAction = AsyncAction(
      'TreatmentFormControllerBase.saveTreatment',
      context: context);

  @override
  Future<bool> saveTreatment() {
    return _$saveTreatmentAsyncAction.run(() => super.saveTreatment());
  }

  late final _$TreatmentFormControllerBaseActionController =
      ActionController(name: 'TreatmentFormControllerBase', context: context);

  @override
  void addTreatmentMedicine(String name) {
    final _$actionInfo = _$TreatmentFormControllerBaseActionController
        .startAction(name: 'TreatmentFormControllerBase.addTreatmentMedicine');
    try {
      return super.addTreatmentMedicine(name);
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
  dynamic convertEndDate(String date) {
    final _$actionInfo = _$TreatmentFormControllerBaseActionController
        .startAction(name: 'TreatmentFormControllerBase.convertEndDate');
    try {
      return super.convertEndDate(date);
    } finally {
      _$TreatmentFormControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic convertFrequencyTime(TimeOfDay selectedTime) {
    final _$actionInfo = _$TreatmentFormControllerBaseActionController
        .startAction(name: 'TreatmentFormControllerBase.convertFrequencyTime');
    try {
      return super.convertFrequencyTime(selectedTime);
    } finally {
      _$TreatmentFormControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic convertStartDate(String date) {
    final _$actionInfo = _$TreatmentFormControllerBaseActionController
        .startAction(name: 'TreatmentFormControllerBase.convertStartDate');
    try {
      return super.convertStartDate(date);
    } finally {
      _$TreatmentFormControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setEndlessTreatment() {
    final _$actionInfo = _$TreatmentFormControllerBaseActionController
        .startAction(name: 'TreatmentFormControllerBase.setEndlessTreatment');
    try {
      return super.setEndlessTreatment();
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
importanceLevel: ${importanceLevel},
frequencyType: ${frequencyType},
frequency: ${frequency},
selectedMedicine: ${selectedMedicine},
selectedMedicines: ${selectedMedicines},
endlessTreatment: ${endlessTreatment}
    ''';
  }
}
