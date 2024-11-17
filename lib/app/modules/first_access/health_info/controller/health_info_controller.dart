import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:tcc_medicine_management/app/modules/first_access/health_info/model/dto/health_info_dto.dart';
import 'package:tcc_medicine_management/app/modules/first_access/health_info/repository/health_info_repository.dart';
import 'package:tcc_medicine_management/main.dart';

part 'health_info_controller.g.dart';

class HealthInfoController = _HealthInfoController with _$HealthInfoController;

abstract class _HealthInfoController with Store {
  final HealthInfoRepository _healthInfoRepository = getIt<HealthInfoRepository>();

  TextEditingController height = TextEditingController();
  TextEditingController weight = TextEditingController();

  @observable
  bool isPregnant = false;

  @observable
  bool isSmoker = false;

  @observable
  bool isAlcohol = false;

  @observable
  bool hasAllergy = false;

  @observable
  bool hasChronicDisease = false;

  void setHeight(String value) {
    height.text = value;
  }

  void setWeight(String value) {
    weight.text = value;
  }

  void setPregnant(bool value) {
    isPregnant = value;
  }

  void setSmoker(bool value) {
    isSmoker = value;
  }

  void setAlcohol(bool value) {
    isAlcohol = value;
  }

  void setAllergy(bool value) {
    hasAllergy = value;
  }

  void setChronicDisease(bool value) {
    hasChronicDisease = value;
  }

  @action
  Future<HealthInfoDto> onSubmit(GlobalKey<FormState> formKey, int? id) async {
    try {
      // TODO: will be implemented at future
      // if (!formKey.currentState!.validate()) {
      //   return Future.error('Preencha os campos corretamente!');
      // }

      if (height.text.isEmpty || double.tryParse(height.text.replaceAll('.', '').replaceAll(',', '.')) == null) {
        return Future.error('Altura inválida!');
      }

      if (weight.text.isEmpty || double.tryParse(weight.text.replaceAll('.', '').replaceAll(',', '.')) == null) {
        return Future.error('Peso inválido!');
      }

      final HealthInfoDto healthInfo = HealthInfoDto(
        height: double.parse(height.text.replaceAll('.', '').replaceAll(',', '.')),
        weight: double.parse(weight.text.replaceAll('.', '').replaceAll(',', '.')),
        pregnant: isPregnant,
        smoking: isSmoker,
        alcohol: isAlcohol,
      );

      final HealthInfoDto dataResponse = await _healthInfoRepository.exec(healthInfo, id);
      return dataResponse;
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  @action
  Future<HealthInfoDto> getHealth() async {
    try {
      final HealthInfoDto dataResponse = await _healthInfoRepository.getHealth();
      return dataResponse;
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  void dispose() {
    height.clear();
    weight.clear();
    isPregnant = false;
    isSmoker = false;
    isAlcohol = false;
    hasAllergy = false;
    hasChronicDisease = false;
  }
}
