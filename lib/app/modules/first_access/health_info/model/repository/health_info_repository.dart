import 'package:tcc_medicine_management/app/modules/first_access/health_info/model/dto/health_info_dto.dart';

abstract class IHealthInfoRepository {
  Future<HealthInfoDto> exec(HealthInfoDto data);
}