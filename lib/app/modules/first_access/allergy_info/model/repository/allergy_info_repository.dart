import 'package:tcc_medicine_management/app/modules/first_access/allergy_info/model/dto/allergy_info_dto.dart';

abstract class IAllergyInfoRepository {
  Future<List<AllergyInfoDto>> exec(List<AllergyInfoDto> data);
}