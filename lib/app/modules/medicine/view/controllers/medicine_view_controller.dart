import 'package:mobx/mobx.dart';
import 'package:tcc_medicine_management/app/modules/medicine/view/model/dto/medicine_view_request_dto.dart';
import 'package:tcc_medicine_management/app/modules/medicine/view/model/dto/medicine_view_response_dto.dart';
import 'package:tcc_medicine_management/app/modules/medicine/view/repository/medicine_view_repository.dart';
import 'package:tcc_medicine_management/main.dart';

part 'medicine_view_controller.g.dart';

class MedicineViewController = _MedicineViewController with _$MedicineViewController;

abstract class _MedicineViewController with Store {
  final MedicineViewRepository _medicineViewRepository = getIt<MedicineViewRepository>();

  @observable
  int selectedIndex = 0;

  @action
  void setSelectedIndex(int index) {
    selectedIndex = index;
  }

  @action
  Future<MedicineViewResponseDto> getByIdMedicine(int medicineId) async {
    try {
      final MedicineViewRequestDto data = MedicineViewRequestDto(medicineId: medicineId);

      final MedicineViewResponseDto dataResponse = await _medicineViewRepository.exec(data);

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