import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'user_controller.g.dart';

class UserController = _UserController with _$UserController;

abstract class _UserController with Store {
  @observable
  String name = '';

  @observable
  int? userId;

  @observable
  int? patientId;

  @observable
  String? patientName;

  @observable
  String? userEmail;

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
    userId = null;
    patientId = null;
    patientName = null;
    userEmail = null;
    token = null;
  }

  // Reset the store's observable state
  void reset() {
    isLoggedIn = false;
    name = '';
    userId = null;
    patientId = null;
    patientName = null;
    userEmail = null;
    token = null;
  }

  @action
  Future<void> removePatient() async {
    patientId = null;
    patientName = null;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('patientId');
  }
}
