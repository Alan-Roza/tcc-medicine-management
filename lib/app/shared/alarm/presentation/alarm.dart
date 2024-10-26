import 'package:flutter/material.dart';

class AlarmScreen extends StatefulWidget {
  const AlarmScreen({super.key});

  @override
  _AlarmScreenState createState() => _AlarmScreenState();
}

class _AlarmScreenState extends State<AlarmScreen> {
  // Add sound management variables and methods here

  // @override
  // void initState() {
  //   super.initState();
  //   // Start playing the alarm sound
  // }

  // @override
  // void dispose() {
  //   // Stop the alarm sound
  //   super.dispose();
  // }

  void _stopAlarm() {
    // Logic to stop the alarm
    Navigator.of(context).pop(); // Go back to the previous screen
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Alarm')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Alarm is ringing!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _stopAlarm,
              child: const Text('Stop Alarm'),
            ),
          ],
        ),
      ),
    );
  }
}
