// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medicine_card_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MedicineCardController on MedicineCardControllerBase, Store {
  late final _$isSelectedAtom =
      Atom(name: 'MedicineCardControllerBase.isSelected', context: context);

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

  late final _$MedicineCardControllerBaseActionController =
      ActionController(name: 'MedicineCardControllerBase', context: context);

  @override
  void toggleSelection() {
    final _$actionInfo = _$MedicineCardControllerBaseActionController
        .startAction(name: 'MedicineCardControllerBase.toggleSelection');
    try {
      return super.toggleSelection();
    } finally {
      _$MedicineCardControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeSelection() {
    final _$actionInfo = _$MedicineCardControllerBaseActionController
        .startAction(name: 'MedicineCardControllerBase.removeSelection');
    try {
      return super.removeSelection();
    } finally {
      _$MedicineCardControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addSelection() {
    final _$actionInfo = _$MedicineCardControllerBaseActionController
        .startAction(name: 'MedicineCardControllerBase.addSelection');
    try {
      return super.addSelection();
    } finally {
      _$MedicineCardControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isSelected: ${isSelected}
    ''';
  }
}
