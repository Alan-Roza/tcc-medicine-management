import 'package:tcc_medicine_management/app/core/infra/api_service.dart';
import 'package:tcc_medicine_management/app/core/infra/error_handler.dart';
import 'package:tcc_medicine_management/app/core/infra/network_info.dart';
import 'package:tcc_medicine_management/app/modules/first_access/allergy_info/model/dto/allergy_info_dto.dart';
import 'package:tcc_medicine_management/app/modules/first_access/allergy_info/model/repository/allergy_info_repository.dart';

class AllergyInfoRepository implements IAllergyInfoRepository {
  final NetworkInfo _networkInfo;
  final ApiService _apiService;

  AllergyInfoRepository(this._networkInfo, this._apiService);

  List<AllergyInfoDto> parseAllergies(List<dynamic> jsonList) {
    return jsonList.map((json) => AllergyInfoDto.fromJson(json)).toList();
  }

  @override
  Future<List<AllergyInfoDto>> exec(List<AllergyInfoDto> data) async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _apiService.post(
          endPoint: "/Patient/Allergy", 
          data: data.map((item) => item.toJson()).toList(),
        );
        
        List<AllergyInfoDto> allergies = parseAllergies(response.data);
      
        return allergies;
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
