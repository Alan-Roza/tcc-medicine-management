import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:tcc_medicine_management/app/modules/first_access/address_info/model/dto/address_info_dto.dart';
import 'package:tcc_medicine_management/app/modules/first_access/address_info/repository/address_info_repository.dart';
import 'package:tcc_medicine_management/main.dart';

part 'address_info_controller.g.dart';

class AddressInfoController = _AddressInfoController with _$AddressInfoController;

abstract class _AddressInfoController with Store {
  final AddressInfoRepository _addressInfoRepository = getIt<AddressInfoRepository>();

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

  @action
  Future<AddressInfoDto> onSubmit(GlobalKey<FormState> formKey, int? userId) async {
    try {
      // TODO: will be implemented at future
      if (!formKey.currentState!.validate()) {
        return Future.error('Preencha os campos corretamente!');
      }

      final AddressInfoDto addressInfo = AddressInfoDto(
        zipcode: postalCode.text,
        street: street.text,
        neighborhood: neighborhood.text,
        city: city.text,
        state: state.text,
      );

      final AddressInfoDto dataResponse = await _addressInfoRepository.exec(addressInfo, userId);
      return dataResponse;
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  @action
  Future<AddressInfoDto> getPatientAddress() async {
    try {
      final AddressInfoDto dataResponse = await _addressInfoRepository.getPatientAddress();
      return dataResponse;
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  void dispose() {
    postalCode.clear();
    street.clear();
    neighborhood.clear();
    city.clear();
    state.clear();
  }
}
