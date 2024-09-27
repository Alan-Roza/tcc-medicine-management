import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tcc_medicine_management/app/core/infra/api_service.dart';
import 'package:tcc_medicine_management/app/core/infra/failure.dart';
import 'package:tcc_medicine_management/app/core/infra/network_info.dart';
import 'package:tcc_medicine_management/app/modules/unauth/login/model/dto/LoginResponseDto.dart';
import 'package:tcc_medicine_management/app/modules/unauth/login/model/dto/SignupResponseDto.dart';
import 'package:tcc_medicine_management/app/shared/constants/constants.dart';

class AuthRepository {
  final NetworkInfo _networkInfo;
  final ApiService _apiService;
  // final AppPreferences _appPref;

  AuthRepository(this._networkInfo, this._apiService);

  // @override
  Future<LoginResponseDto> login(String login, String password) async {
    if (await _networkInfo.isConnected) {
      try {
        final data = {
          "login": login,
          "password": password,
        };

        // Faz a requisição para o endpoint de login
        final response = await _apiService.post(endPoint: "/OAuth/Login", data: data);

        // Converte a resposta para o DTO esperado
        final dataResponse = LoginResponseDto.fromJson(response.data);

        // Extrai o token da resposta
        String? token = dataResponse.token;

        // Salva o token no SharedPreferences
        if (token != null) {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          await prefs.setString('token', token);
        }

        return dataResponse;
      } catch (error) {
        if (error is DioException) {
          // Verifica se a resposta contém dados e status
          if (error.response != null && error.response!.data != null) {
            final responseData = error.response!.data;

            String errorMessage = 'Tente novamente mais tarde';

            // Verifica se o responseData é uma lista ou um mapa
            if (responseData is List) {
              if (responseData.isNotEmpty && responseData[0] is Map<String, dynamic>) {
                final errorData = responseData[0] as Map<String, dynamic>;
                errorMessage = errorData['message'] ?? errorMessage;
              }
            } else if (responseData is Map<String, dynamic>) {
              errorMessage = responseData['message'] ?? errorMessage;
            }

            // Lança a exceção com a mensagem de erro
            throw Exception("Erro ao fazer login: $errorMessage");
          } else {
            // Caso não haja resposta ou dados, lança uma exceção genérica
            throw Exception("Erro ao fazer login: ${error.message}");
          }
        } else {
          // Se o erro não for um DioError, lança o erro diretamente
          throw Exception("Erro inesperado: ${error.toString()}");
        }
      }
    } else {
      // Lança uma exceção quando não houver conexão com a internet
      throw Exception("Verifique o acesso à internet");
    }
  }

  // @override
  Future<SignupResponseDto> signup(String login, String password) async {
    if (await _networkInfo.isConnected) {
      try {
        final data = {
          "login": login,
          "password": password,
        };

        // Faz a requisição para o endpoint de login
        final response = await _apiService.post(endPoint: "/User", data: data);

        // Converte a resposta para o DTO esperado
        final dataResponse = SignupResponseDto.fromJson(response.data);

        // Extrai o token da resposta
        String? token = dataResponse.token;

        // Salva o token no SharedPreferences
        if (token != null) {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          await prefs.setString('token', token);
        }

        return dataResponse;
      } catch (error) {
        if (error is DioException) {
          // Verifica se a resposta contém dados e status
          if (error.response != null && error.response!.data != null) {
            final responseData = error.response!.data;

            String errorMessage = 'Tente novamente mais tarde';

            // Verifica se o responseData é uma lista ou um mapa
            if (responseData is List) {
              if (responseData.isNotEmpty && responseData[0] is Map<String, dynamic>) {
                final errorData = responseData[0] as Map<String, dynamic>;
                errorMessage = errorData['message'] ?? errorMessage;
              }
            } else if (responseData is Map<String, dynamic>) {
              errorMessage = responseData['message'] ?? errorMessage;
            }

            // Lança a exceção com a mensagem de erro
            throw Exception("Erro ao fazer login: $errorMessage");
          } else {
            // Caso não haja resposta ou dados, lança uma exceção genérica
            throw Exception("Erro ao fazer login: ${error.message}");
          }
        } else {
          // Se o erro não for um DioError, lança o erro diretamente
          throw Exception("Erro inesperado: ${error.toString()}");
        }
      }
    } else {
      // Lança uma exceção quando não houver conexão com a internet
      throw Exception("Verifique o acesso à internet");
    }
  }
}
