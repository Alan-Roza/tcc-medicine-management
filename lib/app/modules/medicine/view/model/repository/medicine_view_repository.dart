import 'package:tcc_medicine_management/app/modules/medicine/view/model/dto/medicine_view_request_dto.dart';
import 'package:tcc_medicine_management/app/modules/medicine/view/model/dto/medicine_view_response_dto.dart';

abstract class IMedicineViewRepository {
  Future<MedicineViewResponseDto> exec(MedicineViewRequestDto data);
}