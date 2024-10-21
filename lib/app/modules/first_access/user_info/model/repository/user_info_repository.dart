import 'dart:io';
import 'package:tcc_medicine_management/app/modules/first_access/user_info/model/dto/user_info_dto.dart';

abstract class IUserInfoRepository {
  Future<UserInfoDto> exec(UserInfoDto data);
  Future<String> uploadPhoto(File imageFile);
  Future<String> getProfileImage();
}