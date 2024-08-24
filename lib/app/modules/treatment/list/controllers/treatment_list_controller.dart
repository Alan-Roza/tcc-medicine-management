import 'package:mobx/mobx.dart';
import 'package:tcc_medicine_management/app/modules/treatment/shared/widgets/treatment_card_widget/controllers/treatment_card_controller.dart';
import 'package:tcc_medicine_management/app/modules/treatment/shared/widgets/treatment_card_widget/model/treatment_card_model.dart';

part 'treatment_list_controller.g.dart';

class TreatmentListController = _TreatmentListController with _$TreatmentListController;

abstract class _TreatmentListController with Store {

  @observable
  ObservableList<TreatmentCardController> treatmentCards = ObservableList<TreatmentCardController>();

  @observable
  bool multiSelectionIsEnabled = false;

  @action
  void createMedicineCardList() {
    for (int i = 0; i <= 20; i++) {
      treatmentCards.add(
        TreatmentCardController(
          TreatmentCard(
            name: 'Medicine $i',
            quantity: i,
            expirationDate: '2022-12-31',
            patientName: 'Luna Roza',
            priority: 'high',
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
    treatmentCards.where((element) => element.isSelected).forEach((element) {
      element.removeSelection();
    });
  }

  @action
  void selectAllCards(bool? value) {
    for (var card in treatmentCards) {
      card.isSelected = value ?? false;
    }
  }

  @action
  void removeSelectedTasks() {
    treatmentCards.removeWhere((element) => element.isSelected);

    disableMultiSelection();
  }
}