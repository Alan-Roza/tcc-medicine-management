import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tcc_medicine_management/app/core/infra/api_service.dart';
import 'package:tcc_medicine_management/app/core/infra/failure.dart';
import 'package:tcc_medicine_management/app/core/infra/network_info.dart';
import 'package:tcc_medicine_management/app/shared/constants/constants.dart';

class AuthRepository {
  final NetworkInfo _networkInfo;
  final ApiService _apiService;
  // final AppPreferences _appPref;

  AuthRepository(this._networkInfo, this._apiService);

  // @override
  Future<Either<Failure, dynamic>> login(String login, String password) async {
    if (await _networkInfo.isConnected) {
      try {
        final data = {
          "login": login,
          "password": password,
        };
        final response = await _apiService.post(endPoint: "/OAuth/Login", data: data);
        // final data = BaseResponseDto.fromJson(response.data);

        String token = response.data['token'];
        
        // Save token to SharedPreferences
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('token', token);

        return Right(response.data);
      } catch (error) {
        return Left(Failure(400, "bad request"));
        // return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(Failure(401, "bad request"));
      // return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

  // @override
  Future<Either<Failure, dynamic>> signup(String login, String password) async {
    if (await _networkInfo.isConnected) {
      try {
        final data = {
          "login": login,
          "password": password,
        };
        final response = await _apiService.post(endPoint: "/User", data: data);
        // final data = BaseResponseDto.fromJson(response.data);

        String token = response.data['token'];
        
        // Save token to SharedPreferences
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('token', token);

        return Right(response.data);
      } catch (error) {
        return Left(Failure(400, "bad request"));
        // return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(Failure(401, "bad request"));
      // return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }
}



// import 'package:dio/dio.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:tcc_medicine_management/app/core/infra/http_client.dart';
// import 'package:tcc_medicine_management/main.dart';

// class AuthRepository {
//   final Dio _dio;

//   AuthRepository() : _dio = getIt<DioConfig>().dio;

//   Future<void> login(String login, String password) async {
//     try {
//       Response response = await _dio.post('/OAuth/Login', data: {
//         'login': login,
//         'password': password,
//       });

//       // Assuming the token is in the response
//       String token = response.data['token'];
      
//       // Save token to SharedPreferences
//       SharedPreferences prefs = await SharedPreferences.getInstance();
//       await prefs.setString('token', token);
//     } catch (e) {
//       // Handle login error
//       print(e);
//     }
//   }
// }



