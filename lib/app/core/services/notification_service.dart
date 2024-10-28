import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:intl/intl.dart';
import 'package:tcc_medicine_management/main.dart';
import 'package:vibration/vibration.dart';
import 'package:timezone/timezone.dart' as tz;

class NotificationService {
  static final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  static Future<void> onDidReceiveNotification(NotificationResponse notificationResponse) async {
    final player = AudioPlayer();
    await player.play(AssetSource('audios/ring_1.mp3'));
    player.setReleaseMode(ReleaseMode.loop);
    
    if (await Vibration.hasVibrator() ?? false) {
      Vibration.vibrate(pattern: [500, 1000, 500, 2000], repeat: 0); // Vibrate with a pattern
    }

    showDialog(
      barrierDismissible: false,
      context: navigatorKey.currentContext!,
      builder: (BuildContext context) => Dialog.fullscreen(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xFF00A8FF), // Bottom color
                Color.fromARGB(255, 60, 187, 255), // Top color
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
                  'Tratamento para Sinusite', // TODO: replace Sinusite with the treatment name
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
                ),
                Expanded(flex: 1, child: Container()),
                const Icon(
                  Icons.notifications_active_outlined,
                  size: 56,
                  color: Colors.white,
                ),
                Text(
                  DateFormat('HH:mm').format(DateTime.now()),
                  style: const TextStyle(fontSize: 56, fontWeight: FontWeight.w200, color: Colors.white),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Tome 2 comprimidos de Amoxicilina 500mg',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white, height: 1.15),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Está na hora de tomar o seu remédio! Toque no botão para confirmar que tomou a medicação.',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w200, color: Colors.white),
                ),
                Expanded(
                  flex: 2,
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
                          await player.stop();
                          Vibration.cancel(); 
                          Navigator.of(context).pop();
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
                          textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.normal, color: Colors.white),
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.check, color: Colors.white),
                            SizedBox(width: 8.0),
                            Text('Confirmar', style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal, color: Colors.white)),
                          ],
                        ),
                      ),
                      Expanded(child: Container()),
                      ElevatedButton(
                        onPressed: () async {
                          await player.stop();
                          Vibration.cancel(); 
                          Navigator.of(context).pop();
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
                          textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.normal, color: Colors.white),
                        ),
                        // child: Icon(Icons.close),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // Icon(Icons.close, color: Colors.white),
                            // SizedBox(width: 8.0),
                            Text('Cancelar', style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal, color: Colors.white)),
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
