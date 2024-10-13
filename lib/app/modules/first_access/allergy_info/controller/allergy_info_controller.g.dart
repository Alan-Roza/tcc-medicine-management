// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'allergy_info_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AllergyInfoController on _AllergyInfoController, Store {
  late final _$medicinesAtom =
      Atom(name: '_AllergyInfoController.medicines', context: context);

  @override
  ObservableList<String> get medicines {
    _$medicinesAtom.reportRead();
    return super.medicines;
  }

  @override
  set medicines(ObservableList<String> value) {
    _$medicinesAtom.reportWrite(value, super.medicines, () {
      super.medicines = value;
    });
  }

  late final _$onSubmitAsyncAction =
      AsyncAction('_AllergyInfoController.onSubmit', context: context);

  @override
  Future<List<AllergyInfoDto>> onSubmit() {
    return _$onSubmitAsyncAction.run(() => super.onSubmit());
  }

  late final _$_AllergyInfoControllerActionController =
      ActionController(name: '_AllergyInfoController', context: context);

  @override
  void addMedicine(String medicine) {
    final _$actionInfo = _$_AllergyInfoControllerActionController.startAction(
        name: '_AllergyInfoController.addMedicine');
    try {
      return super.addMedicine(medicine);
    } finally {
      _$_AllergyInfoControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeMedicine(String medicine) {
    final _$actionInfo = _$_AllergyInfoControllerActionController.startAction(
        name: '_AllergyInfoController.removeMedicine');
    try {
      return super.removeMedicine(medicine);
    } finally {
      _$_AllergyInfoControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
medicines: ${medicines}
    ''';
  }
}
