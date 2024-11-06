import 'dart:convert';

import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_server_client.dart';
import 'package:tcc_medicine_management/app/core/services/notification_service.dart';
import 'dart:async';

import 'package:tcc_medicine_management/app/shared/constants/constants.dart';

class MqttService {
  MqttClient? client;
  // final String broker = Constants.baseUrlMqtt;  // Endereço do broker MQTT, pode ser o Mosquitto ou qualquer outro
  final String broker = '172.18.0.1'; // Endereço do broker MQTT, pode ser o Mosquitto ou qualquer outro
  final String topicPrefix = '/notification/user/'; // Prefixo do tópico para a notificação
  final int port = 1883; // Porta do broker MQTT (geralmente 1883 para sem TLS ou 8883 para com TLS)

  // Método para configurar a conexão
  Future<void> connect(String userId) async {
    client = MqttServerClient(broker, 'flutter_client');
    client?.port = port;
    client?.logging(on: true);
    client?.connectTimeoutPeriod = 5;

    try {
      // Conectar-se ao broker
      print('Conectando ao broker...');
      await client?.connect();

      // Assinar o tópico dinâmico
      String topic = '$topicPrefix$userId'; // Tópico dinâmico com id do usuário
      print('Assinando o tópico: $topic');
      client?.subscribe(topic, MqttQos.atLeastOnce);

      // Configuração de recebimento de mensagens
      client?.updates?.listen((List<MqttReceivedMessage<MqttMessage>>? event) {
        final MqttPublishMessage message = event![0].payload as MqttPublishMessage;
        final String messageContent = MqttPublishPayload.bytesToStringAsString(message.payload.message);
        print('Mensagem recebida: $messageContent');

        // Convertendo a mensagem de volta para o formato JSON
        var jsonMessage = jsonDecode(messageContent);

        // Switch case para processar a ação da mensagem
        switch (jsonMessage['Action']) {
          case 'RequestConsume':
            final params = jsonMessage['params'];

            NotificationService.showInstantNotification(
                "Tratamento para Enxaqueca 12:30h", "Clique aqui e veja mais detalhes");
            break;
          default:
            print('Action não reconhecida');
            break;
        }

        print('Ação recebida: ${jsonMessage['Action']}');
        print('Parâmetros: ${jsonMessage['params']}');

        // Aqui, você pode adicionar o código para processar a mensagem JSON

        print('Ação recebida: ${jsonMessage['Action']}');
        print('Parâmetros: ${jsonMessage['params']}');

        // Aqui, você pode adicionar o código para processar a mensagem JSON
      });
    } catch (e) {
      print('Erro ao conectar: $e');
      disconnect();
    }
  }

  void publishMessage(String userId) {
    if (client == null || client?.connectionStatus?.state != MqttConnectionState.connected) {
      print('Cliente MQTT não está conectado');
      return;
    }

    String topic = '/notification/user/$userId'; // O tópico com o id do usuário

    // Criando a mensagem em formato JSON
    Map<String, dynamic> messageMap = {
      "Action": "ConsumeConfirmation",
      "params": {
        "HardwareId": "ABC123",
        "UserId": '1',
        "MedicineId": '1',
      }
    };

    String message = jsonEncode(messageMap);

    // Enviando a mensagem para o tópico
    client?.publishMessage(topic, MqttQos.atLeastOnce, MqttClientPayloadBuilder().addString(message).payload!);

    print('Mensagem publicada: $message');
  }

  // Método para desconectar do broker
  void disconnect() {
    client?.disconnect();
    print('Desconectado do broker');
  }
}
