import 'package:tcc_medicine_management/app/modules/treatment/list/model/dto/treatment_list_dto.dart';
import 'package:tcc_medicine_management/app/modules/treatment/list/model/dto/treatment_list_request.dart';

abstract class ITreatmentListRepository {
  Future<TreatmentListDto> exec(TreatmentListRequestDto data);
  Future<bool> delete(int id);
}