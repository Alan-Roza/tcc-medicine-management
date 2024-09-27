import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tcc_medicine_management/app/core/infra/api_service.dart';
import 'package:tcc_medicine_management/app/core/infra/network_info.dart';
import 'package:tcc_medicine_management/app/modules/first_access/user_info/model/dto/user_info_dto.dart';
import 'package:tcc_medicine_management/app/modules/first_access/user_info/model/repository/user_info_repository.dart';

class UserInfoRepository implements IUserInfoRepository {
  final NetworkInfo _networkInfo;
  final ApiService _apiService;

  UserInfoRepository(this._networkInfo, this._apiService);

  @override
  Future<UserInfoDto> exec(UserInfoDto data) async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _apiService.post(
          endPoint: "/Patient", 
          data: data.toJson(),
        );

        final dataResponse = UserInfoDto.fromJson(response.data);
        String? name = dataResponse.name;

        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('name', name!);
      
        return dataResponse;
      } 
      catch (error) {
        String errorMessage = 'Oops... Tente novamente mais tarde';

        if (error is DioException) {
          // Checks if the response contains data and status
          final responseData = error.response?.data;

          if (responseData != null) {
            // Checks if responseData is a list or a map
            if (responseData is List && responseData.isNotEmpty && responseData[0] is Map<String, dynamic>) {
              errorMessage = responseData[0]['message'] ?? errorMessage;
            } else if (responseData is Map<String, dynamic>) {
              errorMessage = responseData['message'] ?? errorMessage;
            }

            // Throws an exception with the error message
            return Future.error(errorMessage);
          } else {
            // If there is no response or data, throws a generic exception
            errorMessage = error.message ?? errorMessage;
          }
        } else {
          // If the error is not a DioError, throws the error directly
          errorMessage = "Erro inesperado: ${error.toString()}";
        }

        return Future.error(errorMessage);
      }
    } else {
      // Throws an exception when there is no internet connection
      return Future.error("Verifique o acesso à internet");
    }
  }
}
