import 'package:tcc_medicine_management/app/modules/first_access/configurations/model/dto/configurations_info_dto.dart';

abstract class IConfigurationsInfoRepository {
  Future<ConfigurationsInfoDto> exec(ConfigurationsInfoDto data);
  Future<void> saveChannel(int channelId);
  Future<void> removeChannel(int channelId);
}