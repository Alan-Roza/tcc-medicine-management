import 'package:tcc_medicine_management/app/core/infra/api_service.dart';
import 'package:tcc_medicine_management/app/core/infra/error_handler.dart';
import 'package:tcc_medicine_management/app/core/infra/network_info.dart';
import 'package:tcc_medicine_management/app/modules/unauth/forgot_password/model/repository/forgot_password_repository.dart';

class ForgotPasswordRepository implements IForgotPasswordRepository {
  final NetworkInfo _networkInfo;
  final ApiService _apiService;

  ForgotPasswordRepository(this._networkInfo, this._apiService);

  @override
  Future<void> exec(String email) async {
    if (await _networkInfo.isConnected) {
      try {
        await _apiService.post(
          endPoint: "/OAuth/ForgotPassword",
          data: {"login": email},
        );
      } catch (error) {
        return Future.error(handleError(error));
      }
    } else {
      // Throws an exception when there is no internet connection
      return Future.error("Verifique o acesso à internet");
    }
  }
}
