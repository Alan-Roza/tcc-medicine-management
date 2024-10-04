import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

part 'connect_controller.g.dart';

class ConnectController = _ConnectController with _$ConnectController;

abstract class _ConnectController with Store {
  TextEditingController ssid = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController unid = TextEditingController();

  @action
  Future<bool> moduleConnect() async {
    final response = await http.post(
      Uri.parse('http://192.168.4.1/config'),
      body: {
      'ssid': ssid.text,
      'password': password.text,
      'unid': unid.text,
      },
    );

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  void dispose() {
    ssid.dispose();
    password.dispose();
    unid.dispose();
  }
}
