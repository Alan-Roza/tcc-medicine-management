import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'user_info_controller.g.dart';

class UserInfoController = _UserInfoController with _$UserInfoController;

abstract class _UserInfoController with Store {
  @observable
  TextEditingController nameController = TextEditingController();
  TextEditingController birthDateController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  @action
  void setName(value) {
    nameController.text = value;
  }

  @action
  void clearName() {
    nameController.clear();
  }

  @action
  void clearBirthDate() {
    birthDateController.clear();
  }

  @action
  void clearGender() {
    genderController.clear();
  }

  @action
  void clearPhone() {
    phoneController.clear();
  }
}
