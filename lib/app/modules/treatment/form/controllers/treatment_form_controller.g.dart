// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'treatment_form_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TreatmentFormController on TreatmentFormControllerBase, Store {
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
importanceLevel: ${importanceLevel}
    ''';
  }
}
