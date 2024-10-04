import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:tcc_medicine_management/app/modules/unauth/login/repository/auth_repository.dart';
import 'package:tcc_medicine_management/main.dart';

part 'login_controller.g.dart';

class LoginController = _LoginController with _$LoginController;

abstract class _LoginController with Store {
  final AuthRepository _authRepository = getIt<AuthRepository>();

  @observable
  bool isPasswordVisible = false;

  @observable
  String email = 'alan2@teste.com'; // TODO: dont forget to remove this default value

  @observable
  String password = 'alan123'; // TODO: dont forget to remove this default value

  @action
  void togglePasswordVisibility() {
    isPasswordVisible = !isPasswordVisible;
  }

  @action
  void setEmail(String value) => email = value;

  @action
  void setPassword(String value) => password = value;

  @action
  Future<dynamic> onSubmitLogin(GlobalKey<FormState> formKey) async {
    // Verifica se o formulário é válido
    if (!formKey.currentState!.validate()) {
      return null;
    }

    try {
      // Faz a chamada para o login usando o repositório
      // // final loginResponse = await _authRepository.login(email, password);

      // // print('-------------------->');
      // // print(loginResponse);

      // Atualiza propriedades observáveis com os dados do perfil do usuário, se necessário
      // Exemplo:
      // userProfile = loginResponse.userProfile;

      // Retorna uma mensagem de sucesso
      return 'Login efetuado com sucesso';
    } catch (e) {
      return e.toString();
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
}
