// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patient_card_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PatientCardController on PatientCardControllerBase, Store {
  late final _$isSelectedAtom =
      Atom(name: 'PatientCardControllerBase.isSelected', context: context);

  @override
  bool get isSelected {
    _$isSelectedAtom.reportRead();
    return super.isSelected;
  }

  @override
  set isSelected(bool value) {
    _$isSelectedAtom.reportWrite(value, super.isSelected, () {
      super.isSelected = value;
    });
  }

  late final _$idAtom =
      Atom(name: 'PatientCardControllerBase.id', context: context);

  @override
  int get id {
    _$idAtom.reportRead();
    return super.id;
  }

  @override
  set id(int value) {
    _$idAtom.reportWrite(value, super.id, () {
      super.id = value;
    });
  }

  late final _$nameAtom =
      Atom(name: 'PatientCardControllerBase.name', context: context);

  @override
  String get name {
    _$nameAtom.reportRead();
    return super.name;
  }

  @override
  set name(String value) {
    _$nameAtom.reportWrite(value, super.name, () {
      super.name = value;
    });
  }

  late final _$ageAtom =
      Atom(name: 'PatientCardControllerBase.age', context: context);

  @override
  int get age {
    _$ageAtom.reportRead();
    return super.age;
  }

  @override
  set age(int value) {
    _$ageAtom.reportWrite(value, super.age, () {
      super.age = value;
    });
  }

  late final _$cellphoneAtom =
      Atom(name: 'PatientCardControllerBase.cellphone', context: context);

  @override
  String get cellphone {
    _$cellphoneAtom.reportRead();
    return super.cellphone;
  }

  @override
  set cellphone(String value) {
    _$cellphoneAtom.reportWrite(value, super.cellphone, () {
      super.cellphone = value;
    });
  }

  late final _$genderAtom =
      Atom(name: 'PatientCardControllerBase.gender', context: context);

  @override
  String get gender {
    _$genderAtom.reportRead();
    return super.gender;
  }

  @override
  set gender(String value) {
    _$genderAtom.reportWrite(value, super.gender, () {
      super.gender = value;
    });
  }

  late final _$lastAccessAtom =
      Atom(name: 'PatientCardControllerBase.lastAccess', context: context);

  @override
  DateTime? get lastAccess {
    _$lastAccessAtom.reportRead();
    return super.lastAccess;
  }

  @override
  set lastAccess(DateTime? value) {
    _$lastAccessAtom.reportWrite(value, super.lastAccess, () {
      super.lastAccess = value;
    });
  }

  late final _$imageUrlAtom =
      Atom(name: 'PatientCardControllerBase.imageUrl', context: context);

  @override
  String get imageUrl {
    _$imageUrlAtom.reportRead();
    return super.imageUrl;
  }

  @override
  set imageUrl(String value) {
    _$imageUrlAtom.reportWrite(value, super.imageUrl, () {
      super.imageUrl = value;
    });
  }

  late final _$accessPatientAsyncAction =
      AsyncAction('PatientCardControllerBase.accessPatient', context: context);

  @override
  Future<void> accessPatient(int id) {
    return _$accessPatientAsyncAction.run(() => super.accessPatient(id));
  }

  late final _$PatientCardControllerBaseActionController =
      ActionController(name: 'PatientCardControllerBase', context: context);

  @override
  void updatePatient(PatientCard patient) {
    final _$actionInfo = _$PatientCardControllerBaseActionController
        .startAction(name: 'PatientCardControllerBase.updatePatient');
    try {
      return super.updatePatient(patient);
    } finally {
      _$PatientCardControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void toggleSelection() {
    final _$actionInfo = _$PatientCardControllerBaseActionController
        .startAction(name: 'PatientCardControllerBase.toggleSelection');
    try {
      return super.toggleSelection();
    } finally {
      _$PatientCardControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeSelection() {
    final _$actionInfo = _$PatientCardControllerBaseActionController
        .startAction(name: 'PatientCardControllerBase.removeSelection');
    try {
      return super.removeSelection();
    } finally {
      _$PatientCardControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addSelection() {
    final _$actionInfo = _$PatientCardControllerBaseActionController
        .startAction(name: 'PatientCardControllerBase.addSelection');
    try {
      return super.addSelection();
    } finally {
      _$PatientCardControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isSelected: ${isSelected},
id: ${id},
name: ${name},
age: ${age},
cellphone: ${cellphone},
gender: ${gender},
lastAccess: ${lastAccess},
imageUrl: ${imageUrl}
    ''';
  }
}
