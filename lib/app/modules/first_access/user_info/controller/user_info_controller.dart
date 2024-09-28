import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';
import 'package:tcc_medicine_management/app/modules/first_access/user_info/model/dto/user_info_dto.dart';
import 'package:tcc_medicine_management/app/modules/first_access/user_info/repository/user_info_repository.dart';
import 'package:tcc_medicine_management/main.dart';

part 'user_info_controller.g.dart';

// ignore: constant_identifier_names
enum Gender { Masculino, Feminino }

class UserInfoController = _UserInfoController with _$UserInfoController;

abstract class _UserInfoController with Store {
  final UserInfoRepository _userInfoRepository = getIt<UserInfoRepository>();

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

  @computed
  String? get nameError {
    if (nameController.text.isEmpty) {
      return 'O campo Nome é obrigatório';
    }
    return null;
  }

  @action
  Future<UserInfoDto> onSubmit(GlobalKey<FormState> formKey) async {
    try {
      // TODO: will be implemented at future
      if (!formKey.currentState!.validate()) {
        return Future.error('Preencha os campos corretamente!');
      }

      final String name = nameController.text;
      final String? phone = phoneController.text.isNotEmpty ? phoneController.text : null;
      final String? birthDate = birthDateController.text.isNotEmpty
          ? DateFormat('yyyy-MM-ddTHH:mm:ss.SSSZ').format(DateFormat('dd/MM/yyyy').parse(birthDateController.text))
          : null;
      final UserInfoDto userInfo = UserInfoDto(
        name: name,
        telephone: phone,
        birthdate: birthDate,
        gender: gender.toString().split('.').last,
      );
      // final UserInfo userInfo = UserInfo(
      //   name: name,
      //   telephone: phone,
      //   birthdate: birthDate,
      //   gender: gender as String?,
      // );

      final UserInfoDto dataResponse = await _userInfoRepository.exec(userInfo);
      return dataResponse;
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  void dispose() {
    nameController.dispose();
    phoneController.dispose();
  }
}
