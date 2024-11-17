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
  Future<List<ChronicalDiseaseInfoDto>> onSubmit(int? id) async {
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

      if (otherDiseases.isEmpty) {
        return Future.error('É necessário ter ao menos uma doença crônica.');
      }

      final List<ChronicalDiseaseInfoDto> diseaseInfo = otherDiseases.map((disease) => ChronicalDiseaseInfoDto(disease: disease)).toList();

      final List<ChronicalDiseaseInfoDto> dataResponse = await _chronicalDiseaseInfoRepository.exec(diseaseInfo, id);

      return dataResponse;
    } catch (e) {
      return Future.error(e.toString());
    }
  }

   @action
  Future<List<ChronicalDiseaseInfoDto>> getDiseases() async {
    try {
      final List<ChronicalDiseaseInfoDto> dataResponse = await _chronicalDiseaseInfoRepository.getDiseases();
      return dataResponse;
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  @action
  void dispose() {
    diseasesController.clear();
    otherDiseases.clear();
    hasHypertension = false;
    hasDiabetes = false;
    hasAlzheimer = false;
    hasParkinsonDisease = false;
    hasOsteoporosis = false;
  }
}
