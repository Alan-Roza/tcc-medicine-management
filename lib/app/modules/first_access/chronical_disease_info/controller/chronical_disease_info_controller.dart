import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:tcc_medicine_management/app/modules/first_access/chronical_disease_info/model/dto/chronical_disease_info_dto.dart';
import 'package:tcc_medicine_management/app/modules/first_access/chronical_disease_info/repository/chronical_disease_info_repository.dart';
import 'package:tcc_medicine_management/main.dart';

part 'chronical_disease_info_controller.g.dart';

class ChronicalDiseaseInfoController = _ChronicalDiseaseInfoController with _$ChronicalDiseaseInfoController;

abstract class _ChronicalDiseaseInfoController with Store {
  final ChronicalDiseaseInfoRepository _chronicalDiseaseInfoRepository = getIt<ChronicalDiseaseInfoRepository>();

  @observable
  bool hasHypertension = false;

  @observable
  bool hasDiabetes = false;

  @observable
  bool hasAlzheimer = false;

  @observable
  bool hasParkinsonDisease= false;

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

  void setParkinsonDisease(bool value) {
    hasParkinsonDisease = value;
  }

  @action
  Future<List<ChronicalDiseaseInfoDto>> onSubmit() async {
    try {
      // TODO: will be implemented at future
      // if (!formKey.currentState!.validate()) {
      //   return Future.error('Preencha os campos corretamente!');
      // }

      if (hasHypertension) {
        otherDiseases.add('Hipertensão');
      }
      if (hasDiabetes) {
        otherDiseases.add('Diabetes');
      }
      if (hasAlzheimer) {
        otherDiseases.add('Alzheimer');
      }
      if (hasParkinsonDisease) {
        otherDiseases.add('Doença de Parkinson');
      }
      if (hasOsteoporosis) {
        otherDiseases.add('Osteoporose');
      }

      final List<ChronicalDiseaseInfoDto> diseaseInfo = otherDiseases.map((disease) => ChronicalDiseaseInfoDto(disease: disease)).toList();

      final List<ChronicalDiseaseInfoDto> dataResponse = await _chronicalDiseaseInfoRepository.exec(diseaseInfo);

      return dataResponse;
    } catch (e) {
      return Future.error(e.toString());
    }
  }
}
