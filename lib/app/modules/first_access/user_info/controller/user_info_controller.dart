import 'package:mobx/mobx.dart';

part 'user_info_controller.g.dart';

class UserInfoController = _UserInfoController with _$UserInfoController;

abstract class _UserInfoController with Store {
  @observable
  String name = '';

  @observable
  String birthDate = '';

  @observable
  String gender = '';

  @observable
  String phone = '';

  @action
  void clearName() {
    name = '';
  }

  @action
  void clearBirthDate() {
    birthDate = '';
  }

  @action
  void clearGender() {
    gender = '';
  }

  @action
  void clearPhone() {
    phone = '';
  }
}
