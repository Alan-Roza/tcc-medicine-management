// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medicine_form_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MedicineFormController on MedicineFormControllerBase, Store {
  late final _$medicineTypeAtom =
      Atom(name: 'MedicineFormControllerBase.medicineType', context: context);

  @override
  MedicineType get medicineType {
    _$medicineTypeAtom.reportRead();
    return super.medicineType;
  }

  @override
  set medicineType(MedicineType value) {
    _$medicineTypeAtom.reportWrite(value, super.medicineType, () {
      super.medicineType = value;
    });
  }

  late final _$importanceLevelAtom = Atom(
      name: 'MedicineFormControllerBase.importanceLevel', context: context);

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

  late final _$saveMedicineAsyncAction =
      AsyncAction('MedicineFormControllerBase.saveMedicine', context: context);

  @override
  Future<MedicineDto> saveMedicine(GlobalKey<FormState>? formKey) {
    return _$saveMedicineAsyncAction.run(() => super.saveMedicine(formKey));
  }

  late final _$MedicineFormControllerBaseActionController =
      ActionController(name: 'MedicineFormControllerBase', context: context);

  @override
  void setExpirationDate(DateTime value) {
    final _$actionInfo = _$MedicineFormControllerBaseActionController
        .startAction(name: 'MedicineFormControllerBase.setExpirationDate');
    try {
      return super.setExpirationDate(value);
    } finally {
      _$MedicineFormControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void resetForm() {
    final _$actionInfo = _$MedicineFormControllerBaseActionController
        .startAction(name: 'MedicineFormControllerBase.resetForm');
    try {
      return super.resetForm();
    } finally {
      _$MedicineFormControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
medicineType: ${medicineType},
importanceLevel: ${importanceLevel}
    ''';
  }
}
