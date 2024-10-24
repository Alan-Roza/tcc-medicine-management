import 'package:tcc_medicine_management/app/modules/main_home/main/model/dto/resume_pendency_response_dto.dart';

abstract class IResumeRepository {
  Future<ResumePendencyResponseDto> getResumePendency();
}