import 'package:tcc_medicine_management/app/modules/first_access/address_info/model/dto/address_info_dto.dart';

abstract class IAddressInfoRepository {
  Future<AddressInfoDto> exec(AddressInfoDto data);
}