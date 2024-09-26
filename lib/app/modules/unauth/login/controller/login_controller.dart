import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:tcc_medicine_management/app/modules/unauth/login/repository/AuthRepository.dart';
import 'package:tcc_medicine_management/main.dart';

part 'login_controller.g.dart';

class LoginController = _LoginController with _$LoginController;

abstract class _LoginController with Store {
  final AuthRepository _authRepository = getIt<AuthRepository>();

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
  Future<String?> onSubmitLogin(GlobalKey<FormState> formKey) async {
    if (!formKey.currentState!.validate()) {
      return null;
    }

    try {
      await _authRepository.login(email, password);
      return 'Login efetuado com sucesso';
      // Update your observable properties with the user profile data
    } catch (e) {
      // Handle error
    }
    return null;
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
