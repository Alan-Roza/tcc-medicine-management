import 'package:tcc_medicine_management/app/core/infra/api_service.dart';
import 'package:tcc_medicine_management/app/core/infra/error_handler.dart';
import 'package:tcc_medicine_management/app/core/infra/network_info.dart';
import 'package:tcc_medicine_management/app/modules/first_access/address_info/model/dto/address_info_dto.dart';
import 'package:tcc_medicine_management/app/modules/first_access/address_info/model/repository/address_info_repository.dart';

class AddressInfoRepository implements IAddressInfoRepository {
  final NetworkInfo _networkInfo;
  final ApiService _apiService;

  AddressInfoRepository(this._networkInfo, this._apiService);

  @override
  Future<AddressInfoDto> exec(AddressInfoDto data) async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _apiService.post(
          endPoint: "/Patient/Address", 
          data: data.toJson(),
        );

        final dataResponse = AddressInfoDto.fromJson(response.data);
      
        return dataResponse;
      } 
      catch (error) {
        return Future.error(handleError(error));
      }
    } else {
      // Throws an exception when there is no internet connection
      return Future.error("Verifique o acesso à internet");
    }
  }
}
