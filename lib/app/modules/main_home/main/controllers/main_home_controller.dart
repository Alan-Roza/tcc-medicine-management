import 'package:mobx/mobx.dart';
import 'package:tcc_medicine_management/app/modules/main_home/main/model/dto/resume_daily_response_dto.dart';
import 'package:tcc_medicine_management/app/modules/main_home/main/model/dto/resume_drawer_response_dto.dart';
import 'package:tcc_medicine_management/app/modules/main_home/main/model/dto/resume_pendency_response_dto.dart';
import 'package:tcc_medicine_management/app/modules/main_home/main/repository/resume_repository.dart';
import 'package:tcc_medicine_management/main.dart';

part 'main_home_controller.g.dart';

class MainHomeController = _MainHomeController with _$MainHomeController;

abstract class _MainHomeController with Store {
  final ResumeRepository _resumeRepository = getIt<ResumeRepository>();

  @observable
  bool hasPendency = false;

  @observable
  ResumeDailyResponseDto resumeDaily = ResumeDailyResponseDto();

  @observable
  List<ResumeDrawerResponseDto> resumeDrawer = [];

  @observable
  int currentPage = 0;

  @observable
  int selectedIndex = 0;

  @action
  void setPage(int page) {
    currentPage = page;
  }

  @action
  void setSelectedIndex(int index) {
    selectedIndex = index;
  }

  @action
  Future<ResumePendencyResponseDto> getResumePendency() async {
    try {
      final ResumePendencyResponseDto dataResponse = await _resumeRepository.getResumePendency();

      hasPendency = dataResponse.hasPendency ?? false;

      return dataResponse;
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  @action
  Future<List<ResumeDrawerResponseDto>> getResumeDrawer() async {
    try {
      final List<ResumeDrawerResponseDto> dataResponse = await _resumeRepository.getResumeDrawer();

      resumeDrawer = dataResponse;

      return dataResponse;
    } catch (e) {
      return Future.error(e.toString());
    }
  }
}
