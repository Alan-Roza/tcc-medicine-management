import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'configurations_controller.g.dart';

class ConfigurationsController = _ConfigurationsController with _$ConfigurationsController;

abstract class _ConfigurationsController with Store {
  @observable
  bool allowDataStorage = false;

  @observable
  bool notifyWhatsapp = false;

  @observable
  bool notifyEmail = false;

  @observable
  bool notifyPopup = false;

  @observable
  String fontSize = 'normal';

  @action
  void toggleDataStorage() {
    allowDataStorage = !allowDataStorage;
  }

  void setNotifyWhatsapp(bool value) {
    notifyWhatsapp = value;
  }

  void setNotifyEmail(bool value) {
    notifyEmail = value;
  }

  void setNotifyPopup(bool value) {
    notifyPopup = value;
  }

  void setFontSize(String value) {
    fontSize = value;
  }
}
