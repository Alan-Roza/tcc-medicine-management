import 'dart:async';

import 'package:flutter_background/flutter_background.dart';

Future<void> enableBackgroundExecution() async {
  final androidConfig = FlutterBackgroundAndroidConfig(
    notificationTitle: "App Rodando em Segundo Plano",
    notificationText: "O aplicativo está recebendo notificações",
    notificationImportance: AndroidNotificationImportance.max,
    enableWifiLock: true,
  );

  bool success = await FlutterBackground.initialize(androidConfig: androidConfig);
  if (success) {
    await FlutterBackground.enableBackgroundExecution();
  }
}
