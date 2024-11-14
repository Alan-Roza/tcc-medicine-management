import 'package:tcc_medicine_management/app/modules/main_home/main/model/dto/resume_daily_response_dto.dart';
import 'package:tcc_medicine_management/app/modules/main_home/main/model/dto/resume_drawer_response_dto.dart';
import 'package:tcc_medicine_management/app/modules/main_home/main/model/dto/resume_pendency_response_dto.dart';

abstract class IResumeRepository {
  Future<ResumePendencyResponseDto> getResumePendency();
  Future<ResumeDailyResponseDto> getResumeDaily();
  Future<List<ResumeDrawerResponseDto>> getResumeDrawer();
}