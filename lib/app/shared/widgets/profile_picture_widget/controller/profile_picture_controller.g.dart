// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_picture_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ProfilePictureController on _ProfilePictureController, Store {
  late final _$imageAtom =
      Atom(name: '_ProfilePictureController.image', context: context);

  @override
  File? get image {
    _$imageAtom.reportRead();
    return super.image;
  }

  @override
  set image(File? value) {
    _$imageAtom.reportWrite(value, super.image, () {
      super.image = value;
    });
  }

  late final _$setImageAsyncAction =
      AsyncAction('_ProfilePictureController.setImage', context: context);

  @override
  Future<void> setImage(File? newImage) {
    return _$setImageAsyncAction.run(() => super.setImage(newImage));
  }

  late final _$_ProfilePictureControllerActionController =
      ActionController(name: '_ProfilePictureController', context: context);

  @override
  void clear() {
    final _$actionInfo = _$_ProfilePictureControllerActionController
        .startAction(name: '_ProfilePictureController.clear');
    try {
      return super.clear();
    } finally {
      _$_ProfilePictureControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
image: ${image}
    ''';
  }
}
