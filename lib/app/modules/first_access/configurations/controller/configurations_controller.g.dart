// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'configurations_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ConfigurationsController on _ConfigurationsController, Store {
  late final _$allowDataStorageAtom = Atom(
      name: '_ConfigurationsController.allowDataStorage', context: context);

  @override
  bool get allowDataStorage {
    _$allowDataStorageAtom.reportRead();
    return super.allowDataStorage;
  }

  @override
  set allowDataStorage(bool value) {
    _$allowDataStorageAtom.reportWrite(value, super.allowDataStorage, () {
      super.allowDataStorage = value;
    });
  }

  late final _$notifyWhatsappAtom =
      Atom(name: '_ConfigurationsController.notifyWhatsapp', context: context);

  @override
  bool get notifyWhatsapp {
    _$notifyWhatsappAtom.reportRead();
    return super.notifyWhatsapp;
  }

  @override
  set notifyWhatsapp(bool value) {
    _$notifyWhatsappAtom.reportWrite(value, super.notifyWhatsapp, () {
      super.notifyWhatsapp = value;
    });
  }

  late final _$notifyEmailAtom =
      Atom(name: '_ConfigurationsController.notifyEmail', context: context);

  @override
  bool get notifyEmail {
    _$notifyEmailAtom.reportRead();
    return super.notifyEmail;
  }

  @override
  set notifyEmail(bool value) {
    _$notifyEmailAtom.reportWrite(value, super.notifyEmail, () {
      super.notifyEmail = value;
    });
  }

  late final _$notifyPopupAtom =
      Atom(name: '_ConfigurationsController.notifyPopup', context: context);

  @override
  bool get notifyPopup {
    _$notifyPopupAtom.reportRead();
    return super.notifyPopup;
  }

  @override
  set notifyPopup(bool value) {
    _$notifyPopupAtom.reportWrite(value, super.notifyPopup, () {
      super.notifyPopup = value;
    });
  }

  late final _$fontSizeAtom =
      Atom(name: '_ConfigurationsController.fontSize', context: context);

  @override
  String get fontSize {
    _$fontSizeAtom.reportRead();
    return super.fontSize;
  }

  @override
  set fontSize(String value) {
    _$fontSizeAtom.reportWrite(value, super.fontSize, () {
      super.fontSize = value;
    });
  }

  late final _$getConfigurationsAsyncAction = AsyncAction(
      '_ConfigurationsController.getConfigurations',
      context: context);

  @override
  Future<void> getConfigurations() {
    return _$getConfigurationsAsyncAction.run(() => super.getConfigurations());
  }

  late final _$onSubmitAsyncAction =
      AsyncAction('_ConfigurationsController.onSubmit', context: context);

  @override
  Future<ConfigurationsInfoDto> onSubmit() {
    return _$onSubmitAsyncAction.run(() => super.onSubmit());
  }

  late final _$_ConfigurationsControllerActionController =
      ActionController(name: '_ConfigurationsController', context: context);

  @override
  void toggleDataStorage() {
    final _$actionInfo = _$_ConfigurationsControllerActionController
        .startAction(name: '_ConfigurationsController.toggleDataStorage');
    try {
      return super.toggleDataStorage();
    } finally {
      _$_ConfigurationsControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
allowDataStorage: ${allowDataStorage},
notifyWhatsapp: ${notifyWhatsapp},
notifyEmail: ${notifyEmail},
notifyPopup: ${notifyPopup},
fontSize: ${fontSize}
    ''';
  }
}
