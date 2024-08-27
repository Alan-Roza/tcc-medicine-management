// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'connection_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ConnectionController on _ConnectionController, Store {
  late final _$drawerItemsAtom =
      Atom(name: '_ConnectionController.drawerItems', context: context);

  @override
  ObservableList<String> get drawerItems {
    _$drawerItemsAtom.reportRead();
    return super.drawerItems;
  }

  @override
  set drawerItems(ObservableList<String> value) {
    _$drawerItemsAtom.reportWrite(value, super.drawerItems, () {
      super.drawerItems = value;
    });
  }

  late final _$_ConnectionControllerActionController =
      ActionController(name: '_ConnectionController', context: context);

  @override
  void addItem(List<String> connections) {
    final _$actionInfo = _$_ConnectionControllerActionController.startAction(
        name: '_ConnectionController.addItem');
    try {
      return super.addItem(connections);
    } finally {
      _$_ConnectionControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeItem(String item) {
    final _$actionInfo = _$_ConnectionControllerActionController.startAction(
        name: '_ConnectionController.removeItem');
    try {
      return super.removeItem(item);
    } finally {
      _$_ConnectionControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
drawerItems: ${drawerItems}
    ''';
  }
}
