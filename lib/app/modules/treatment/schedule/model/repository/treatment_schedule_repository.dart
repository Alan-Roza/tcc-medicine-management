import 'package:tcc_medicine_management/app/modules/treatment/schedule/model/dto/treatment_schedule_response_dto.dart';

abstract class ITreatmentScheduleRepository {
  Future<TreatmentScheduleResponseDto> exec(DateTime date);
}