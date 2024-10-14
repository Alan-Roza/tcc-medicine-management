// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medicine_stock_list_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MedicineStockListController on _MedicineStockListController, Store {
  late final _$searchAtom =
      Atom(name: '_MedicineStockListController.search', context: context);

  @override
  String get search {
    _$searchAtom.reportRead();
    return super.search;
  }

  @override
  set search(String value) {
    _$searchAtom.reportWrite(value, super.search, () {
      super.search = value;
    });
  }

  late final _$medicineCardsAtom = Atom(
      name: '_MedicineStockListController.medicineCards', context: context);

  @override
  ObservableList<MedicineCardController> get medicineCards {
    _$medicineCardsAtom.reportRead();
    return super.medicineCards;
  }

  @override
  set medicineCards(ObservableList<MedicineCardController> value) {
    _$medicineCardsAtom.reportWrite(value, super.medicineCards, () {
      super.medicineCards = value;
    });
  }

  late final _$multiSelectionIsEnabledAtom = Atom(
      name: '_MedicineStockListController.multiSelectionIsEnabled',
      context: context);

  @override
  bool get multiSelectionIsEnabled {
    _$multiSelectionIsEnabledAtom.reportRead();
    return super.multiSelectionIsEnabled;
  }

  @override
  set multiSelectionIsEnabled(bool value) {
    _$multiSelectionIsEnabledAtom
        .reportWrite(value, super.multiSelectionIsEnabled, () {
      super.multiSelectionIsEnabled = value;
    });
  }

  late final _$deleteMedicinesAsyncAction = AsyncAction(
      '_MedicineStockListController.deleteMedicines',
      context: context);

  @override
  Future<void> deleteMedicines(List<int> ids) {
    return _$deleteMedicinesAsyncAction.run(() => super.deleteMedicines(ids));
  }

  late final _$getListMedicinesAsyncAction = AsyncAction(
      '_MedicineStockListController.getListMedicines',
      context: context);

  @override
  Future<void> getListMedicines(MedicineListRequestDto? parameters) {
    return _$getListMedicinesAsyncAction
        .run(() => super.getListMedicines(parameters));
  }

  late final _$_MedicineStockListControllerActionController =
      ActionController(name: '_MedicineStockListController', context: context);

  @override
  void enableMultiSelection() {
    final _$actionInfo = _$_MedicineStockListControllerActionController
        .startAction(name: '_MedicineStockListController.enableMultiSelection');
    try {
      return super.enableMultiSelection();
    } finally {
      _$_MedicineStockListControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void disableMultiSelection() {
    final _$actionInfo =
        _$_MedicineStockListControllerActionController.startAction(
            name: '_MedicineStockListController.disableMultiSelection');
    try {
      return super.disableMultiSelection();
    } finally {
      _$_MedicineStockListControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void _resetSelectedTasks() {
    final _$actionInfo = _$_MedicineStockListControllerActionController
        .startAction(name: '_MedicineStockListController._resetSelectedTasks');
    try {
      return super._resetSelectedTasks();
    } finally {
      _$_MedicineStockListControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void selectAllCards(bool? value) {
    final _$actionInfo = _$_MedicineStockListControllerActionController
        .startAction(name: '_MedicineStockListController.selectAllCards');
    try {
      return super.selectAllCards(value);
    } finally {
      _$_MedicineStockListControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeSelectedTasks() {
    final _$actionInfo = _$_MedicineStockListControllerActionController
        .startAction(name: '_MedicineStockListController.removeSelectedTasks');
    try {
      return super.removeSelectedTasks();
    } finally {
      _$_MedicineStockListControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
search: ${search},
medicineCards: ${medicineCards},
multiSelectionIsEnabled: ${multiSelectionIsEnabled}
    ''';
  }
}
