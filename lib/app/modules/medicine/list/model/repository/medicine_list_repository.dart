import 'package:tcc_medicine_management/app/modules/medicine/list/model/dto/medicine_list_dto.dart';
import 'package:tcc_medicine_management/app/modules/medicine/list/model/dto/medicine_list_request.dart';

abstract class IMedicineListRepository {
  Future<MedicineListDto> exec(MedicineListRequestDto data);
}