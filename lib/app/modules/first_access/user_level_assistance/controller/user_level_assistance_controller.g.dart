// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_level_assistance_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$UserLevelAssistanceController on _UserLevelAssistanceController, Store {
  late final _$currentPageAtom = Atom(
      name: '_UserLevelAssistanceController.currentPage', context: context);

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

  late final _$assistanceRequiredAtom = Atom(
      name: '_UserLevelAssistanceController.assistanceRequired',
      context: context);

  @override
  bool get assistanceRequired {
    _$assistanceRequiredAtom.reportRead();
    return super.assistanceRequired;
  }

  @override
  set assistanceRequired(bool value) {
    _$assistanceRequiredAtom.reportWrite(value, super.assistanceRequired, () {
      super.assistanceRequired = value;
    });
  }

  late final _$_UserLevelAssistanceControllerActionController =
      ActionController(
          name: '_UserLevelAssistanceController', context: context);

  @override
  void setPage(int page) {
    final _$actionInfo = _$_UserLevelAssistanceControllerActionController
        .startAction(name: '_UserLevelAssistanceController.setPage');
    try {
      return super.setPage(page);
    } finally {
      _$_UserLevelAssistanceControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void toggleAssistance() {
    final _$actionInfo = _$_UserLevelAssistanceControllerActionController
        .startAction(name: '_UserLevelAssistanceController.toggleAssistance');
    try {
      return super.toggleAssistance();
    } finally {
      _$_UserLevelAssistanceControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
currentPage: ${currentPage},
assistanceRequired: ${assistanceRequired}
    ''';
  }
}
