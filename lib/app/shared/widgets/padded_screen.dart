import 'package:flutter/material.dart';

class PaddedScreen extends StatelessWidget {
  final Widget child;

  const PaddedScreen({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24.0, right: 24.0, top: 16.0),
      child: child,
    );
  }
}