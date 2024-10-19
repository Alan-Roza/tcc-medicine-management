import 'package:tcc_medicine_management/app/modules/treatment/view/model/dto/treatment_view_request_dto.dart';
import 'package:tcc_medicine_management/app/modules/treatment/view/model/dto/treatment_view_response_dto.dart';

abstract class ITreatmentViewRepository {
  Future<TreatmentViewResponseDto> exec(TreatmentViewRequestDto data);
}