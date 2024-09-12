import 'package:flutter/material.dart';

class FaqHelpItem {

  final IconData? icon;
  final String title;
  final String? subtitle;
  final bool greyMode;
  final Function? onTap;
  final List<FaqHelpAnswer> answers;

  FaqHelpItem({
    this.icon,
    required this.title,
    this.subtitle,
    required this.greyMode,
    this.onTap,
    required this.answers,
  });
}

class FaqHelpAnswer {
  final String question;
  final String answer;

  FaqHelpAnswer({
    required this.question,
    required this.answer,
  });
}