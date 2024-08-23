// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'treatment_list_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TreatmentListController on _TreatmentListController, Store {
  late final _$treatmentCardsAtom =
      Atom(name: '_TreatmentListController.treatmentCards', context: context);

  @override
  ObservableList<TreatmentCardController> get treatmentCards {
    _$treatmentCardsAtom.reportRead();
    return super.treatmentCards;
  }

  @override
  set treatmentCards(ObservableList<TreatmentCardController> value) {
    _$treatmentCardsAtom.reportWrite(value, super.treatmentCards, () {
      super.treatmentCards = value;
    });
  }

  late final _$multiSelectionIsEnabledAtom = Atom(
      name: '_TreatmentListController.multiSelectionIsEnabled',
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

  late final _$_TreatmentListControllerActionController =
      ActionController(name: '_TreatmentListController', context: context);

  @override
  void createMedicineCardList() {
    final _$actionInfo = _$_TreatmentListControllerActionController.startAction(
        name: '_TreatmentListController.createMedicineCardList');
    try {
      return super.createMedicineCardList();
    } finally {
      _$_TreatmentListControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void enableMultiSelection() {
    final _$actionInfo = _$_TreatmentListControllerActionController.startAction(
        name: '_TreatmentListController.enableMultiSelection');
    try {
      return super.enableMultiSelection();
    } finally {
      _$_TreatmentListControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void disableMultiSelection() {
    final _$actionInfo = _$_TreatmentListControllerActionController.startAction(
        name: '_TreatmentListController.disableMultiSelection');
    try {
      return super.disableMultiSelection();
    } finally {
      _$_TreatmentListControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void _resetSelectedTasks() {
    final _$actionInfo = _$_TreatmentListControllerActionController.startAction(
        name: '_TreatmentListController._resetSelectedTasks');
    try {
      return super._resetSelectedTasks();
    } finally {
      _$_TreatmentListControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void selectAllCards(bool? value) {
    final _$actionInfo = _$_TreatmentListControllerActionController.startAction(
        name: '_TreatmentListController.selectAllCards');
    try {
      return super.selectAllCards(value);
    } finally {
      _$_TreatmentListControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeSelectedTasks() {
    final _$actionInfo = _$_TreatmentListControllerActionController.startAction(
        name: '_TreatmentListController.removeSelectedTasks');
    try {
      return super.removeSelectedTasks();
    } finally {
      _$_TreatmentListControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
treatmentCards: ${treatmentCards},
multiSelectionIsEnabled: ${multiSelectionIsEnabled}
    ''';
  }
}
