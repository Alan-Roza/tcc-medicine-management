// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'treatment_card_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TreatmentCardController on TreatmentCardControllerBase, Store {
  late final _$isSelectedAtom =
      Atom(name: 'TreatmentCardControllerBase.isSelected', context: context);

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

  late final _$TreatmentCardControllerBaseActionController =
      ActionController(name: 'TreatmentCardControllerBase', context: context);

  @override
  void toggleSelection() {
    final _$actionInfo = _$TreatmentCardControllerBaseActionController
        .startAction(name: 'TreatmentCardControllerBase.toggleSelection');
    try {
      return super.toggleSelection();
    } finally {
      _$TreatmentCardControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeSelection() {
    final _$actionInfo = _$TreatmentCardControllerBaseActionController
        .startAction(name: 'TreatmentCardControllerBase.removeSelection');
    try {
      return super.removeSelection();
    } finally {
      _$TreatmentCardControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addSelection() {
    final _$actionInfo = _$TreatmentCardControllerBaseActionController
        .startAction(name: 'TreatmentCardControllerBase.addSelection');
    try {
      return super.addSelection();
    } finally {
      _$TreatmentCardControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isSelected: ${isSelected}
    ''';
  }
}
