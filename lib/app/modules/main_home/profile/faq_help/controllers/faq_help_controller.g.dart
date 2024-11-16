// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'faq_help_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$FaqHelpController on _FaqHelpController, Store {
  late final _$currentPageAtom =
      Atom(name: '_FaqHelpController.currentPage', context: context);

  @override
  int get currentPage {
    _$currentPageAtom.reportRead();
    return super.currentPage;
  }

  @override
  set currentPage(int value) {
    _$currentPageAtom.reportWrite(value, super.currentPage, () {
      super.currentPage = value;
    });
  }

  late final _$selectedItemAtom =
      Atom(name: '_FaqHelpController.selectedItem', context: context);

  @override
  FaqHelpItem? get selectedItem {
    _$selectedItemAtom.reportRead();
    return super.selectedItem;
  }

  @override
  set selectedItem(FaqHelpItem? value) {
    _$selectedItemAtom.reportWrite(value, super.selectedItem, () {
      super.selectedItem = value;
    });
  }

  late final _$filteredItemsAtom =
      Atom(name: '_FaqHelpController.filteredItems', context: context);

  @override
  ObservableList<FaqHelpItem> get filteredItems {
    _$filteredItemsAtom.reportRead();
    return super.filteredItems;
  }

  @override
  set filteredItems(ObservableList<FaqHelpItem> value) {
    _$filteredItemsAtom.reportWrite(value, super.filteredItems, () {
      super.filteredItems = value;
    });
  }

  late final _$faqHelpItemsAtom =
      Atom(name: '_FaqHelpController.faqHelpItems', context: context);

  @override
  ObservableList<FaqHelpItem> get faqHelpItems {
    _$faqHelpItemsAtom.reportRead();
    return super.faqHelpItems;
  }

  @override
  set faqHelpItems(ObservableList<FaqHelpItem> value) {
    _$faqHelpItemsAtom.reportWrite(value, super.faqHelpItems, () {
      super.faqHelpItems = value;
    });
  }

  late final _$isOpenListAtom =
      Atom(name: '_FaqHelpController.isOpenList', context: context);

  @override
  ObservableList<bool> get isOpenList {
    _$isOpenListAtom.reportRead();
    return super.isOpenList;
  }

  @override
  set isOpenList(ObservableList<bool> value) {
    _$isOpenListAtom.reportWrite(value, super.isOpenList, () {
      super.isOpenList = value;
    });
  }

  late final _$_FaqHelpControllerActionController =
      ActionController(name: '_FaqHelpController', context: context);

  @override
  void toggle(int index) {
    final _$actionInfo = _$_FaqHelpControllerActionController.startAction(
        name: '_FaqHelpController.toggle');
    try {
      return super.toggle(index);
    } finally {
      _$_FaqHelpControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void onSearch(String value) {
    final _$actionInfo = _$_FaqHelpControllerActionController.startAction(
        name: '_FaqHelpController.onSearch');
    try {
      return super.onSearch(value);
    } finally {
      _$_FaqHelpControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void onSelectItem(FaqHelpItem helpItem) {
    final _$actionInfo = _$_FaqHelpControllerActionController.startAction(
        name: '_FaqHelpController.onSelectItem');
    try {
      return super.onSelectItem(helpItem);
    } finally {
      _$_FaqHelpControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
currentPage: ${currentPage},
selectedItem: ${selectedItem},
filteredItems: ${filteredItems},
faqHelpItems: ${faqHelpItems},
isOpenList: ${isOpenList}
    ''';
  }
}
