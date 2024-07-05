// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signup_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SignupController on _SignupController, Store {
  late final _$isPasswordVisibleAtom =
      Atom(name: '_SignupController.isPasswordVisible', context: context);

  @override
  bool get isPasswordVisible {
    _$isPasswordVisibleAtom.reportRead();
    return super.isPasswordVisible;
  }

  @override
  set isPasswordVisible(bool value) {
    _$isPasswordVisibleAtom.reportWrite(value, super.isPasswordVisible, () {
      super.isPasswordVisible = value;
    });
  }

  late final _$isConfirmVisibleAtom =
      Atom(name: '_SignupController.isConfirmVisible', context: context);

  @override
  bool get isConfirmVisible {
    _$isConfirmVisibleAtom.reportRead();
    return super.isConfirmVisible;
  }

  @override
  set isConfirmVisible(bool value) {
    _$isConfirmVisibleAtom.reportWrite(value, super.isConfirmVisible, () {
      super.isConfirmVisible = value;
    });
  }

  late final _$emailAtom =
      Atom(name: '_SignupController.email', context: context);

  @override
  String get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  late final _$_SignupControllerActionController =
      ActionController(name: '_SignupController', context: context);

  @override
  void togglePasswordVisibility() {
    final _$actionInfo = _$_SignupControllerActionController.startAction(
        name: '_SignupController.togglePasswordVisibility');
    try {
      return super.togglePasswordVisibility();
    } finally {
      _$_SignupControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void toggleConfirmPasswordVisibility() {
    final _$actionInfo = _$_SignupControllerActionController.startAction(
        name: '_SignupController.toggleConfirmPasswordVisibility');
    try {
      return super.toggleConfirmPasswordVisibility();
    } finally {
      _$_SignupControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setEmail(String value) {
    final _$actionInfo = _$_SignupControllerActionController.startAction(
        name: '_SignupController.setEmail');
    try {
      return super.setEmail(value);
    } finally {
      _$_SignupControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clearEmail() {
    final _$actionInfo = _$_SignupControllerActionController.startAction(
        name: '_SignupController.clearEmail');
    try {
      return super.clearEmail();
    } finally {
      _$_SignupControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isPasswordVisible: ${isPasswordVisible},
isConfirmVisible: ${isConfirmVisible},
email: ${email}
    ''';
  }
}
