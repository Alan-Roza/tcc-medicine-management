import 'dart:convert';
import 'dart:typed_data';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:tcc_medicine_management/app/core/infra/mqtt_client.dart';
import 'package:tcc_medicine_management/app/core/model/dto/notification_params_dto.dart';
import 'package:tcc_medicine_management/main.dart';
import 'package:vibration/vibration.dart';
import 'package:timezone/timezone.dart' as tz;

class NotificationService with WidgetsBindingObserver {
  static final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  static NotificationResponse? _pendingNotificationResponse;
  static final NotificationService _instance = NotificationService._internal();
  static BuildContext? _dialogContext;
  static final player = AudioPlayer();

  factory NotificationService() {
    return _instance;
  }

  NotificationService._internal();

  static Future<void> initializeNotifications() async {
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    const InitializationSettings initializationSettings =
        InitializationSettings(android: initializationSettingsAndroid);

    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: onDidReceiveNotification,
      onDidReceiveBackgroundNotificationResponse: onDidReceiveNotification,
    );

    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
        ?.requestNotificationsPermission();
  }

  static Future<void> onDidReceiveNotification(NotificationResponse notificationResponse) async {
    // Ensure the app is in the foreground
    if (navigatorKey.currentState?.context != null) {
      showNotificationDialog(notificationResponse);
    } else {
      // Store the notification response to handle it when the app comes to the foreground
      _pendingNotificationResponse = notificationResponse;
    }
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed && _pendingNotificationResponse != null) {
      showNotificationDialog(_pendingNotificationResponse!);
      _pendingNotificationResponse = null;
    }
  }

  static Future<void> showNotificationDialog(NotificationResponse notificationResponse) async {
    await player.play(AssetSource('audios/alarm.wav'));
    player.setReleaseMode(ReleaseMode.loop);
    Future.delayed(Duration(seconds: 60), () async {
      await player.stop();
      Vibration.cancel();
      
    });

    String payload = notificationResponse.payload ?? '';

    var jsonMessage = jsonDecode(payload);
    Params params = Params.fromJson(jsonMessage);

    if (await Vibration.hasVibrator() ?? false) {
      Vibration.vibrate(pattern: [500, 1000, 500, 2000], repeat: 0); // Vibrate with a pattern
    }

    showDialog(
        barrierDismissible: false,
        context: navigatorKey.currentState!.context,
        builder: (BuildContext context) {
          _dialogContext = context;
          return Dialog.fullscreen(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color.fromARGB(255, 0, 107, 160), // Bottom color
                    Color.fromARGB(255, 0, 146, 224), // Top color
                  ],
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Tratamento ${params.treatmentName}', // TODO
                      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                    Expanded(flex: 2, child: Container()),
                    const Icon(
                      Icons.notifications_active_outlined,
                      size: 56,
                      color: Colors.white,
                    ),
                    Text(
                      // DateFormat('HH:mm').format(DateTime.now()),
                      params.datetime ?? '-',
                      style: const TextStyle(fontSize: 56, fontWeight: FontWeight.w200, color: Colors.white),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Tome ${params.quantity.toString().split('.')[0]} ${params.medicineType == 'Comprimido' ? 'Comprimido(s)' : params.medicineType} de ${params.medicineName}',
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white, height: 1.15),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Está na hora de tomar o seu remédio! Toque no botão para confirmar que tomou a medicação.',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w200, color: Colors.white),
                    ),
                    Expanded(
                      flex: 3,
                      child: Container(),
                    ),

                    // TODO: verify if will be used a stream to show the current time
                    // StreamBuilder(
                    //   stream: Stream.periodic(const Duration(seconds: 1)),
                    //   builder: (context, snapshot) {
                    //     return Text(
                    //       DateFormat('HH:mm:ss').format(DateTime.now()),
                    //       style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
                    //     );
                    //   },
                    // ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            onPressed: () async {
                              final MqttService mqttService = getIt<MqttService>();

                              mqttService.publishMessage(
                                  hardwareId: params.hardwareId!,
                                  medicineId: params.medicineId.toString(),
                                  treatmentId: params.treatmentId.toString(),
                                  userId: params.userId.toString());
                              await player.stop();
                              Vibration.cancel();
                              Navigator.of(context).pop();
                              _dialogContext = null;
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color.fromARGB(0, 76, 175, 79),
                              shadowColor: Colors.transparent,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              side: const BorderSide(
                                color: Color.fromARGB(255, 255, 255, 255),
                                width: 1,
                              ),
                              // minimumSize: const Size(double.infinity, 40),
                              textStyle:
                                  const TextStyle(fontSize: 14, fontWeight: FontWeight.normal, color: Colors.white),
                            ),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.check, color: Colors.white),
                                SizedBox(width: 8.0),
                                Text('Confirmar',
                                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal, color: Colors.white)),
                              ],
                            ),
                          ),
                          Expanded(child: Container()),
                          ElevatedButton(
                            onPressed: () async {
                              await player.stop();
                              Vibration.cancel();
                              Navigator.of(context).pop();
                              _dialogContext = null;
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.transparent,
                              shadowColor: Colors.transparent,
                              foregroundColor: Colors.transparent,
                              disabledBackgroundColor: Colors.transparent,
                              disabledForegroundColor: Colors.transparent,
                              // foregroundColor: Colors.transparent,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              // minimumSize: const Size(double.infinity, 40),
                              textStyle:
                                  const TextStyle(fontSize: 14, fontWeight: FontWeight.normal, color: Colors.white),
                            ),
                            // child: Icon(Icons.close),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                // Icon(Icons.close, color: Colors.white),
                                // SizedBox(width: 8.0),
                                Text('Cancelar',
                                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal, color: Colors.white)),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
// Play alarm sound
// You can use a package like audioplayers to play the alarm sound
// Example:
// final player = AudioCache();
// player.play('alarm_sound.mp3');
  }

  static Future<void> showInstantNotification(Params params) async {
    NotificationDetails platformChannelSpecifics = NotificationDetails(
      android: AndroidNotificationDetails(
        'channel_id',
        'channel_name',
        // vibrationPattern: Int64List.fromList([100, 200, 100, 300, 100, 400]),
        // vibrationPattern: Int64List.fromList([500, 1000, 500, 2000]),
        importance: Importance.max,
        priority: Priority.high,
        ticker: 'ticker',
        visibility: NotificationVisibility.public,
        audioAttributesUsage: AudioAttributesUsage.notificationRingtone,
        playSound: true,
        sound: RawResourceAndroidNotificationSound('alarm'),
        // showWhen: false,
        // fullScreenIntent: true,
        // onlyAlertOnce: false,
        // ongoing: true,
        // autoCancel: false,
        // timeoutAfter: 60000, // Set timeout to 1 minute (60,000 milliseconds)
      ),
    );

    // Convert payload to JSON string
    String payload = jsonEncode(params);

    await flutterLocalNotificationsPlugin.show(
      0,
      "${params.datetime} - Hora de tomar ${params.medicineName}",
      "Clique aqui e veja mais detalhes",
      platformChannelSpecifics,
      payload: payload,
    );
  }

  static Future<void> scheduleNotification(String title, String body, DateTime scheduledDate) async {
    const NotificationDetails platformChannelSpecifics = NotificationDetails(
      android: AndroidNotificationDetails(
        'channel_id',
        'channel_name',
        importance: Importance.max,
        priority: Priority.high,
        showWhen: false,
        ticker: 'ticker',
        ongoing: true,
        autoCancel: false,
      ),
    );
    await flutterLocalNotificationsPlugin.zonedSchedule(
        0, title, body, tz.TZDateTime.from(scheduledDate, tz.local), platformChannelSpecifics,
        uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime,
        matchDateTimeComponents: DateTimeComponents.dateAndTime);
  }

  static bool isAppInForeground() {
    final appLifecycleState = WidgetsBinding.instance.lifecycleState;
    return appLifecycleState == AppLifecycleState.resumed;
  }

  static void closeNotificationDialog() {
    if (_dialogContext != null) {
      player.stop();
      Vibration.cancel();
      Navigator.of(_dialogContext!).pop();
      _dialogContext = null;
    }
  }
}
