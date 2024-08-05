// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medicine_stock_list_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MedicineStockListController on _MedicineStockListController, Store {
  late final _$cardItemsAtom =
      Atom(name: '_MedicineStockListController.cardItems', context: context);

  @override
  ObservableList<CardItem> get cardItems {
    _$cardItemsAtom.reportRead();
    return super.cardItems;
  }

  @override
  set cardItems(ObservableList<CardItem> value) {
    _$cardItemsAtom.reportWrite(value, super.cardItems, () {
      super.cardItems = value;
    });
  }

  late final _$_MedicineStockListControllerActionController =
      ActionController(name: '_MedicineStockListController', context: context);

  @override
  void addCard(CardItem item) {
    final _$actionInfo = _$_MedicineStockListControllerActionController
        .startAction(name: '_MedicineStockListController.addCard');
    try {
      return super.addCard(item);
    } finally {
      _$_MedicineStockListControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
cardItems: ${cardItems}
    ''';
  }
}
