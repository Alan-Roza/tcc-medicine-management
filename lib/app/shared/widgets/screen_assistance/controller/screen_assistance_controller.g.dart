// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'screen_assistance_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ScreenAssistanceController on _ScreenAssistanceController, Store {
  late final _$currentPageAtom =
      Atom(name: '_ScreenAssistanceController.currentPage', context: context);

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

  late final _$_ScreenAssistanceControllerActionController =
      ActionController(name: '_ScreenAssistanceController', context: context);

  @override
  void setPage(int page) {
    final _$actionInfo = _$_ScreenAssistanceControllerActionController
        .startAction(name: '_ScreenAssistanceController.setPage');
    try {
      return super.setPage(page);
    } finally {
      _$_ScreenAssistanceControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void goToNextPage() {
    final _$actionInfo = _$_ScreenAssistanceControllerActionController
        .startAction(name: '_ScreenAssistanceController.goToNextPage');
    try {
      return super.goToNextPage();
    } finally {
      _$_ScreenAssistanceControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void goToPreviousPage() {
    final _$actionInfo = _$_ScreenAssistanceControllerActionController
        .startAction(name: '_ScreenAssistanceController.goToPreviousPage');
    try {
      return super.goToPreviousPage();
    } finally {
      _$_ScreenAssistanceControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
currentPage: ${currentPage}
    ''';
  }
}
