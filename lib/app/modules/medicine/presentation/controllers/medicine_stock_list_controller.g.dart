// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medicine_stock_list_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MedicineStockListController on _MedicineStockListController, Store {
  late final _$medicamentosAtom =
      Atom(name: '_MedicineStockListController.medicamentos', context: context);

  @override
  ObservableList<Medicamento> get medicamentos {
    _$medicamentosAtom.reportRead();
    return super.medicamentos;
  }

  @override
  set medicamentos(ObservableList<Medicamento> value) {
    _$medicamentosAtom.reportWrite(value, super.medicamentos, () {
      super.medicamentos = value;
    });
  }

  late final _$_MedicineStockListControllerActionController =
      ActionController(name: '_MedicineStockListController', context: context);

  @override
  void adicionarMedicamento(Medicamento medicamento) {
    final _$actionInfo = _$_MedicineStockListControllerActionController
        .startAction(name: '_MedicineStockListController.adicionarMedicamento');
    try {
      return super.adicionarMedicamento(medicamento);
    } finally {
      _$_MedicineStockListControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removerMedicamento(Medicamento medicamento) {
    final _$actionInfo = _$_MedicineStockListControllerActionController
        .startAction(name: '_MedicineStockListController.removerMedicamento');
    try {
      return super.removerMedicamento(medicamento);
    } finally {
      _$_MedicineStockListControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
medicamentos: ${medicamentos}
    ''';
  }
}
