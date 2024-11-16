import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tcc_medicine_management/app/core/routes/app_routes.dart';
import 'package:tcc_medicine_management/app/shared/constants/constants.dart';
import 'package:tcc_medicine_management/main.dart';

const String APPLICATION_JSON = "application/json";
const String CONTENT_TYPE = "content-type";
const String ACCEPT = "accept";
const String AUTHORIZATION = "authorization";
const String DEFAULT_LANGUAGE = "language";

// TODO: Its only temporary, remove it after the property implementation of the loading overlay
final List<String> loadingBlacklist = [
  'MainHome',
  'Connection',
  'Patients',
];

class DioFactory {

  // final AppPreferences _appPreferences;

  // DioFactory(this._appPreferences);

  Dio getDio() {
    Dio dio = Dio();

    // String language = await _appPreferences.getAppLanguage();
    Map<String, String> headers = {
      CONTENT_TYPE: APPLICATION_JSON,
      ACCEPT: APPLICATION_JSON,
    };

    dio.options = BaseOptions(
        baseUrl: Constants.baseUrl,
        headers: headers,
        // receiveTimeout: Constants.apiTimeOut,
        // sendTimeout: Constants.apiTimeOut,
    );

    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) async {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        String? token = prefs.getString('token');
        String? patientId = prefs.getString('patientId');

        if (patientId != null) {
          options.queryParameters['userId'] = patientId;
        }

        if (token != null) {
          options.headers['Authorization'] = 'Bearer $token';
        }

        // Check if the current route is in the blacklist
        String? currentRoute = appRouteObserver.currentRoute;

        if (currentRoute != null && !loadingBlacklist.contains(currentRoute)) {
          loadingOverlayKey.currentState?.show();
        }

        return handler.next(options);
      },
      onResponse: (response, handler) async {
        // await Future.delayed(Duration(seconds: 5)); // Used only for test loading
        // Hide loading overlay
        loadingOverlayKey.currentState?.hide();

        return handler.next(response);
      },
      onError: (DioException error, handler) {
        loadingOverlayKey.currentState?.hide();
        // Handle error
        return handler.next(error);
      },
    ));

    // if (!kReleaseMode) {
    //   dio.interceptors.add(PrettyDioLogger(
    //     requestHeader: true,
    //     requestBody: true,
    //     responseHeader: true,
    //   ));
    // }

    // if (!kReleaseMode) {
    //   dio.interceptors.add(dioLoggerInterceptor);
    // }

    return dio;
  }
}