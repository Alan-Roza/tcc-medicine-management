import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'administrator_info_controller.g.dart';

class AdministratorInfoController = _AdministratorInfoController with _$AdministratorInfoController;

abstract class _AdministratorInfoController with Store {
  TextEditingController code = TextEditingController();

  @observable
  String administratorName = 'Luna Roza';

  void dispose() {
    code.dispose();
  }
}
