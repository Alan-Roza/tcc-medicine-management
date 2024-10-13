import 'package:flutter/material.dart';

class PaddedScreenWithoutBottom extends StatelessWidget {
  final Widget child;

  const PaddedScreenWithoutBottom({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
      child: child,
    );
  }
}