// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'treatment_view_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TreatmentViewController on _TreatmentViewController, Store {
  late final _$selectedIndexAtom =
      Atom(name: '_TreatmentViewController.selectedIndex', context: context);

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

  late final _$getByTreatmentIdAsyncAction = AsyncAction(
      '_TreatmentViewController.getByTreatmentId',
      context: context);

  @override
  Future<TreatmentViewResponseDto> getByTreatmentId(int treatmentId) {
    return _$getByTreatmentIdAsyncAction
        .run(() => super.getByTreatmentId(treatmentId));
  }

  late final _$_TreatmentViewControllerActionController =
      ActionController(name: '_TreatmentViewController', context: context);

  @override
  void setSelectedIndex(int index) {
    final _$actionInfo = _$_TreatmentViewControllerActionController.startAction(
        name: '_TreatmentViewController.setSelectedIndex');
    try {
      return super.setSelectedIndex(index);
    } finally {
      _$_TreatmentViewControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
selectedIndex: ${selectedIndex}
    ''';
  }
}
