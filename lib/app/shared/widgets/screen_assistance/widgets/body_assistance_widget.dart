import 'package:flutter/material.dart';
import 'package:tcc_medicine_management/app/shared/widgets/padded_screen.dart';

class BodyAssistanceWidget extends StatelessWidget {
  final Widget image;
  final String title;
  final List<TextSpan> message;
  bool isInverse;

  BodyAssistanceWidget({
    super.key,
    required this.image,
    required this.title,
    required this.message,
    this.isInverse = false,
  });

  @override
  Widget build(BuildContext context) {
    return PaddedScreen(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (isInverse)
            const SizedBox.shrink()
          else
            Column(
              children: [
                image,
                const SizedBox(height: 50),
              ],
            ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                title,
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Container(
                width: 40,
                height: 6,
                decoration: BoxDecoration(
                  color: const Color(0xFF00A8FF),
                  border: Border.all(
                    color: const Color(0xFF00A8FF), // Set border color
                    width: 2, // Set border width
                  ),
                  borderRadius: BorderRadius.circular(10), // Add a border radius
                ),
              )
            ],
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                style: const TextStyle(color: Colors.black54, fontSize: 16, height: 1.25),
                children: [...message],
              ),
            ),
          ),
          if (isInverse)
            Column(
              children: [
                const SizedBox(height: 50),
                image,
              ],
            )
          else
            const SizedBox.shrink()
        ],
      ),
    );
  }
}
