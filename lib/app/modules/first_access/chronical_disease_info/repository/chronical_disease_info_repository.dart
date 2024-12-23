import 'package:dio/dio.dart';
import 'package:tcc_medicine_management/app/core/infra/api_service.dart';
import 'package:tcc_medicine_management/app/core/infra/error_handler.dart';
import 'package:tcc_medicine_management/app/core/infra/network_info.dart';
import 'package:tcc_medicine_management/app/modules/first_access/chronical_disease_info/model/dto/chronical_disease_info_dto.dart';
import 'package:tcc_medicine_management/app/modules/first_access/chronical_disease_info/model/repository/chronical_disease_info_repository.dart';

class ChronicalDiseaseInfoRepository implements IChronicalDiseaseInfoRepository {
  final NetworkInfo _networkInfo;
  final ApiService _apiService;

  ChronicalDiseaseInfoRepository(this._networkInfo, this._apiService);

  List<ChronicalDiseaseInfoDto> parseDiseases(List<dynamic> jsonList) {
    return jsonList.map((json) => ChronicalDiseaseInfoDto.fromJson(json)).toList();
  }

  @override
  Future<List<ChronicalDiseaseInfoDto>> exec(List<ChronicalDiseaseInfoDto> data, int? id) async {
    if (await _networkInfo.isConnected) {
      try {
        late Response response;

        if (id != null) {
          response = await _apiService.put(
            endPoint: "/Patient/Disease",
            data: data.map((item) => item.toJson()).toList(),
          );
        } else {
          response = await _apiService.post(
            endPoint: "/Patient/Disease",
            data: data.map((item) => item.toJson()).toList(),
          );
        }

        List<ChronicalDiseaseInfoDto> diseases = parseDiseases(response.data);

        return diseases;
      } catch (error) {
        return Future.error(handleError(error));
      }
    } else {
      // Throws an exception when there is no internet connection
      return Future.error("Verifique o acesso à internet");
    }
  }

  @override
  Future<List<ChronicalDiseaseInfoDto>> getDiseases() async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _apiService.get(
          endPoint: "/Patient/Disease/AllDiseases",
        );

        List<ChronicalDiseaseInfoDto> diseases = parseDiseases(response.data);

        return diseases;
      } catch (error) {
        return Future.error(handleError(error));
      }
    } else {
      // Throws an exception when there is no internet connection
      return Future.error("Verifique o acesso à internet");
    }
  }
}
