// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_info_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$UserInfoController on _UserInfoController, Store {
  Computed<String?>? _$nameErrorComputed;

  @override
  String? get nameError =>
      (_$nameErrorComputed ??= Computed<String?>(() => super.nameError,
              name: '_UserInfoController.nameError'))
          .value;

  late final _$genderAtom =
      Atom(name: '_UserInfoController.gender', context: context);

  @override
  Gender? get gender {
    _$genderAtom.reportRead();
    return super.gender;
  }

  @override
  set gender(Gender? value) {
    _$genderAtom.reportWrite(value, super.gender, () {
      super.gender = value;
    });
  }

  late final _$onSubmitAsyncAction =
      AsyncAction('_UserInfoController.onSubmit', context: context);

  @override
  Future<UserInfoDto> onSubmit(GlobalKey<FormState> formKey, int? userId) {
    return _$onSubmitAsyncAction.run(() => super.onSubmit(formKey, userId));
  }

  late final _$uploadPhotoAsyncAction =
      AsyncAction('_UserInfoController.uploadPhoto', context: context);

  @override
  Future<String> uploadPhoto(File profileImage) {
    return _$uploadPhotoAsyncAction.run(() => super.uploadPhoto(profileImage));
  }

  late final _$getProfileImageAsyncAction =
      AsyncAction('_UserInfoController.getProfileImage', context: context);

  @override
  Future<String> getProfileImage() {
    return _$getProfileImageAsyncAction.run(() => super.getProfileImage());
  }

  late final _$getPatientAsyncAction =
      AsyncAction('_UserInfoController.getPatient', context: context);

  @override
  Future<UserInfoDto?> getPatient() {
    return _$getPatientAsyncAction.run(() => super.getPatient());
  }

  late final _$_UserInfoControllerActionController =
      ActionController(name: '_UserInfoController', context: context);

  @override
  void setName(String value) {
    final _$actionInfo = _$_UserInfoControllerActionController.startAction(
        name: '_UserInfoController.setName');
    try {
      return super.setName(value);
    } finally {
      _$_UserInfoControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setBirthDate(DateTime value) {
    final _$actionInfo = _$_UserInfoControllerActionController.startAction(
        name: '_UserInfoController.setBirthDate');
    try {
      return super.setBirthDate(value);
    } finally {
      _$_UserInfoControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setGender(Gender value) {
    final _$actionInfo = _$_UserInfoControllerActionController.startAction(
        name: '_UserInfoController.setGender');
    try {
      return super.setGender(value);
    } finally {
      _$_UserInfoControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPhone(String value) {
    final _$actionInfo = _$_UserInfoControllerActionController.startAction(
        name: '_UserInfoController.setPhone');
    try {
      return super.setPhone(value);
    } finally {
      _$_UserInfoControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clearName() {
    final _$actionInfo = _$_UserInfoControllerActionController.startAction(
        name: '_UserInfoController.clearName');
    try {
      return super.clearName();
    } finally {
      _$_UserInfoControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clearGender() {
    final _$actionInfo = _$_UserInfoControllerActionController.startAction(
        name: '_UserInfoController.clearGender');
    try {
      return super.clearGender();
    } finally {
      _$_UserInfoControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clearPhone() {
    final _$actionInfo = _$_UserInfoControllerActionController.startAction(
        name: '_UserInfoController.clearPhone');
    try {
      return super.clearPhone();
    } finally {
      _$_UserInfoControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
gender: ${gender},
nameError: ${nameError}
    ''';
  }
}
