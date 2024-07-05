import 'package:mobx/mobx.dart';

part 'signup_controller.g.dart';

class SignupController = _SignupController with _$SignupController;

abstract class _SignupController with Store {
  @observable
  bool isPasswordVisible = false;

  @observable
  bool isConfirmVisible = false;

  @observable
  String email = '';
  
  @action
  void togglePasswordVisibility() {
    isPasswordVisible = !isPasswordVisible;
  }

  @action
  void toggleConfirmPasswordVisibility() {
    isConfirmVisible = !isConfirmVisible;
  }

  @action
  void setEmail(String value) {
    email = value;
  }

  @action
  void clearEmail() {
    email = '';
  }
}