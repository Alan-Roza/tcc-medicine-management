import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'health_info_controller.g.dart';

class HealthInfoController = _HealthInfoController with _$HealthInfoController;

abstract class _HealthInfoController with Store {
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

  void dispose() {
    height.dispose();
    weight.dispose();
  }
}
