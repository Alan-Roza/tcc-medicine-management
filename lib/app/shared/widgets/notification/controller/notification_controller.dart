import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:tcc_medicine_management/app/shared/widgets/notification/model/notification.dart';

part 'notification_controller.g.dart';

class NotificationController = _NotificationController with _$NotificationController;

abstract class _NotificationController with Store {
  @observable
  ObservableList<NotificationItem> notifications = ObservableList.of(
    [
      NotificationItem(
        title: "New Message",
        description: "You have received a new message from John.",
        time: "2 mins ago",
        icon: Icons.message,
      ),
      NotificationItem(
        title: "Update Available",
        description: "A new update is available for your app.",
        time: "1 hour ago",
        icon: Icons.update,
      ),
      NotificationItem(
        title: "Appointment Reminder",
        description: "Your appointment with Dr. Smith is tomorrow at 10 AM.",
        time: "5 hours ago",
        icon: Icons.calendar_today,
      ),
    ],
  );

  @computed
  int get unreadNotificationCount {
    return notifications.where((notification) => !notification.isRead).length;
  }

  @action
  void addNotification(NotificationItem notification) {
    notifications.add(notification);
  }

  @action
  void clearNotifications() {
    notifications.clear();
  }
}
