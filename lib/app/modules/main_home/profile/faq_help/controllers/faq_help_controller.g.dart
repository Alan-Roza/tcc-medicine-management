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

  late final _$_FaqHelpControllerActionController =
      ActionController(name: '_FaqHelpController', context: context);

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
  String toString() {
    return '''
currentPage: ${currentPage}
    ''';
  }
}
