import 'dart:convert';
import 'package:http/http.dart' as http;

class HttpClient {
  final http.Client _client;
  final String _basePath = 'http://localhost:3000';

  HttpClient() : _client = http.Client();

  Future<http.Response> _sendRequest(String method, String endpoint, {dynamic body}) async {
    final url = Uri.parse('$_basePath$endpoint');
    final headers = {'Content-Type': 'application/json'};
    var response = http.Response('',404);

    switch (method.toUpperCase()) {
      case 'GET':
        response = await _client.get(url, headers: headers);
        break;
      case 'POST':
        response = await _client.post(url, headers: headers, body: jsonEncode(body));
        break;
      // Implement other methods as needed
    }

    return response;
  }

  Future<http.Response> get(String endpoint) async {
    return await _sendRequest('GET', endpoint);
  }

  Future<http.Response> post(String endpoint, {dynamic body}) async {
    return await _sendRequest('POST', endpoint, body: body);
  }

  void close() {
    _client.close();
  }
}