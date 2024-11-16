import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:tcc_medicine_management/app/shared/widgets/profile_picture_widget/controller/profile_picture_controller.dart';

class ProfilePictureWidget extends StatefulWidget {
  const ProfilePictureWidget({super.key});

  @override
  State<ProfilePictureWidget> createState() => _ProfilePictureWidgetState();
}

class _ProfilePictureWidgetState extends State<ProfilePictureWidget> {
  Future<void> _pickImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      final profilePictureController = Provider.of<ProfilePictureController>(context, listen: false);

      setState(() {
        profilePictureController.setImage(File(pickedFile.path));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final ProfilePictureController profilePictureController = Provider.of<ProfilePictureController>(context);

    return Observer(
      builder: (_) => Center(
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
                radius: 70,
                backgroundColor: Colors.grey.shade800,
                backgroundImage:
                    profilePictureController.image != null ? FileImage(profilePictureController.image!) : null,
                child: profilePictureController.image == null
                    ? const Icon(
                        Icons.camera_alt_outlined,
                        size: 55,
                        color: Colors.white,
                      )
                    : null,
              ),
            ),
            Positioned(
              bottom: 4,
              right: 4,
              child: profilePictureController.image != null
                  ? GestureDetector(
                      onTap: () {
                        profilePictureController.clear();
                      },
                      child: Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.white,
                            width: 1,
                          ),
                        ),
                        child: const Icon(Icons.close, size: 22, color: Colors.white),
                      ),
                    )
                  : GestureDetector(
                      onTap: _pickImage,
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
                        child: const Icon(Icons.add, size: 24, color: Colors.white),
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
