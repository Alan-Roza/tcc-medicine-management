import 'package:tcc_medicine_management/app/core/infra/api_service.dart';
import 'package:tcc_medicine_management/app/core/infra/error_handler.dart';
import 'package:tcc_medicine_management/app/core/infra/network_info.dart';
import 'package:tcc_medicine_management/app/modules/first_access/administrator_info/model/dto/administrator_info_dto.dart';
import 'package:tcc_medicine_management/app/modules/first_access/administrator_info/model/dto/administrator_request_info_dto.dart';
import 'package:tcc_medicine_management/app/modules/first_access/administrator_info/model/repository/administrator_info_repository.dart';

class AdministratorInfoRepository implements IAdministratorInfoRepository {
  final NetworkInfo _networkInfo;
  final ApiService _apiService;

  AdministratorInfoRepository(this._networkInfo, this._apiService);

  @override
  Future<void> exec(AdministratorRequestDto data) async {
    if (await _networkInfo.isConnected) {
      try {
        await _apiService.post(
          endPoint: "/Answerable",
          data: {
            "otp": data.otp,
          },
        );
      } catch (error) {
        return Future.error(handleError(error));
      }
    } else {
      // Throws an exception when there is no internet connection
      return Future.error("Verifique o acesso à internet");
    }
  }

  @override
  Future<AdministratorInfoResponseDto> getAdministratorInfos(AdministratorRequestDto data) async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _apiService.get(
          endPoint: "/Answerable/Valid",
          params: {
            "otp": data.otp,
          },
        );

        final dataResponse = AdministratorInfoResponseDto.fromJson(response.data);

        return dataResponse;
      } catch (error) {
        return Future.error(handleError(error));
      }
    } else {
      // Throws an exception when there is no internet connection
      return Future.error("Verifique o acesso à internet");
    }
  }
}
