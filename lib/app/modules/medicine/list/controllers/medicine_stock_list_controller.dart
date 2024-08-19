import 'package:mobx/mobx.dart';
import 'package:tcc_medicine_management/app/modules/medicine/shared/widgets/medicine_card_widget/controllers/medicine_card_controller.dart';
import 'package:tcc_medicine_management/app/modules/medicine/shared/widgets/medicine_card_widget/model/medicine_card_model.dart';

part 'medicine_stock_list_controller.g.dart';

class MedicineStockListController = _MedicineStockListController with _$MedicineStockListController;

abstract class _MedicineStockListController with Store {

  @observable
  ObservableList<MedicineCardController> medicineCards = ObservableList<MedicineCardController>();

  @observable
  bool multiSelectionIsEnabled = false;

  @action
  void createMedicineCardList() {
    for (int i = 0; i <= 20; i++) {
      medicineCards.add(
        MedicineCardController(
          MedicineCard(
            name: 'Medicine $i',
            type: 'Type $i',
            quantity: i,
            expirationDate: '2022-12-31',
            price: 10.0 * i,
            priority: 'High',
          ),
        ),
      );
    }
  }

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
  void removeSelectedTasks() {
    medicineCards.removeWhere((element) => element.isSelected);

    disableMultiSelection();
  }
}

// class CardItem {
//   String name;
//   String type;
//   int quantity;
//   String expirationDate;
//   double price;
//   String priority;

//   CardItem({
//     required this.name,
//     required this.type,
//     required this.quantity,
//     required this.expirationDate,
//     required this.price,
//     required this.priority,
//   });
// }
