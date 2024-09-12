import 'package:flutter/material.dart';

class FaqHelpItem {

  final IconData? icon;
  final String title;
  final String? subtitle;
  final bool greyMode;
  final Function? onTap;

  FaqHelpItem({
    this.icon,
    required this.title,
    this.subtitle,
    required this.greyMode,
    this.onTap,
  });
}