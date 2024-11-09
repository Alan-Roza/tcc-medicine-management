// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forgot_password_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ForgotPasswordController on _ForgotPasswordController, Store {
  Computed<bool>? _$isEmailValidComputed;

  @override
  bool get isEmailValid =>
      (_$isEmailValidComputed ??= Computed<bool>(() => super.isEmailValid,
              name: '_ForgotPasswordController.isEmailValid'))
          .value;
  Computed<String?>? _$emailErrorComputed;

  @override
  String? get emailError =>
      (_$emailErrorComputed ??= Computed<String?>(() => super.emailError,
              name: '_ForgotPasswordController.emailError'))
          .value;

  late final _$isPasswordVisibleAtom = Atom(
      name: '_ForgotPasswordController.isPasswordVisible', context: context);

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

  late final _$emailAtom =
      Atom(name: '_ForgotPasswordController.email', context: context);

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

  late final _$onSubmitAsyncAction =
      AsyncAction('_ForgotPasswordController.onSubmit', context: context);

  @override
  Future<dynamic> onSubmit(GlobalKey<FormState> formKey) {
    return _$onSubmitAsyncAction.run(() => super.onSubmit(formKey));
  }

  late final _$_ForgotPasswordControllerActionController =
      ActionController(name: '_ForgotPasswordController', context: context);

  @override
  void togglePasswordVisibility() {
    final _$actionInfo =
        _$_ForgotPasswordControllerActionController.startAction(
            name: '_ForgotPasswordController.togglePasswordVisibility');
    try {
      return super.togglePasswordVisibility();
    } finally {
      _$_ForgotPasswordControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setEmail(String value) {
    final _$actionInfo = _$_ForgotPasswordControllerActionController
        .startAction(name: '_ForgotPasswordController.setEmail');
    try {
      return super.setEmail(value);
    } finally {
      _$_ForgotPasswordControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isPasswordVisible: ${isPasswordVisible},
email: ${email},
isEmailValid: ${isEmailValid},
emailError: ${emailError}
    ''';
  }
}
