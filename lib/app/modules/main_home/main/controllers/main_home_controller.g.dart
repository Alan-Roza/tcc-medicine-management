// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main_home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MainHomeController on _MainHomeController, Store {
  late final _$hasPendencyAtom =
      Atom(name: '_MainHomeController.hasPendency', context: context);

  @override
  bool get hasPendency {
    _$hasPendencyAtom.reportRead();
    return super.hasPendency;
  }

  @override
  set hasPendency(bool value) {
    _$hasPendencyAtom.reportWrite(value, super.hasPendency, () {
      super.hasPendency = value;
    });
  }

  late final _$currentPageAtom =
      Atom(name: '_MainHomeController.currentPage', context: context);

  @override
  int get currentPage {
    _$currentPageAtom.reportRead();
    return super.currentPage;
  }

  @override
  set currentPage(int value) {
    _$currentPageAtom.reportWrite(value, super.currentPage, () {
      super.currentPage = value;
    });
  }

  late final _$selectedIndexAtom =
      Atom(name: '_MainHomeController.selectedIndex', context: context);

  @override
  int get selectedIndex {
    _$selectedIndexAtom.reportRead();
    return super.selectedIndex;
  }

  @override
  set selectedIndex(int value) {
    _$selectedIndexAtom.reportWrite(value, super.selectedIndex, () {
      super.selectedIndex = value;
    });
  }

  late final _$getResumePendencyAsyncAction =
      AsyncAction('_MainHomeController.getResumePendency', context: context);

  @override
  Future<ResumePendencyResponseDto> getResumePendency() {
    return _$getResumePendencyAsyncAction.run(() => super.getResumePendency());
  }

  late final _$_MainHomeControllerActionController =
      ActionController(name: '_MainHomeController', context: context);

  @override
  void setPage(int page) {
    final _$actionInfo = _$_MainHomeControllerActionController.startAction(
        name: '_MainHomeController.setPage');
    try {
      return super.setPage(page);
    } finally {
      _$_MainHomeControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSelectedIndex(int index) {
    final _$actionInfo = _$_MainHomeControllerActionController.startAction(
        name: '_MainHomeController.setSelectedIndex');
    try {
      return super.setSelectedIndex(index);
    } finally {
      _$_MainHomeControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
hasPendency: ${hasPendency},
currentPage: ${currentPage},
selectedIndex: ${selectedIndex}
    ''';
  }
}
