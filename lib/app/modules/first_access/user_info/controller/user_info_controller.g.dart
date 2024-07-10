// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_info_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$UserInfoController on _UserInfoController, Store {
  late final _$nameAtom =
      Atom(name: '_UserInfoController.name', context: context);

  @override
  String get name {
    _$nameAtom.reportRead();
    return super.name;
  }

  @override
  set name(String value) {
    _$nameAtom.reportWrite(value, super.name, () {
      super.name = value;
    });
  }

  late final _$birthDateAtom =
      Atom(name: '_UserInfoController.birthDate', context: context);

  @override
  String get birthDate {
    _$birthDateAtom.reportRead();
    return super.birthDate;
  }

  @override
  set birthDate(String value) {
    _$birthDateAtom.reportWrite(value, super.birthDate, () {
      super.birthDate = value;
    });
  }

  late final _$genderAtom =
      Atom(name: '_UserInfoController.gender', context: context);

  @override
  String get gender {
    _$genderAtom.reportRead();
    return super.gender;
  }

  @override
  set gender(String value) {
    _$genderAtom.reportWrite(value, super.gender, () {
      super.gender = value;
    });
  }

  late final _$phoneAtom =
      Atom(name: '_UserInfoController.phone', context: context);

  @override
  String get phone {
    _$phoneAtom.reportRead();
    return super.phone;
  }

  @override
  set phone(String value) {
    _$phoneAtom.reportWrite(value, super.phone, () {
      super.phone = value;
    });
  }

  late final _$_UserInfoControllerActionController =
      ActionController(name: '_UserInfoController', context: context);

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
  void clearBirthDate() {
    final _$actionInfo = _$_UserInfoControllerActionController.startAction(
        name: '_UserInfoController.clearBirthDate');
    try {
      return super.clearBirthDate();
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
name: ${name},
birthDate: ${birthDate},
gender: ${gender},
phone: ${phone}
    ''';
  }
}
