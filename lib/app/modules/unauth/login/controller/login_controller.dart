import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'login_controller.g.dart';

class LoginController = _LoginController with _$LoginController;

abstract class _LoginController with Store {
  @observable
  bool isPasswordVisible = false;

  @observable
  String email = '';

  @observable
  String password = '';

  @action
  void togglePasswordVisibility() {
    isPasswordVisible = !isPasswordVisible;
  }

  @action
  void setEmail(String value) => email = value;

  @action
  void setPassword(String value) => password = value;

  @action
  Future<String?> submitLogin(GlobalKey<FormState> formKey) async {
    if (formKey.currentState!.validate()) {
      return null;
    }

    return 'Não foi possível realizar o login, tente novamente mais tarde.';
  }

  @computed
  bool get isEmailValid => email.contains('@');

  @computed
  String? get emailError {
    if (email.isEmpty || !isEmailValid) {
      return 'Por favor, insira um e-mail válido';
    }
    return null;
  }

  @computed
  bool get isPasswordValid => password.length >= 6;

  @computed
  String? get passwordError {
    if (password.isEmpty || !isPasswordValid) {
      return 'A senha deve conter pelo menos 6 caracteres';
    }
    return null;
  }
}
