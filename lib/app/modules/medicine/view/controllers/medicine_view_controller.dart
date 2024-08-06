import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'medicine_view_controller.g.dart';

class MedicineViewController = _MedicineViewController with _$MedicineViewController;

abstract class _MedicineViewController with Store {
  @observable
  int selectedIndex = 0;

  @action
  void setSelectedIndex(int index) {
    selectedIndex = index;
  }
}