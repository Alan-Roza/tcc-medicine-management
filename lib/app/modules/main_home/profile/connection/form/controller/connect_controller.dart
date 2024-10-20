import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'package:tcc_medicine_management/app/shared/constants/constants.dart';

part 'connect_controller.g.dart';

class ConnectController = _ConnectController with _$ConnectController;

abstract class _ConnectController with Store {
  TextEditingController ssid = TextEditingController();
  TextEditingController password = TextEditingController();

  @action
  Future<bool> moduleConnect() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');

    final response = await http.post(
      Uri.parse('${Constants.baseUrlGadgets}/config'),
      body: {
        'ssid': ssid.text,
        'password': password.text,
        'unid': token,
      },
    );

    await Future.delayed(Duration(seconds: 5)); // awaiting for the device to connect and send to the server the connection status

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  void dispose() {
    ssid.dispose();
    password.dispose();
  }
}
