// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chronical_disease_info_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ChronicalDiseaseInfoController
    on _ChronicalDiseaseInfoController, Store {
  late final _$hasHypertensionAtom = Atom(
      name: '_ChronicalDiseaseInfoController.hasHypertension',
      context: context);

  @override
  bool get hasHypertension {
    _$hasHypertensionAtom.reportRead();
    return super.hasHypertension;
  }

  @override
  set hasHypertension(bool value) {
    _$hasHypertensionAtom.reportWrite(value, super.hasHypertension, () {
      super.hasHypertension = value;
    });
  }

  late final _$hasDiabetesAtom = Atom(
      name: '_ChronicalDiseaseInfoController.hasDiabetes', context: context);

  @override
  bool get hasDiabetes {
    _$hasDiabetesAtom.reportRead();
    return super.hasDiabetes;
  }

  @override
  set hasDiabetes(bool value) {
    _$hasDiabetesAtom.reportWrite(value, super.hasDiabetes, () {
      super.hasDiabetes = value;
    });
  }

  late final _$hasAlzheimerAtom = Atom(
      name: '_ChronicalDiseaseInfoController.hasAlzheimer', context: context);

  @override
  bool get hasAlzheimer {
    _$hasAlzheimerAtom.reportRead();
    return super.hasAlzheimer;
  }

  @override
  set hasAlzheimer(bool value) {
    _$hasAlzheimerAtom.reportWrite(value, super.hasAlzheimer, () {
      super.hasAlzheimer = value;
    });
  }

  late final _$hasOsteoporosisAtom = Atom(
      name: '_ChronicalDiseaseInfoController.hasOsteoporosis',
      context: context);

  @override
  bool get hasOsteoporosis {
    _$hasOsteoporosisAtom.reportRead();
    return super.hasOsteoporosis;
  }

  @override
  set hasOsteoporosis(bool value) {
    _$hasOsteoporosisAtom.reportWrite(value, super.hasOsteoporosis, () {
      super.hasOsteoporosis = value;
    });
  }

  late final _$otherDiseasesAtom = Atom(
      name: '_ChronicalDiseaseInfoController.otherDiseases', context: context);

  @override
  ObservableList<String> get otherDiseases {
    _$otherDiseasesAtom.reportRead();
    return super.otherDiseases;
  }

  @override
  set otherDiseases(ObservableList<String> value) {
    _$otherDiseasesAtom.reportWrite(value, super.otherDiseases, () {
      super.otherDiseases = value;
    });
  }

  late final _$_ChronicalDiseaseInfoControllerActionController =
      ActionController(
          name: '_ChronicalDiseaseInfoController', context: context);

  @override
  void addDisease(String disease) {
    final _$actionInfo = _$_ChronicalDiseaseInfoControllerActionController
        .startAction(name: '_ChronicalDiseaseInfoController.addDisease');
    try {
      return super.addDisease(disease);
    } finally {
      _$_ChronicalDiseaseInfoControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeDisease(String disease) {
    final _$actionInfo = _$_ChronicalDiseaseInfoControllerActionController
        .startAction(name: '_ChronicalDiseaseInfoController.removeDisease');
    try {
      return super.removeDisease(disease);
    } finally {
      _$_ChronicalDiseaseInfoControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
hasHypertension: ${hasHypertension},
hasDiabetes: ${hasDiabetes},
hasAlzheimer: ${hasAlzheimer},
hasOsteoporosis: ${hasOsteoporosis},
otherDiseases: ${otherDiseases}
    ''';
  }
}
