import 'package:tcc_medicine_management/app/core/infra/api_service.dart';
import 'package:tcc_medicine_management/app/core/infra/error_handler.dart';
import 'package:tcc_medicine_management/app/core/infra/network_info.dart';
import 'package:tcc_medicine_management/app/modules/main_home/profile/connection/list/model/dto/connection_list_response_dto.dart';
import 'package:tcc_medicine_management/app/modules/main_home/profile/connection/list/model/repository/connection_list_repository.dart';

class ConnectionListRepository implements IConnectionListRepository {
  final NetworkInfo _networkInfo;
  final ApiService _apiService;

  ConnectionListRepository(this._networkInfo, this._apiService);

  @override
  Future<List<ConnectionListResponseDto>> exec() async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _apiService.get(
          endPoint: "/Drawer/List",
        );

        final dataResponse = ConnectionListResponseDto.fromJsonList(response.data);
        
        return dataResponse;
      } catch (error) {
        return handleError(error) as dynamic;
      }
    } else {
      // Throws an exception when there is no internet connection
      return Future.error("Verifique o acesso à internet");
    }
  }

// TODO: verify if will be necessary to implement this method
  // @override
  // Future<bool> delete(int id) async {
  //   if (await _networkInfo.isConnected) {
  //     try {
  //       final response = await _apiService.delete(
  //         endPoint: "/Medicine/$id"
  //       );

  //     if (response.statusCode == 200) {
  //       return true;
  //     } else {
  //       return false;
  //     }
  //     }
  //     catch (error) {
  //       return handleError(error) as dynamic;
  //     }
  //   } else {
  //     // Throws an exception when there is no internet connection
  //     return Future.error("Verifique o acesso à internet");
  //   }
  // }
}
