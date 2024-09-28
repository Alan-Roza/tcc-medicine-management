import 'package:tcc_medicine_management/app/core/infra/api_service.dart';
import 'package:tcc_medicine_management/app/core/infra/error_handler.dart';
import 'package:tcc_medicine_management/app/core/infra/network_info.dart';
import 'package:tcc_medicine_management/app/modules/medicine/view/model/dto/medicine_view_request_dto.dart';
import 'package:tcc_medicine_management/app/modules/medicine/view/model/dto/medicine_view_response_dto.dart';
import 'package:tcc_medicine_management/app/modules/medicine/view/model/repository/medicine_view_repository.dart';

class MedicineViewRepository implements IMedicineViewRepository {
  final NetworkInfo _networkInfo;
  final ApiService _apiService;

  MedicineViewRepository(this._networkInfo, this._apiService);

  @override
  Future<MedicineViewResponseDto> exec(MedicineViewRequestDto? data) async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _apiService.get(
          endPoint: "/Medicine/${data?.medicineId}", 
          params: data?.toJson(),
        );

        final dataResponse = MedicineViewResponseDto.fromJson(response.data);
      
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
