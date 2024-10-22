import 'dart:io';
import 'package:mobx/mobx.dart';

part 'profile_picture_controller.g.dart';

class ProfilePictureController = _ProfilePictureController with _$ProfilePictureController;

abstract class _ProfilePictureController with Store {
  @observable
  File? image;

  @action
  void setImage(File? newImage) {
    image = newImage;
  }

  @action
  void clear() {
    image = null;
  }
}