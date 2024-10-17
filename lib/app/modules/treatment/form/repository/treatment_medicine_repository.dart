import 'package:tcc_medicine_management/app/core/infra/api_service.dart';
import 'package:tcc_medicine_management/app/core/infra/error_handler.dart';
import 'package:tcc_medicine_management/app/core/infra/network_info.dart';
import 'package:tcc_medicine_management/app/modules/treatment/form/model/dto/treatment_medicine_dto.dart';
import 'package:tcc_medicine_management/app/modules/treatment/form/model/repository/treatment_medicine_repository.dart';

class TreatmentMedicineRepository implements ITreatmentMedicineRepository {
  final NetworkInfo _networkInfo;
  final ApiService _apiService;

  TreatmentMedicineRepository(this._networkInfo, this._apiService);

  @override
  Future<TreatmentMedicineDto> exec(TreatmentMedicineDto data) async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _apiService.post(
          endPoint: "/Treatment",
          data: data.toJson(),
        );

        final dataResponse = TreatmentMedicineDto.fromJson({}); // use response.data instead {}

        return dataResponse;
      } catch (error) {
        return handleError(error) as dynamic;
      }
    } else {
      // Throws an exception when there is no internet connection
      return Future.error("Verifique o acesso à internet");
    }
  }

  @override
  Future<List<Map<String, String>>> resource() async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _apiService.get(
          endPoint: "/Medicine/ListNames",
        );

        final Map<String, dynamic> jsonResponse = response.data;

        final List<Map<String, String>> dataResponse = jsonResponse.entries.map((entry) {
          return {
            "id": entry.key,
            "name": entry.value.toString(),
          };
        }).toList();

        return dataResponse;
      } catch (error) {
        return handleError(error) as dynamic;
      }
    } else {
      // Throws an exception when there is no internet connection
      return Future.error("Verifique o acesso à internet");
    }
  }
}
