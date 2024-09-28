import 'package:shared_preferences/shared_preferences.dart';
import 'package:tcc_medicine_management/app/core/infra/api_service.dart';
import 'package:tcc_medicine_management/app/core/infra/error_handler.dart';
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
        return handleError(error) as dynamic;
      }
    } else {
      // Throws an exception when there is no internet connection
      return Future.error("Verifique o acesso à internet");
    }
  }
}
