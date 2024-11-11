import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:tcc_medicine_management/app/modules/unauth/forgot_password/repository/forgot_password_repository.dart';
import 'package:tcc_medicine_management/main.dart';

part 'forgot_password_controller.g.dart';

class ForgotPasswordController = _ForgotPasswordController with _$ForgotPasswordController;

abstract class _ForgotPasswordController with Store {
  final ForgotPasswordRepository _forgotPasswordRepository = getIt<ForgotPasswordRepository>();

  @observable
  bool isPasswordVisible = false;

  @observable
  String email = ''; 

  @action
  void togglePasswordVisibility() {
    isPasswordVisible = !isPasswordVisible;
  }

  @action
  void setEmail(String value) => email = value;

  @action
  Future<dynamic> onSubmit(GlobalKey<FormState> formKey) async {
    // Verifica se o formulário é válido
    // if (!formKey.currentState!.validate()) {
    //   return Future.error('Por favor, preencha os campos corretamente');
    // }

    try {
      await _forgotPasswordRepository.exec(email);
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
}
