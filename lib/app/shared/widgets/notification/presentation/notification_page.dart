import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:tcc_medicine_management/app/shared/widgets/notification/controller/notification_controller.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final NotificationController notificationController = Provider.of<NotificationController>(context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Notificações"),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () {
              notificationController.clearNotifications();
            },
          ),
        ],
      ),
      body: Observer(
        builder: (_) {
          if (notificationController.notifications.isEmpty) {
            return const Center(
              child: Text("Sem Notificações."),
            );
          }

          return ListView.builder(
            itemCount: notificationController.notifications.length,
            itemBuilder: (context, index) {
              final notification = notificationController.notifications[index];
              return ListTile(
                leading: Icon(notification.icon, color: Colors.blue),
                title: Text(notification.title,
                    style: TextStyle(
                      fontWeight: notification.isRead ? FontWeight.normal : FontWeight.bold,
                    )),
                subtitle: Text(notification.description),
                trailing: Text(notification.time, style: const TextStyle(color: Colors.grey)),
                tileColor: notification.isRead ? Colors.transparent : Colors.lightBlue.shade50,
                onTap: () {
                  notification.isRead = true;
                  notificationController.notifications[index] = notification; // Update in store
                },
              );
            },
          );
        },
      ),
    );
  }
}
