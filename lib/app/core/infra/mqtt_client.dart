import 'dart:convert';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_server_client.dart';
import 'package:tcc_medicine_management/app/core/model/dto/notification_params_dto.dart';
import 'package:tcc_medicine_management/app/core/services/notification_service.dart';
import 'package:tcc_medicine_management/app/modules/medicine/view/model/dto/medicine_view_request_dto.dart';
import 'package:tcc_medicine_management/app/modules/medicine/view/model/dto/medicine_view_response_dto.dart';
import 'package:tcc_medicine_management/app/modules/medicine/view/repository/medicine_view_repository.dart';
import 'package:tcc_medicine_management/app/modules/treatment/view/model/dto/treatment_view_request_dto.dart';
import 'package:tcc_medicine_management/app/modules/treatment/view/model/dto/treatment_view_response_dto.dart';
import 'package:tcc_medicine_management/app/modules/treatment/view/repository/treatment_view_repository.dart';
import 'dart:async';

import 'package:tcc_medicine_management/app/shared/constants/constants.dart';
import 'package:tcc_medicine_management/main.dart';

class MqttService {
  MqttClient? client;
  final String broker = Constants.baseUrlMqtt; // Endereço do broker MQTT, pode ser o Mosquitto ou qualquer outro
  final String topicPrefix = '/notification/user/'; // Prefixo do tópico para a notificação
  final int port = 1883; // Porta do broker MQTT (geralmente 1883 para sem TLS ou 8883 para com TLS)
  Timer? reconnectTimer;

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
      client?.updates?.listen((List<MqttReceivedMessage<MqttMessage>>? event) async {
        final MqttPublishMessage message = event![0].payload as MqttPublishMessage;
        final String messageContent = MqttPublishPayload.bytesToStringAsString(message.payload.message);
        print('Mensagem recebida: $messageContent');

        // Convertendo a mensagem de volta para o formato JSON
        var jsonMessage = jsonDecode(messageContent);
        if (jsonMessage['params'] != null && jsonMessage['params']['quantity'] is double) {
          jsonMessage['params']['quantity'] = (jsonMessage['params']['quantity'] as double).toInt();
        }

        NotificationParamsDto notification = NotificationParamsDto.fromJson(jsonMessage);

        // Switch case para processar a ação da mensagem
        switch (notification.action) {
          case 'RequestConsume':
            final params = notification.params;
            params?.datetime =
                '${(DateTime.now().hour).toString().padLeft(2, '0')}:${(DateTime.now().minute).toString().padLeft(2, '0')}';

            final MedicineViewRepository medicineViewRepository = getIt<MedicineViewRepository>();
            // void getByIdMedicine() async {
            try {
              final MedicineViewResponseDto dataResponse =
                  await medicineViewRepository.exec(MedicineViewRequestDto(medicineId: params?.medicineId));
              params?.medicineName = dataResponse.name;
              params?.medicineType = dataResponse.type;
            } catch (e) {
              // return Future.error(e.toString());
            }
            // }
            // getByIdMedicine();

            final TreatmentViewRepository treatmentViewRepository = getIt<TreatmentViewRepository>();
            try {
              final TreatmentViewResponseDto dataResponse =
                  await treatmentViewRepository.exec(TreatmentViewRequestDto(treatmentId: params?.treatmentId));
              params?.treatmentId = dataResponse.treatment!.id;
              params?.treatmentName = dataResponse.treatment!.name;
            } catch (e) {
              // return Future.error(e.toString());
            }

            if (params != null) {
              if (!NotificationService.isAppInForeground()) {
                NotificationService.showInstantNotification(params);
              } else {
                // NotificationService.showInstantNotification(params);
                NotificationService.showNotificationDialog(NotificationResponse(
                    payload: jsonEncode(params),
                    notificationResponseType: NotificationResponseType.selectedNotification));
              }
            }

            break;
          case 'Repeater':
            NotificationService.flutterLocalNotificationsPlugin.cancelAll();
            NotificationService.closeNotificationDialog();
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

        startReconnectTimer(userId);
      });

      print('Conectado ao broker!');
    } catch (e) {
      print('Erro ao conectar: $e');

      startReconnectTimer(userId);
    }
  }

  // Método para verificar se está conectado
  bool isConnected() {
    return client?.connectionStatus?.state == MqttConnectionState.connected;
  }

  // Método para iniciar o timer de reconexão
  void startReconnectTimer(String userId) {
    reconnectTimer?.cancel(); // Cancel any existing timer
    reconnectTimer = Timer.periodic(Duration(seconds: 15), (timer) async {
      if (!isConnected()) {
        print('Tentando reconectar...');
        await connect(userId);
      }
    });
  }

  void publishMessage(
      {required String userId, required String medicineId, required String treatmentId, required String hardwareId}) {
    if (client == null || client?.connectionStatus?.state != MqttConnectionState.connected) {
      print('Cliente MQTT não está conectado');
      return;
    }

    String topic = '/notification/user/$userId'; // O tópico com o id do usuário

    // Criando a mensagem em formato JSON
    Map<String, dynamic> messageMap = {
      "Action": "ConsumeConfirmation",
      "params": {
        "HardwareId": hardwareId,
        "UserId": userId,
        "MedicineId": medicineId,
        "TreatmentId": treatmentId,
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
