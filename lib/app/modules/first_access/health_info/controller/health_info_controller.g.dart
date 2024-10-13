// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'health_info_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HealthInfoController on _HealthInfoController, Store {
  late final _$isPregnantAtom =
      Atom(name: '_HealthInfoController.isPregnant', context: context);

  @override
  bool get isPregnant {
    _$isPregnantAtom.reportRead();
    return super.isPregnant;
  }

  @override
  set isPregnant(bool value) {
    _$isPregnantAtom.reportWrite(value, super.isPregnant, () {
      super.isPregnant = value;
    });
  }

  late final _$isSmokerAtom =
      Atom(name: '_HealthInfoController.isSmoker', context: context);

  @override
  bool get isSmoker {
    _$isSmokerAtom.reportRead();
    return super.isSmoker;
  }

  @override
  set isSmoker(bool value) {
    _$isSmokerAtom.reportWrite(value, super.isSmoker, () {
      super.isSmoker = value;
    });
  }

  late final _$isAlcoholAtom =
      Atom(name: '_HealthInfoController.isAlcohol', context: context);

  @override
  bool get isAlcohol {
    _$isAlcoholAtom.reportRead();
    return super.isAlcohol;
  }

  @override
  set isAlcohol(bool value) {
    _$isAlcoholAtom.reportWrite(value, super.isAlcohol, () {
      super.isAlcohol = value;
    });
  }

  late final _$hasAllergyAtom =
      Atom(name: '_HealthInfoController.hasAllergy', context: context);

  @override
  bool get hasAllergy {
    _$hasAllergyAtom.reportRead();
    return super.hasAllergy;
  }

  @override
  set hasAllergy(bool value) {
    _$hasAllergyAtom.reportWrite(value, super.hasAllergy, () {
      super.hasAllergy = value;
    });
  }

  late final _$hasChronicDiseaseAtom =
      Atom(name: '_HealthInfoController.hasChronicDisease', context: context);

  @override
  bool get hasChronicDisease {
    _$hasChronicDiseaseAtom.reportRead();
    return super.hasChronicDisease;
  }

  @override
  set hasChronicDisease(bool value) {
    _$hasChronicDiseaseAtom.reportWrite(value, super.hasChronicDisease, () {
      super.hasChronicDisease = value;
    });
  }

  late final _$onSubmitAsyncAction =
      AsyncAction('_HealthInfoController.onSubmit', context: context);

  @override
  Future<HealthInfoDto> onSubmit(GlobalKey<FormState> formKey) {
    return _$onSubmitAsyncAction.run(() => super.onSubmit(formKey));
  }

  @override
  String toString() {
    return '''
isPregnant: ${isPregnant},
isSmoker: ${isSmoker},
isAlcohol: ${isAlcohol},
hasAllergy: ${hasAllergy},
hasChronicDisease: ${hasChronicDisease}
    ''';
  }
}
