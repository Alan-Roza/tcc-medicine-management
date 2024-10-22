import 'package:tcc_medicine_management/app/modules/first_access/chronical_disease_info/model/dto/chronical_disease_info_dto.dart';

abstract class IChronicalDiseaseInfoRepository {
  Future<List<ChronicalDiseaseInfoDto>> exec(List<ChronicalDiseaseInfoDto> data, int? id);
  Future<List<ChronicalDiseaseInfoDto>> getDiseases();
}