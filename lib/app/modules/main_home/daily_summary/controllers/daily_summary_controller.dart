import 'package:mobx/mobx.dart';
import 'package:tcc_medicine_management/app/modules/main_home/main/model/dto/resume_daily_response_dto.dart';
import 'package:tcc_medicine_management/app/modules/main_home/main/repository/resume_repository.dart';
import 'package:tcc_medicine_management/main.dart';

part 'daily_summary_controller.g.dart';

class DailySummaryController = _DailySummaryController with _$DailySummaryController;

abstract class _DailySummaryController with Store {
  final ResumeRepository _resumeRepository = getIt<ResumeRepository>();

   @observable
  int totalToConsume = 0;

  @observable
  int consumed = 0;

  @observable
  int notConsumed = 0;

  @observable
  int inProgress = 0;

  @observable
  List<Treatments> treatmentDetails = [];

  @action
  void updateCounts({required int total, required int consumed, required int notConsumed, required int inProgress}) {
    totalToConsume = total;
    this.consumed = consumed;
    this.notConsumed = notConsumed;
    this.inProgress = inProgress;
  }
  
  @action
  Future<ResumeDailyResponseDto> getResumeDaily() async {
    try {
      final ResumeDailyResponseDto dataResponse = await _resumeRepository.getResumeDaily();

      totalToConsume = dataResponse.total ?? 0;
      consumed = dataResponse.consumed ?? 0;
      notConsumed = dataResponse.delayed ?? 0;
      inProgress = dataResponse.normal ?? 0;

      treatmentDetails = dataResponse.treatments ?? [];

      return dataResponse;
    } catch (e) {
      return Future.error(e.toString());
    }
  }
}
