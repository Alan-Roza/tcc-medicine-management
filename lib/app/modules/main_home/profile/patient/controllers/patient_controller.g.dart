// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patient_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PatientController on _PatientController, Store {
  late final _$patientCardsAtom =
      Atom(name: '_PatientController.patientCards', context: context);

  @override
  ObservableList<PatientCardController> get patientCards {
    _$patientCardsAtom.reportRead();
    return super.patientCards;
  }

  @override
  set patientCards(ObservableList<PatientCardController> value) {
    _$patientCardsAtom.reportWrite(value, super.patientCards, () {
      super.patientCards = value;
    });
  }

  late final _$_PatientControllerActionController =
      ActionController(name: '_PatientController', context: context);

  @override
  void createPatientCardList() {
    final _$actionInfo = _$_PatientControllerActionController.startAction(
        name: '_PatientController.createPatientCardList');
    try {
      return super.createPatientCardList();
    } finally {
      _$_PatientControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
patientCards: ${patientCards}
    ''';
  }
}
