import 'package:flutter/material.dart';
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
  late double price;
  late String priority;


   MedicineCardControllerBase(MedicineCard? medicine) {
    if (medicine == null) return;

    name = medicine.name;
    isSelected = medicine.isSelected;
    imageUrl = medicine.imageUrl;
    type = medicine.type;
    quantity = medicine.quantity;
    expirationDate = medicine.expirationDate;
    price = medicine.price;
    priority = medicine.priority;
  }

  @action
  void toggleSelection() => isSelected = !isSelected;

  @action
  void removeSelection() => isSelected = false;

  @action
  void addSelection() => isSelected = true;

}