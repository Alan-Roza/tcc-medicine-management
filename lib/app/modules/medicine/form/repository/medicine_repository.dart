import 'package:tcc_medicine_management/app/core/infra/api_service.dart';
import 'package:tcc_medicine_management/app/core/infra/error_handler.dart';
import 'package:tcc_medicine_management/app/core/infra/network_info.dart';
import 'package:tcc_medicine_management/app/modules/medicine/form/model/medicine_dto.dart';
import 'package:tcc_medicine_management/app/modules/medicine/form/model/repository/medicine_repository.dart';

class MedicineRepository implements IMedicineRepository {
  final NetworkInfo _networkInfo;
  final ApiService _apiService;

  MedicineRepository(this._networkInfo, this._apiService);

  @override
  Future<MedicineDto> exec(MedicineDto data) async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _apiService.post(
          endPoint: "/Medicine", 
          data: data.toJson(),
        );

        final dataResponse = MedicineDto.fromJson(response.data);
      
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
