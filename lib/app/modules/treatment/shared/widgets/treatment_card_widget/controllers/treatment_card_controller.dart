import 'package:mobx/mobx.dart';
import 'package:tcc_medicine_management/app/modules/treatment/shared/widgets/treatment_card_widget/model/treatment_card_model.dart';

part 'treatment_card_controller.g.dart';

class TreatmentCardController = TreatmentCardControllerBase with _$TreatmentCardController;

abstract class TreatmentCardControllerBase with Store {
  @observable
  late bool isSelected;
  late String name;
  late int quantity;
  late String expirationDate;
  late String patientName;
  late String priority;
  late String id;
  late double totalPrice;

  TreatmentCardControllerBase(TreatmentCard? treatment) {
    if (treatment == null) return;

    name = treatment.name;
    isSelected = treatment.isSelected;
    quantity = treatment.quantity;
    expirationDate = treatment.expirationDate;
    patientName = treatment.patientName;
    priority = treatment.priority;
    id = treatment.id;
    totalPrice = treatment.totalPrice;
  }

  @action
  void toggleSelection() => isSelected = !isSelected;

  @action
  void removeSelection() => isSelected = false;

  @action
  void addSelection() => isSelected = true;
}
