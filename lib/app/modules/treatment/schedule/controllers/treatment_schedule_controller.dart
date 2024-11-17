import 'package:mobx/mobx.dart';
import 'package:tcc_medicine_management/app/modules/treatment/schedule/model/dto/treatment_schedule_response_dto.dart';
import 'package:tcc_medicine_management/app/modules/treatment/schedule/repository/treatment_schedule_repository.dart';
import 'package:tcc_medicine_management/main.dart';

part 'treatment_schedule_controller.g.dart';

class TreatmentScheduleController = _TreatmentScheduleController with _$TreatmentScheduleController;

abstract class _TreatmentScheduleController with Store {
  final TreatmentScheduleRepository _treatmentScheduleRepository = getIt<TreatmentScheduleRepository>();

  @observable
  DateTime selectedDate = DateTime.now();

  @observable
  ObservableList<Map<String, dynamic>> events = ObservableList.of([]);

  @action
  void selectDate(DateTime date) {
    selectedDate = date;
    getMedicineTreatmentByDay(date);
  }

  @action
  Future<void> getMedicineTreatmentByDay(DateTime date) async {
    try {
      final TreatmentScheduleResponseDto dataResponse = await _treatmentScheduleRepository.exec(date);

      events.clear();

      for (var element in dataResponse.medicines ?? []) {
        events.add({
          // 'date': element.date ?? DateTime.now(),
          'date': DateTime.now(),
          // 'patient': element.patient,
          'importance': element.importance,
          'medicineName': element.medicineName,
          'treatmentName': element.treatmentName,
          'picture': element.pictures.length > 0 ? element.pictures[0] : null,
        });
      }
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  // @computed
  // List<Map<String, dynamic>> get eventsForSelectedDate {
  //   return events
  //       .where((event) =>
  //           event['date'].year == selectedDate.year &&
  //           event['date'].month == selectedDate.month &&
  //           event['date'].day == selectedDate.day)
  //       .toList();
  // }
}
