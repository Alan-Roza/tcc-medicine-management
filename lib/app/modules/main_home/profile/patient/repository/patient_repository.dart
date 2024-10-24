import 'package:dio/dio.dart';
import 'package:tcc_medicine_management/app/core/infra/api_service.dart';
import 'package:tcc_medicine_management/app/core/infra/error_handler.dart';
import 'package:tcc_medicine_management/app/core/infra/network_info.dart';
import 'package:tcc_medicine_management/app/modules/main_home/profile/patient/model/dto/patient_list_response_dto.dart';
import 'package:tcc_medicine_management/app/modules/main_home/profile/patient/model/repository/patient_repository.dart';

class PatientRepository implements IPatientRepository {
  final NetworkInfo _networkInfo;
  final ApiService _apiService;

  PatientRepository(this._networkInfo, this._apiService);

  @override
  Future<PatientListResponseDto> getPatientList() async {
    if (await _networkInfo.isConnected) {
      try {
        late Response response;

        response = await _apiService.get(
          endPoint: "/Answerable/Patients",
        );

        final dataResponse = PatientListResponseDto.fromJson(response.data);

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
  Future<String> generateCode() async {
    if (await _networkInfo.isConnected) {
      try {
        late Response response;

        response = await _apiService.get(
          endPoint: "/Answerable/Token",
        );

        return response.data["otp"];
      } catch (error) {
        return Future.error(handleError(error));
      }
    } else {
      // Throws an exception when there is no internet connection
      return Future.error("Verifique o acesso à internet");
    }
  }
}
