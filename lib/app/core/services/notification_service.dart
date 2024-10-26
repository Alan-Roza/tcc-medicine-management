import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:intl/intl.dart';
import 'package:tcc_medicine_management/main.dart';
import 'package:timezone/timezone.dart' as tz;

class NotificationService {
  static final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  static Future<void> onDidReceiveNotification(NotificationResponse notificationResponse) async {
    final player = AudioPlayer();
    await player.play(AssetSource('audios/ring_1.mp3'));
    player.setReleaseMode(ReleaseMode.loop);

    showDialog(
      barrierDismissible: false,
      context: navigatorKey.currentContext!,
      builder: (BuildContext context) => AlertDialog(
        backgroundColor: const Color.fromARGB(248, 218, 218, 218),
        title: Text('Tratamento para Sinusite'), // TODO: replace Sinusite with the treatment name
        content: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Tome 2 comprimidos de Amoxicilina 500mg',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const Text(
              'Está na hora de tomar o seu remédio! Toque no botão para confirmar que tomou a medicação.',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w300),
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
            Text(
              DateFormat('HH:mm').format(DateTime.now()),
              style: TextStyle(fontSize: 46, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Expanded(child: Container()),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () async {
                    await player.stop();
                    Navigator.of(context).pop();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    // minimumSize: const Size(double.infinity, 40),
                    textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.normal, color: Colors.white),
                  ),
                  child: Icon(Icons.check),
                  // child: const Row(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   children: [
                  //     Icon(Icons.check),
                  //     SizedBox(width: 8.0),
                  //     Text('CONFIRMAR'),
                  //   ],
                  // ),
                ),
                ElevatedButton(
                  onPressed: () async {
                    await player.stop();
                    Navigator.of(context).pop();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    // minimumSize: const Size(double.infinity, 40),
                    textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.normal, color: Colors.white),
                  ),
                  child: Icon(Icons.close),
                  // child: const Row(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   children: [
                  //     Icon(Icons.close),
                  //     SizedBox(width: 8.0),
                  //     Text('CANCELAR'),
                  //   ],
                  // ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
// Play alarm sound
// You can use a package like audioplayers to play the alarm sound
// Example:
// final player = AudioCache();
// player.play('alarm_sound.mp3');
  }

  static Future<void> initialize() async {
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

  static Future<void> showInstantNotification(String title, String body) async {
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
        timeoutAfter: 60000, // Set timeout to 1 minute (60,000 milliseconds)
      ),
    );
    await flutterLocalNotificationsPlugin.show(0, title, body, platformChannelSpecifics);
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
}
