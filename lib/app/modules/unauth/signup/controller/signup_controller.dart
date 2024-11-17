import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:tcc_medicine_management/app/modules/unauth/login/model/dto/signup_response_dto.dart';
import 'package:tcc_medicine_management/app/modules/unauth/login/repository/auth_repository.dart';
import 'package:tcc_medicine_management/main.dart';

part 'signup_controller.g.dart';

class SignupController = _SignupController with _$SignupController;

abstract class _SignupController with Store {
  final AuthRepository _authRepository = getIt<AuthRepository>();

  @observable
  String email = '';

  @observable
  String password = '';

  @observable
  String confirmPassword = '';

  @action
  void setEmail(String value) {
    email = value;
  }

  @action
  void setPassword(String value) => password = value;

  @action
  void setConfirmPassword(String value) => password = value;

  @action
  void clearEmail() {
    email = '';
  }

  @action
  Future<SignupResponseDto> onSignup(GlobalKey<FormState> formKey) async {
    // Verifica se o formulário é válido
    if (!formKey.currentState!.validate()) {
      return Future.error('Por favor, preencha os campos corretamente');
    }

    try {
      // Faz a chamada para o login usando o repositório
      final signupResponse = await _authRepository.signup(email, password);
      // Atualiza propriedades observáveis com os dados do perfil do usuário, se necessário
      // Exemplo:
      // userProfile = loginResponse.userProfile;

      // Retorna uma mensagem de sucesso
      return signupResponse;
    } catch (e) {
      return Future.error(e.toString());
    }
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

  @computed
  bool get isConfirmPasswordValid => confirmPassword == password;

  @computed
  String? get confirmPasswordError {
    if (password.isEmpty || !isPasswordValid) {
      return 'As senhas não conferem';
    }
    return null;
  }
}
