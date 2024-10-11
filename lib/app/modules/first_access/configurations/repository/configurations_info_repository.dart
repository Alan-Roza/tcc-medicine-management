import 'package:tcc_medicine_management/app/core/infra/api_service.dart';
import 'package:tcc_medicine_management/app/core/infra/error_handler.dart';
import 'package:tcc_medicine_management/app/core/infra/network_info.dart';
import 'package:tcc_medicine_management/app/modules/first_access/configurations/model/dto/configurations_info_dto.dart';
import 'package:tcc_medicine_management/app/modules/first_access/configurations/model/repository/configurations_info_repository.dart';

class ConfigurationsInfoRepository implements IConfigurationsInfoRepository {
  final NetworkInfo _networkInfo;
  final ApiService _apiService;

  ConfigurationsInfoRepository(this._networkInfo, this._apiService);

  @override
  Future<ConfigurationsInfoDto> exec(ConfigurationsInfoDto data) async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _apiService.post(
          endPoint: "/User/Preferences", 
          data: data.toJson()
        );

        final configurations = ConfigurationsInfoDto.fromJson(response.data);
        
      
        return configurations;
      } 
      catch (error) {
        return handleError(error) as dynamic;
      }
    } else {
      // Throws an exception when there is no internet connection
      return Future.error("Verifique o acesso à internet");
    }
  }
}
