import 'package:mobx/mobx.dart';

part 'login_controller.g.dart';

class LoginController = _LoginController with _$LoginController;

abstract class _LoginController with Store {
  @observable
  bool isPasswordVisible = false;

  @action
  void togglePasswordVisibility() {
    isPasswordVisible = !isPasswordVisible;
  }
}