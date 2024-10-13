import 'package:mobx/mobx.dart';
import 'package:tcc_medicine_management/app/modules/medicine/list/model/dto/medicine_list_dto.dart';
import 'package:tcc_medicine_management/app/modules/medicine/list/model/dto/medicine_list_request.dart';
import 'package:tcc_medicine_management/app/modules/medicine/list/repository/medicine_list_repository.dart';
import 'package:tcc_medicine_management/app/modules/medicine/shared/widgets/medicine_card_widget/controllers/medicine_card_controller.dart';
import 'package:tcc_medicine_management/app/modules/medicine/shared/widgets/medicine_card_widget/model/medicine_card_model.dart';
import 'package:tcc_medicine_management/main.dart';

part 'medicine_stock_list_controller.g.dart';

class MedicineStockListController = _MedicineStockListController with _$MedicineStockListController;

abstract class _MedicineStockListController with Store {
  final MedicineListRepository _medicineListRepository = getIt<MedicineListRepository>();

  @observable
  String search = "";

  @observable
  ObservableList<MedicineCardController> medicineCards = ObservableList<MedicineCardController>();

  @observable
  bool multiSelectionIsEnabled = false;

  @action
  void enableMultiSelection() => multiSelectionIsEnabled = true;

  @action
  void disableMultiSelection() {
    multiSelectionIsEnabled = false;
    _resetSelectedTasks();
  }

  @action
  void _resetSelectedTasks() {
    medicineCards.where((element) => element.isSelected).forEach((element) {
      element.removeSelection();
    });
  }

  @action
  void selectAllCards(bool? value) {
    for (var card in medicineCards) {
      card.isSelected = value ?? false;
    }
  }

  @action
  void removeSelectedTasks() {
    medicineCards.removeWhere((element) => element.isSelected);

    disableMultiSelection();
  }

  @action
  Future<void> deleteMedicines(List<int> ids) async {
    try {
      for (var id in ids) {
        await _medicineListRepository.delete(id);
      }
      getListMedicines(MedicineListRequestDto(search: search, size: 100));
      removeSelectedTasks();
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  @action
  Future<void> getListMedicines(MedicineListRequestDto? parameters) async {
    try {
      // final UserInfoDto userInfo = UserInfoDto(
      //   name: name,
      //   telephone: phone,
      //   birthdate: birthDate,
      //   gender: gender.toString().split('.').last,
      // );

      final MedicineListDto dataResponse = await _medicineListRepository.exec(parameters);

      medicineCards.clear();
      for (var element in dataResponse.content!) {
        medicineCards.add(
          MedicineCardController(
            MedicineCard(
              medicineId: element.id!,
              name: element.name!,
              type: element.type!,
              quantity: element.storageQuantity!,
              expirationDate: element.expirationDate!,
              price: element.price ?? 0,
              priority: element.importance!,
            ),
          ),
        );
      }
    } catch (e) {
      return Future.error(e.toString());
    }
  }
}
