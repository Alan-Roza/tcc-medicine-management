// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$NotificationController on _NotificationController, Store {
  Computed<int>? _$unreadNotificationCountComputed;

  @override
  int get unreadNotificationCount => (_$unreadNotificationCountComputed ??=
          Computed<int>(() => super.unreadNotificationCount,
              name: '_NotificationController.unreadNotificationCount'))
      .value;

  late final _$notificationsAtom =
      Atom(name: '_NotificationController.notifications', context: context);

  @override
  ObservableList<NotificationItem> get notifications {
    _$notificationsAtom.reportRead();
    return super.notifications;
  }

  @override
  set notifications(ObservableList<NotificationItem> value) {
    _$notificationsAtom.reportWrite(value, super.notifications, () {
      super.notifications = value;
    });
  }

  late final _$_NotificationControllerActionController =
      ActionController(name: '_NotificationController', context: context);

  @override
  void addNotification(NotificationItem notification) {
    final _$actionInfo = _$_NotificationControllerActionController.startAction(
        name: '_NotificationController.addNotification');
    try {
      return super.addNotification(notification);
    } finally {
      _$_NotificationControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clearNotifications() {
    final _$actionInfo = _$_NotificationControllerActionController.startAction(
        name: '_NotificationController.clearNotifications');
    try {
      return super.clearNotifications();
    } finally {
      _$_NotificationControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
notifications: ${notifications},
unreadNotificationCount: ${unreadNotificationCount}
    ''';
  }
}
