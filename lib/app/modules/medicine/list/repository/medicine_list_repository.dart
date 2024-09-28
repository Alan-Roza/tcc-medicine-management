import 'package:tcc_medicine_management/app/core/infra/api_service.dart';
import 'package:tcc_medicine_management/app/core/infra/error_handler.dart';
import 'package:tcc_medicine_management/app/core/infra/network_info.dart';
import 'package:tcc_medicine_management/app/modules/medicine/list/model/dto/medicine_list_dto.dart';
import 'package:tcc_medicine_management/app/modules/medicine/list/model/dto/medicine_list_request.dart';
import 'package:tcc_medicine_management/app/modules/medicine/list/model/repository/medicine_list_repository.dart';

class MedicineListRepository implements IMedicineListRepository {
  final NetworkInfo _networkInfo;
  final ApiService _apiService;

  MedicineListRepository(this._networkInfo, this._apiService);

  @override
  Future<MedicineListDto> exec(MedicineListRequestDto? data) async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _apiService.get(
          endPoint: "/Medicine/List", 
          params: data?.toJson(),
        );

        final dataResponse = MedicineListDto.fromJson(response.data);
      
        return dataResponse;
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
