import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'chronical_disease_info_controller.g.dart';

class ChronicalDiseaseInfoController = _ChronicalDiseaseInfoController with _$ChronicalDiseaseInfoController;

abstract class _ChronicalDiseaseInfoController with Store {
  @observable
  bool hasHypertension = false;

  @observable
  bool hasDiabetes = false;

  @observable
  bool hasAlzheimer = false;

  @observable
  bool hasOsteoporosis = false;

  final TextEditingController diseasesController = TextEditingController();

  @observable
  ObservableList<String> otherDiseases = ObservableList<String>();

  @action
  void addDisease(String disease) {
    final diseases = disease.split(',').map((e) => e.trim()).where((e) => e.isNotEmpty).toList();
    otherDiseases.addAll(diseases);
  }

  @action
  void removeDisease(String disease) {
    otherDiseases.remove(disease);
  }

  void setHypertension(bool value) {
    hasHypertension = value;
  }

  void setDiabetes(bool value) {
    hasDiabetes = value;
  }

  void setAlzheimer(bool value) {
    hasAlzheimer = value;
  }

  void setOsteoporosis(bool value) {
    hasOsteoporosis = value;
  }
}
