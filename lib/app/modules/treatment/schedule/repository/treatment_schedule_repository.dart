import 'package:tcc_medicine_management/app/core/infra/api_service.dart';
import 'package:tcc_medicine_management/app/core/infra/error_handler.dart';
import 'package:tcc_medicine_management/app/core/infra/network_info.dart';
import 'package:tcc_medicine_management/app/modules/treatment/schedule/model/dto/treatment_schedule_response_dto.dart';
import 'package:tcc_medicine_management/app/modules/treatment/schedule/model/repository/treatment_schedule_repository.dart';

class TreatmentScheduleRepository implements ITreatmentScheduleRepository {
  final NetworkInfo _networkInfo;
  final ApiService _apiService;

  TreatmentScheduleRepository(this._networkInfo, this._apiService);

  @override
  Future<TreatmentScheduleResponseDto> exec(DateTime date) async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _apiService.get(
          endPoint: "/Treatment/ByDay",
          params: {
            "date": date.toIso8601String().split('.').first,
          },
        );

        final dataResponse = TreatmentScheduleResponseDto.fromJson(response.data);

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
