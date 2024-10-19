// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medicine_view_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MedicineViewController on _MedicineViewController, Store {
  late final _$selectedIndexAtom =
      Atom(name: '_MedicineViewController.selectedIndex', context: context);

  @override
  int get selectedIndex {
    _$selectedIndexAtom.reportRead();
    return super.selectedIndex;
  }

  @override
  set selectedIndex(int value) {
    _$selectedIndexAtom.reportWrite(value, super.selectedIndex, () {
      super.selectedIndex = value;
    });
  }

  late final _$getByIdMedicineAsyncAction =
      AsyncAction('_MedicineViewController.getByIdMedicine', context: context);

  @override
  Future<MedicineViewResponseDto> getByIdMedicine(int medicineId) {
    return _$getByIdMedicineAsyncAction
        .run(() => super.getByIdMedicine(medicineId));
  }

  late final _$_MedicineViewControllerActionController =
      ActionController(name: '_MedicineViewController', context: context);

  @override
  void setSelectedIndex(int index) {
    final _$actionInfo = _$_MedicineViewControllerActionController.startAction(
        name: '_MedicineViewController.setSelectedIndex');
    try {
      return super.setSelectedIndex(index);
    } finally {
      _$_MedicineViewControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void reset() {
    final _$actionInfo = _$_MedicineViewControllerActionController.startAction(
        name: '_MedicineViewController.reset');
    try {
      return super.reset();
    } finally {
      _$_MedicineViewControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
selectedIndex: ${selectedIndex}
    ''';
  }
}
