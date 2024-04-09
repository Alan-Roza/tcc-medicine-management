import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class UnauthLoginPage extends StatelessWidget {
  const UnauthLoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('UnauthLoginPage')),
      body: Center(
        child: ElevatedButton(
          onPressed: () => context.go('/medicine-stock-list'),
          child: const Text('Go to the Medicine Page'),
        ),
      ),
    );
  }
}