import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';
import 'package:tcc_medicine_management/app/modules/medicine/shared/widgets/medicine_card_widget/model/medicine_card_model.dart';

part 'medicine_card_controller.g.dart';

class MedicineCardController = MedicineCardControllerBase with _$MedicineCardController;

abstract class MedicineCardControllerBase with Store {
  @observable
  late bool isSelected;
  String? imageUrl;
  late String name;
  late String type;
  late int quantity;
  late String expirationDate;
  late String price;
  late String priority;
  late int medicineId;


   MedicineCardControllerBase(MedicineCard? medicine) {
    if (medicine == null) return;

    name = medicine.name;
    isSelected = medicine.isSelected;
    imageUrl = medicine.imageUrl;
    type = medicine.type;
    quantity = medicine.quantity;
    expirationDate = DateFormat('dd/MM/yyyy').format(DateTime.parse(medicine.expirationDate));
    price = medicine.price.toStringAsFixed(2).replaceAll('.', ',');
    priority = medicine.priority;
    medicineId = medicine.medicineId;
  }

  @action
  void toggleSelection() => isSelected = !isSelected;

  @action
  void removeSelection() => isSelected = false;

  @action
  void addSelection() => isSelected = true;

}