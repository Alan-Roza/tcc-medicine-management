import 'package:mobx/mobx.dart';

part 'user_controller.g.dart';

class UserController = _UserController with _$UserController;

abstract class _UserController with Store {
  @observable
  String name = '';

  @observable
  int? userId;

  @observable
  String? token;

  @observable
  bool isLoggedIn = false;

  @action
  void login(String userName) {
    name = userName;
    isLoggedIn = true;
  }

  @action
  void logout() {
    isLoggedIn = false;
    name = '';
  }

  // Reset the store's observable state
  void reset() {
    isLoggedIn = false;
    name = '';
    userId = null;
  }
}
