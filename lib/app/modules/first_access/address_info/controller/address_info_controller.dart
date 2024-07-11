import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'address_info_controller.g.dart';

// ignore: constant_identifier_names
enum Gender { Masculino, Feminino }

class AddressInfoController = _AddressInfoController with _$AddressInfoController;

abstract class _AddressInfoController with Store {
  TextEditingController postalCode = TextEditingController();
  TextEditingController street = TextEditingController();
  TextEditingController neighborhood = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController state = TextEditingController();

  void dispose() {
    postalCode.dispose();
    street.dispose();
    neighborhood.dispose();
    city.dispose();
    state.dispose();
  }
}
