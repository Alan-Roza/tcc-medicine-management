// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$UserController on _UserController, Store {
  late final _$nameAtom = Atom(name: '_UserController.name', context: context);

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

  late final _$userIdAtom =
      Atom(name: '_UserController.userId', context: context);

  @override
  int? get userId {
    _$userIdAtom.reportRead();
    return super.userId;
  }

  @override
  set userId(int? value) {
    _$userIdAtom.reportWrite(value, super.userId, () {
      super.userId = value;
    });
  }

  late final _$patientIdAtom =
      Atom(name: '_UserController.patientId', context: context);

  @override
  int? get patientId {
    _$patientIdAtom.reportRead();
    return super.patientId;
  }

  @override
  set patientId(int? value) {
    _$patientIdAtom.reportWrite(value, super.patientId, () {
      super.patientId = value;
    });
  }

  late final _$patientNameAtom =
      Atom(name: '_UserController.patientName', context: context);

  @override
  String? get patientName {
    _$patientNameAtom.reportRead();
    return super.patientName;
  }

  @override
  set patientName(String? value) {
    _$patientNameAtom.reportWrite(value, super.patientName, () {
      super.patientName = value;
    });
  }

  late final _$userEmailAtom =
      Atom(name: '_UserController.userEmail', context: context);

  @override
  String? get userEmail {
    _$userEmailAtom.reportRead();
    return super.userEmail;
  }

  @override
  set userEmail(String? value) {
    _$userEmailAtom.reportWrite(value, super.userEmail, () {
      super.userEmail = value;
    });
  }

  late final _$tokenAtom =
      Atom(name: '_UserController.token', context: context);

  @override
  String? get token {
    _$tokenAtom.reportRead();
    return super.token;
  }

  @override
  set token(String? value) {
    _$tokenAtom.reportWrite(value, super.token, () {
      super.token = value;
    });
  }

  late final _$isLoggedInAtom =
      Atom(name: '_UserController.isLoggedIn', context: context);

  @override
  bool get isLoggedIn {
    _$isLoggedInAtom.reportRead();
    return super.isLoggedIn;
  }

  @override
  set isLoggedIn(bool value) {
    _$isLoggedInAtom.reportWrite(value, super.isLoggedIn, () {
      super.isLoggedIn = value;
    });
  }

  late final _$removePatientAsyncAction =
      AsyncAction('_UserController.removePatient', context: context);

  @override
  Future<void> removePatient() {
    return _$removePatientAsyncAction.run(() => super.removePatient());
  }

  late final _$_UserControllerActionController =
      ActionController(name: '_UserController', context: context);

  @override
  void login(String userName) {
    final _$actionInfo = _$_UserControllerActionController.startAction(
        name: '_UserController.login');
    try {
      return super.login(userName);
    } finally {
      _$_UserControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void logout() {
    final _$actionInfo = _$_UserControllerActionController.startAction(
        name: '_UserController.logout');
    try {
      return super.logout();
    } finally {
      _$_UserControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
name: ${name},
userId: ${userId},
patientId: ${patientId},
patientName: ${patientName},
userEmail: ${userEmail},
token: ${token},
isLoggedIn: ${isLoggedIn}
    ''';
  }
}
