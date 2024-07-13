import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

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

  @action
  Future<void> getAddressInfo(String cep) async {
    final response = await http.get(Uri.parse('https://viacep.com.br/ws/$cep/json/'));

    if (response.statusCode == 200) {
      final addressData = jsonDecode(response.body);

      street.text = addressData['logradouro'] ?? '';
      neighborhood.text = addressData['bairro'] ?? '';
      city.text = addressData['localidade'] ?? '';
      state.text = addressData['uf'] ?? '';
    } else {
      // Handle error or set fields to empty
      street.text = '';
      neighborhood.text = '';
      city.text = '';
      state.text = '';
    }
  }

  void dispose() {
    postalCode.dispose();
    street.dispose();
    neighborhood.dispose();
    city.dispose();
    state.dispose();
  }
}
