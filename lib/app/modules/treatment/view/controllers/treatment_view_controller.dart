import 'package:mobx/mobx.dart';
import 'package:tcc_medicine_management/app/modules/treatment/view/model/dto/treatment_view_request_dto.dart';
import 'package:tcc_medicine_management/app/modules/treatment/view/model/dto/treatment_view_response_dto.dart';
import 'package:tcc_medicine_management/app/modules/treatment/view/repository/treatment_view_repository.dart';
import 'package:tcc_medicine_management/main.dart';

part 'treatment_view_controller.g.dart';

class TreatmentViewController = _TreatmentViewController with _$TreatmentViewController;

abstract class _TreatmentViewController with Store {
  final TreatmentViewRepository _treatmentViewRepository = getIt<TreatmentViewRepository>();

  @observable
  int selectedIndex = 0;

  @action
  void setSelectedIndex(int index) {
    selectedIndex = index;
  }

  @action
  Future<TreatmentViewResponseDto> getByTreatmentId(int treatmentId) async {
    try {
      final TreatmentViewRequestDto data = TreatmentViewRequestDto(treatmentId: treatmentId);

      final TreatmentViewResponseDto dataResponse = await _treatmentViewRepository.exec(data);

      return dataResponse;
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  @action
  void reset() {
    selectedIndex = 0;
  }
}