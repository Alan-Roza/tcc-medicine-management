import 'package:dio/dio.dart';
import 'package:tcc_medicine_management/app/core/infra/api_service.dart';
import 'package:tcc_medicine_management/app/core/infra/error_handler.dart';
import 'package:tcc_medicine_management/app/core/infra/network_info.dart';
import 'package:tcc_medicine_management/app/modules/main_home/main/model/dto/resume_pendency_response_dto.dart';
import 'package:tcc_medicine_management/app/modules/main_home/main/model/repository/resume_repository.dart';

class ResumeRepository implements IResumeRepository {
  final NetworkInfo _networkInfo;
  final ApiService _apiService;

  ResumeRepository(this._networkInfo, this._apiService);

  @override
  Future<ResumePendencyResponseDto> getResumePendency() async {
    if (await _networkInfo.isConnected) {
      try {
        late Response response;

        response = await _apiService.get(
            endPoint: "/Resume/HasPendencies",
          );
        
        final dataResponse = ResumePendencyResponseDto.fromJson(response.data);

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
