import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';

part 'user_info_controller.g.dart';

// ignore: constant_identifier_names
enum Gender { Masculino, Feminino }

class UserInfoController = _UserInfoController with _$UserInfoController;

abstract class _UserInfoController with Store {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController birthDateController = TextEditingController();

  @observable
  Gender? gender;

  @action
  void setName(String value) {
    nameController.text = value;
  }

  @action
  void setBirthDate(DateTime value) {
    birthDateController.text = DateFormat('dd/MM/yyyy').format(value);
  }

  @action
  void setGender(Gender value) {
    gender = value;
  }

  @action
  void setPhone(String value) {
    phoneController.text = value;
  }

  @action
  void clearName() {
    nameController.clear();
  }

  @action
  void clearGender() {
    gender = null;
  }

  @action
  void clearPhone() {
    phoneController.clear();
  }

  void dispose() {
    nameController.dispose();
    phoneController.dispose();
  }
}
