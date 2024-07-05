import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'login_controller.g.dart';

class LoginController = _LoginController with _$LoginController;

abstract class _LoginController with Store {
  @observable
  bool isPasswordVisible = false;

  @observable
  TextEditingController emailController = TextEditingController();

  // @observable
  // String email = '';

  @action
  void togglePasswordVisibility() {
    isPasswordVisible = !isPasswordVisible;
  }

  @action
  void setEmail(String value) {
    // email = value;
  }

  @action
  void clearEmail() {
    emailController.clear();
    // emailController.text = '';
    // email = '';
  }

  @computed
  bool get hasEmailValue => emailController.text.isNotEmpty ? true : false;
}
