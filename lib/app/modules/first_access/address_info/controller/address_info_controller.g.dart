// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address_info_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AddressInfoController on _AddressInfoController, Store {
  late final _$getAddressInfoAsyncAction =
      AsyncAction('_AddressInfoController.getAddressInfo', context: context);

  @override
  Future<void> getAddressInfo(String cep) {
    return _$getAddressInfoAsyncAction.run(() => super.getAddressInfo(cep));
  }

  late final _$onSubmitAsyncAction =
      AsyncAction('_AddressInfoController.onSubmit', context: context);

  @override
  Future<AddressInfoDto> onSubmit(GlobalKey<FormState> formKey) {
    return _$onSubmitAsyncAction.run(() => super.onSubmit(formKey));
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
