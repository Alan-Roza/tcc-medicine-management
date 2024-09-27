// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signup_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SignupController on _SignupController, Store {
  Computed<bool>? _$isEmailValidComputed;

  @override
  bool get isEmailValid =>
      (_$isEmailValidComputed ??= Computed<bool>(() => super.isEmailValid,
              name: '_SignupController.isEmailValid'))
          .value;
  Computed<String?>? _$emailErrorComputed;

  @override
  String? get emailError =>
      (_$emailErrorComputed ??= Computed<String?>(() => super.emailError,
              name: '_SignupController.emailError'))
          .value;
  Computed<bool>? _$isPasswordValidComputed;

  @override
  bool get isPasswordValid =>
      (_$isPasswordValidComputed ??= Computed<bool>(() => super.isPasswordValid,
              name: '_SignupController.isPasswordValid'))
          .value;
  Computed<String?>? _$passwordErrorComputed;

  @override
  String? get passwordError =>
      (_$passwordErrorComputed ??= Computed<String?>(() => super.passwordError,
              name: '_SignupController.passwordError'))
          .value;
  Computed<bool>? _$isConfirmPasswordValidComputed;

  @override
  bool get isConfirmPasswordValid => (_$isConfirmPasswordValidComputed ??=
          Computed<bool>(() => super.isConfirmPasswordValid,
              name: '_SignupController.isConfirmPasswordValid'))
      .value;
  Computed<String?>? _$confirmPasswordErrorComputed;

  @override
  String? get confirmPasswordError => (_$confirmPasswordErrorComputed ??=
          Computed<String?>(() => super.confirmPasswordError,
              name: '_SignupController.confirmPasswordError'))
      .value;

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

  late final _$passwordAtom =
      Atom(name: '_SignupController.password', context: context);

  @override
  String get password {
    _$passwordAtom.reportRead();
    return super.password;
  }

  @override
  set password(String value) {
    _$passwordAtom.reportWrite(value, super.password, () {
      super.password = value;
    });
  }

  late final _$confirmPasswordAtom =
      Atom(name: '_SignupController.confirmPassword', context: context);

  @override
  String get confirmPassword {
    _$confirmPasswordAtom.reportRead();
    return super.confirmPassword;
  }

  @override
  set confirmPassword(String value) {
    _$confirmPasswordAtom.reportWrite(value, super.confirmPassword, () {
      super.confirmPassword = value;
    });
  }

  late final _$onSignupAsyncAction =
      AsyncAction('_SignupController.onSignup', context: context);

  @override
  Future<dynamic> onSignup(GlobalKey<FormState> formKey) {
    return _$onSignupAsyncAction.run(() => super.onSignup(formKey));
  }

  late final _$_SignupControllerActionController =
      ActionController(name: '_SignupController', context: context);

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
  void setPassword(String value) {
    final _$actionInfo = _$_SignupControllerActionController.startAction(
        name: '_SignupController.setPassword');
    try {
      return super.setPassword(value);
    } finally {
      _$_SignupControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setConfirmPassword(String value) {
    final _$actionInfo = _$_SignupControllerActionController.startAction(
        name: '_SignupController.setConfirmPassword');
    try {
      return super.setConfirmPassword(value);
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
email: ${email},
password: ${password},
confirmPassword: ${confirmPassword},
isEmailValid: ${isEmailValid},
emailError: ${emailError},
isPasswordValid: ${isPasswordValid},
passwordError: ${passwordError},
isConfirmPasswordValid: ${isConfirmPasswordValid},
confirmPasswordError: ${confirmPasswordError}
    ''';
  }
}
