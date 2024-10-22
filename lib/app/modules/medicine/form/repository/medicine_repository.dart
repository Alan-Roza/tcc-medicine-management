import 'dart:io';

import 'package:dio/dio.dart';
import 'package:tcc_medicine_management/app/core/infra/api_service.dart';
import 'package:tcc_medicine_management/app/core/infra/error_handler.dart';
import 'package:tcc_medicine_management/app/core/infra/network_info.dart';
import 'package:tcc_medicine_management/app/modules/medicine/form/model/medicine_dto.dart';
import 'package:tcc_medicine_management/app/modules/medicine/form/model/repository/medicine_repository.dart';

class MedicineRepository implements IMedicineRepository {
  final NetworkInfo _networkInfo;
  final ApiService _apiService;

  MedicineRepository(this._networkInfo, this._apiService);

  @override
  Future<MedicineDto> exec(MedicineDto data) async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _apiService.post(
          endPoint: "/Medicine",
          data: data.toJson(),
        );

        final dataResponse = MedicineDto.fromJson(response.data);

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
  Future<String> uploadMedicineImage(File imageFile, int medicineId) async {
    if (await _networkInfo.isConnected) {
      try {
        FormData formData = FormData.fromMap({
          'files': [await MultipartFile.fromFile(imageFile.path, filename: imageFile.path.split('/').last)],
        });

        final response = await _apiService.post(
          endPoint: "/Medicine/Image/$medicineId",
          data: formData,
        );

        List<String> resultList = [];
        for (var item in response.data) {
          String availableOn = item['availableOn'];
          resultList.add(availableOn);
        }

        return resultList.last;
      } catch (error) {
        return Future.error(handleError(error));
      }
    } else {
      // Throws an exception when there is no internet connection
      return Future.error("Verifique o acesso à internet");
    }
  }

  @override
  Future<String> getMedicineImage(int medicineId) async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _apiService.get(
          endPoint: "/Medicine/Image/$medicineId",
        );

        List<String> resultList = [];
        for (var item in response.data) {
          String availableOn = item['availableOn'];
          resultList.add(availableOn);
        }

        return resultList.last;
      } catch (error) {
        return Future.error(handleError(error));
      }
    } else {
      // Throws an exception when there is no internet connection
      return Future.error("Verifique o acesso à internet");
    }
  }
}
