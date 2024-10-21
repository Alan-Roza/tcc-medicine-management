import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;

class NotificationService {
  static final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  static Future<void> onDidReceiveNotification(NotificationResponse notificationResponse) async {}

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
      ),
    );
    await flutterLocalNotificationsPlugin.zonedSchedule(
        0, 
        title, 
        body, 
        tz.TZDateTime.from(scheduledDate, tz.local), 
        platformChannelSpecifics,
        uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime,
        matchDateTimeComponents: DateTimeComponents.dateAndTime);
  }
}
