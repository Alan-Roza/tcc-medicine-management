import 'package:tcc_medicine_management/app/core/infra/api_service.dart';
import 'package:tcc_medicine_management/app/core/infra/error_handler.dart';
import 'package:tcc_medicine_management/app/core/infra/network_info.dart';
import 'package:tcc_medicine_management/app/modules/treatment/list/model/dto/treatment_list_dto.dart';
import 'package:tcc_medicine_management/app/modules/treatment/list/model/dto/treatment_list_request.dart';
import 'package:tcc_medicine_management/app/modules/treatment/list/model/repository/treatment_list_repository.dart';

class TreatmentListRepository implements ITreatmentListRepository {
  final NetworkInfo _networkInfo;
  final ApiService _apiService;

  TreatmentListRepository(this._networkInfo, this._apiService);

  @override
  Future<List<TreatmentListDto>> exec(TreatmentListRequestDto? data) async {
    if (await _networkInfo.isConnected) {
      try {
        final params = data?.toJson();

        if (params != null && params.containsKey('search')) {
          final searchValue = params.remove('search');
          params['Name'] = searchValue;
        }

        final response = await _apiService.get(
          endPoint: "/Treatment/List",
          params: params,
        );

        final List<TreatmentListDto> dataResponse = (response.data as List)
          .map((item) => TreatmentListDto.fromJson(item))
          .toList();

        // final dataResponse = TreatmentListDto.fromJson(response.data);

        return dataResponse;
      } catch (error) {
        return Future.error(handleError(error));
      }
    } else {
      // Throws an exception when there is no internet connection
      return Future.error("Verifique o acesso à internet");
    }
  }

  @override
  Future<bool> delete(int id) async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _apiService.delete(endPoint: "/Treatment/$id");

        if (response.statusCode == 200) {
          return true;
        } else {
          return false;
        }
      } catch (error) {
        return Future.error(handleError(error));
      }
    } else {
      // Throws an exception when there is no internet connection
      return Future.error("Verifique o acesso à internet");
    }
  }
}
