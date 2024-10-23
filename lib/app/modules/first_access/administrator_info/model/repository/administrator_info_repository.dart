import 'package:tcc_medicine_management/app/modules/first_access/administrator_info/model/dto/administrator_info_dto.dart';
import 'package:tcc_medicine_management/app/modules/first_access/administrator_info/model/dto/administrator_request_info_dto.dart';

abstract class IAdministratorInfoRepository {
  Future<void> exec(AdministratorRequestDto data);
  Future<AdministratorInfoResponseDto> getAdministratorInfos(AdministratorRequestDto data);
}