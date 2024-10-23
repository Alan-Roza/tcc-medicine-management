// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'administrator_info_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AdministratorInfoController on _AdministratorInfoController, Store {
  late final _$codeAtom =
      Atom(name: '_AdministratorInfoController.code', context: context);

  @override
  TextEditingController get code {
    _$codeAtom.reportRead();
    return super.code;
  }

  @override
  set code(TextEditingController value) {
    _$codeAtom.reportWrite(value, super.code, () {
      super.code = value;
    });
  }

  late final _$administratorNameAtom = Atom(
      name: '_AdministratorInfoController.administratorName', context: context);

  @override
  TextEditingController get administratorName {
    _$administratorNameAtom.reportRead();
    return super.administratorName;
  }

  @override
  set administratorName(TextEditingController value) {
    _$administratorNameAtom.reportWrite(value, super.administratorName, () {
      super.administratorName = value;
    });
  }

  late final _$administratorProfilePictureAtom = Atom(
      name: '_AdministratorInfoController.administratorProfilePicture',
      context: context);

  @override
  TextEditingController get administratorProfilePicture {
    _$administratorProfilePictureAtom.reportRead();
    return super.administratorProfilePicture;
  }

  @override
  set administratorProfilePicture(TextEditingController value) {
    _$administratorProfilePictureAtom
        .reportWrite(value, super.administratorProfilePicture, () {
      super.administratorProfilePicture = value;
    });
  }

  late final _$onSubmitAsyncAction =
      AsyncAction('_AdministratorInfoController.onSubmit', context: context);

  @override
  Future<void> onSubmit() {
    return _$onSubmitAsyncAction.run(() => super.onSubmit());
  }

  late final _$getAdministratorInfosAsyncAction = AsyncAction(
      '_AdministratorInfoController.getAdministratorInfos',
      context: context);

  @override
  Future<AdministratorInfoResponseDto> getAdministratorInfos(String code) {
    return _$getAdministratorInfosAsyncAction
        .run(() => super.getAdministratorInfos(code));
  }

  @override
  String toString() {
    return '''
code: ${code},
administratorName: ${administratorName},
administratorProfilePicture: ${administratorProfilePicture}
    ''';
  }
}
