import 'package:flutter/material.dart';

class NotificationItem {
  final String title;
  final String description;
  final String time;
  final IconData icon;
  bool isRead;

  NotificationItem({
    required this.title,
    required this.description,
    required this.time,
    required this.icon,
    this.isRead = false,
  });
}
