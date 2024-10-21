import 'package:tcc_medicine_management/app/core/infra/api_service.dart';
import 'package:tcc_medicine_management/app/core/infra/error_handler.dart';
import 'package:tcc_medicine_management/app/core/infra/network_info.dart';
import 'package:tcc_medicine_management/app/modules/first_access/health_info/model/dto/health_info_dto.dart';
import 'package:tcc_medicine_management/app/modules/first_access/health_info/model/repository/health_info_repository.dart';

class HealthInfoRepository implements IHealthInfoRepository {
  final NetworkInfo _networkInfo;
  final ApiService _apiService;

  HealthInfoRepository(this._networkInfo, this._apiService);

  @override
  Future<HealthInfoDto> exec(HealthInfoDto data) async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _apiService.post(
          endPoint: "/Patient/Detail", 
          data: data.toJson(),
        );

        final dataResponse = HealthInfoDto.fromJson(response.data);
      
        return dataResponse;
      } 
      catch (error) {
        return Future.error(handleError(error));
      }
    } else {
      // Throws an exception when there is no internet connection
      return Future.error("Verifique o acesso à internet");
    }
  }
}
