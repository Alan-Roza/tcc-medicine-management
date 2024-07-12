import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'allergy_info_controller.g.dart';

class AllergyInfoController = _AllergyInfoController with _$AllergyInfoController;

abstract class _AllergyInfoController with Store {
  @observable
  ObservableList<String> medicines = ObservableList<String>();

  @action
  void addMedicine(String medicine) {
    final newMedicines = medicine.split(',').map((e) => e.trim()).where((e) => e.isNotEmpty).toList();
    medicines.addAll(newMedicines);
  }

  @action
  void removeMedicine(String medicine) {
    medicines.remove(medicine);
  }
}
