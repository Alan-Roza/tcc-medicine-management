import 'package:flutter/material.dart';

class ProfilePictureWidget extends StatelessWidget {
  const ProfilePictureWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  spreadRadius: 0,
                  blurRadius: 20,
                  offset: const Offset(2, 2),
                ),
              ],
            ),
            child: CircleAvatar(
              radius: 70, // Adjust the circle size as needed
              backgroundColor: Colors.grey.shade800,
              child: const Icon(
                Icons.camera_alt_outlined,
                size: 55,
                color: Colors.white,
              ),
            ),
          ),
          Positioned(
            bottom: 4,
            right: 4,
            child: Container(
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                color: Colors.blue,
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.white,
                  width: 1,
                ),
              ),
              child: const Icon(
                Icons.add,
                size: 26,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
