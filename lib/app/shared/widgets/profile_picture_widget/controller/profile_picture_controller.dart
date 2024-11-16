import 'dart:io';
import 'package:mobx/mobx.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';

part 'profile_picture_controller.g.dart';

class ProfilePictureController = _ProfilePictureController with _$ProfilePictureController;

abstract class _ProfilePictureController with Store {
  @observable
  File? image;

  @action
  Future<void> setImage(File? newImage) async {
    if (newImage != null) {
      final file = File(newImage.path);
      final compressedImage = await _compressImage(file);
      image = File(compressedImage.path);
    } else {
      image = null;
    }
  }

  @action
  void clear() {
    image = null;
  }

  Future<XFile> _compressImage(File file) async {
    final filePath = file.absolute.path;
    final lastIndex = filePath.lastIndexOf(RegExp(r'.jp'));
    final split = filePath.substring(0, lastIndex);
    final outPath = "${split}_out${filePath.substring(lastIndex)}";

    final result = await FlutterImageCompress.compressAndGetFile(
      file.absolute.path,
      outPath,
      quality: 50,
    );
    
    final beforeCompress = await file.length();
    final afterCompress = await result!.length();
    print('Before compression: $beforeCompress bytes');
    print('After compression: $afterCompress bytes');

    return result;
  }
}