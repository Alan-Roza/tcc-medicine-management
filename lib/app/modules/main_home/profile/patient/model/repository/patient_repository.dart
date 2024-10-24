import 'package:tcc_medicine_management/app/modules/main_home/profile/patient/model/dto/patient_list_response_dto.dart';

abstract class IPatientRepository {
  Future<PatientListResponseDto> getPatientList();
  Future<String> generateCode();

}