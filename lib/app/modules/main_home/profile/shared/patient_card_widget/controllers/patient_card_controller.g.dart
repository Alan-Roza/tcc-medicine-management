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

  bool _isSelectedIsInitialized = false;

  @override
  set isSelected(bool value) {
    _$isSelectedAtom.reportWrite(
        value, _isSelectedIsInitialized ? super.isSelected : null, () {
      super.isSelected = value;
      _isSelectedIsInitialized = true;
    });
  }

  late final _$idAtom =
      Atom(name: 'PatientCardControllerBase.id', context: context);

  @override
  int get id {
    _$idAtom.reportRead();
    return super.id;
  }

  bool _idIsInitialized = false;

  @override
  set id(int value) {
    _$idAtom.reportWrite(value, _idIsInitialized ? super.id : null, () {
      super.id = value;
      _idIsInitialized = true;
    });
  }

  late final _$nameAtom =
      Atom(name: 'PatientCardControllerBase.name', context: context);

  @override
  String get name {
    _$nameAtom.reportRead();
    return super.name;
  }

  bool _nameIsInitialized = false;

  @override
  set name(String value) {
    _$nameAtom.reportWrite(value, _nameIsInitialized ? super.name : null, () {
      super.name = value;
      _nameIsInitialized = true;
    });
  }

  late final _$ageAtom =
      Atom(name: 'PatientCardControllerBase.age', context: context);

  @override
  int get age {
    _$ageAtom.reportRead();
    return super.age;
  }

  bool _ageIsInitialized = false;

  @override
  set age(int value) {
    _$ageAtom.reportWrite(value, _ageIsInitialized ? super.age : null, () {
      super.age = value;
      _ageIsInitialized = true;
    });
  }

  late final _$cellphoneAtom =
      Atom(name: 'PatientCardControllerBase.cellphone', context: context);

  @override
  String get cellphone {
    _$cellphoneAtom.reportRead();
    return super.cellphone;
  }

  bool _cellphoneIsInitialized = false;

  @override
  set cellphone(String value) {
    _$cellphoneAtom.reportWrite(
        value, _cellphoneIsInitialized ? super.cellphone : null, () {
      super.cellphone = value;
      _cellphoneIsInitialized = true;
    });
  }

  late final _$genderAtom =
      Atom(name: 'PatientCardControllerBase.gender', context: context);

  @override
  String get gender {
    _$genderAtom.reportRead();
    return super.gender;
  }

  bool _genderIsInitialized = false;

  @override
  set gender(String value) {
    _$genderAtom.reportWrite(value, _genderIsInitialized ? super.gender : null,
        () {
      super.gender = value;
      _genderIsInitialized = true;
    });
  }

  late final _$lastAccessAtom =
      Atom(name: 'PatientCardControllerBase.lastAccess', context: context);

  @override
  DateTime? get lastAccess {
    _$lastAccessAtom.reportRead();
    return super.lastAccess;
  }

  bool _lastAccessIsInitialized = false;

  @override
  set lastAccess(DateTime? value) {
    _$lastAccessAtom.reportWrite(
        value, _lastAccessIsInitialized ? super.lastAccess : null, () {
      super.lastAccess = value;
      _lastAccessIsInitialized = true;
    });
  }

  late final _$imageUrlAtom =
      Atom(name: 'PatientCardControllerBase.imageUrl', context: context);

  @override
  String get imageUrl {
    _$imageUrlAtom.reportRead();
    return super.imageUrl;
  }

  bool _imageUrlIsInitialized = false;

  @override
  set imageUrl(String value) {
    _$imageUrlAtom
        .reportWrite(value, _imageUrlIsInitialized ? super.imageUrl : null, () {
      super.imageUrl = value;
      _imageUrlIsInitialized = true;
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
