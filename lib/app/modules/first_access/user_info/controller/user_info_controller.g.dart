// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_info_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$UserInfoController on _UserInfoController, Store {
  late final _$nameControllerAtom =
      Atom(name: '_UserInfoController.nameController', context: context);

  @override
  TextEditingController get nameController {
    _$nameControllerAtom.reportRead();
    return super.nameController;
  }

  @override
  set nameController(TextEditingController value) {
    _$nameControllerAtom.reportWrite(value, super.nameController, () {
      super.nameController = value;
    });
  }

  late final _$_UserInfoControllerActionController =
      ActionController(name: '_UserInfoController', context: context);

  @override
  void setName(dynamic value) {
    final _$actionInfo = _$_UserInfoControllerActionController.startAction(
        name: '_UserInfoController.setName');
    try {
      return super.setName(value);
    } finally {
      _$_UserInfoControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clearName() {
    final _$actionInfo = _$_UserInfoControllerActionController.startAction(
        name: '_UserInfoController.clearName');
    try {
      return super.clearName();
    } finally {
      _$_UserInfoControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clearBirthDate() {
    final _$actionInfo = _$_UserInfoControllerActionController.startAction(
        name: '_UserInfoController.clearBirthDate');
    try {
      return super.clearBirthDate();
    } finally {
      _$_UserInfoControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clearGender() {
    final _$actionInfo = _$_UserInfoControllerActionController.startAction(
        name: '_UserInfoController.clearGender');
    try {
      return super.clearGender();
    } finally {
      _$_UserInfoControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clearPhone() {
    final _$actionInfo = _$_UserInfoControllerActionController.startAction(
        name: '_UserInfoController.clearPhone');
    try {
      return super.clearPhone();
    } finally {
      _$_UserInfoControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
nameController: ${nameController}
    ''';
  }
}
