import 'package:tcc_medicine_management/app/core/infra/api_service.dart';
import 'package:tcc_medicine_management/app/core/infra/error_handler.dart';
import 'package:tcc_medicine_management/app/core/infra/network_info.dart';
import 'package:tcc_medicine_management/app/modules/treatment/view/model/dto/treatment_view_request_dto.dart';
import 'package:tcc_medicine_management/app/modules/treatment/view/model/dto/treatment_view_response_dto.dart';
import 'package:tcc_medicine_management/app/modules/treatment/view/model/repository/treatment_view_repository.dart';

class TreatmentViewRepository implements ITreatmentViewRepository {
  final NetworkInfo _networkInfo;
  final ApiService _apiService;

  TreatmentViewRepository(this._networkInfo, this._apiService);

  @override
  Future<TreatmentViewResponseDto> exec(TreatmentViewRequestDto? data) async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _apiService.get(
          endPoint: "/Treatment/${data?.treatmentId}",
          params: data?.toJson(),
        );

        // Convert dosage and frequency from double to int in the raw JSON data
        (response.data['medicines'] as List<dynamic>?)?.forEach((medicine) {
          medicine['dosage'] = (medicine['dosage'] as double?)?.toInt();
          medicine['frequency'] = (medicine['frequency'] as double?)?.toInt();
        });

        final dataResponse = TreatmentViewResponseDto.fromJson(response.data);

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
