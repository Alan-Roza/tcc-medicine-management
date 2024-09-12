import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:tcc_medicine_management/app/modules/main_home/profile/faq_help/model/faq_help_model.dart';

part 'faq_help_controller.g.dart';

class FaqHelpController = _FaqHelpController with _$FaqHelpController;

abstract class _FaqHelpController with Store {
  @observable
  int currentPage = 0;
  List<FaqHelpItem> faqHelpItems = [
     FaqHelpItem(
      icon: Icons.help_outline,
      title: 'Item 1',
      subtitle: 'Subtitle for Item 1',
      greyMode: false,
      onTap: () {
        // TODO: Implement onTap logic for Item 2
      },
    ),
    FaqHelpItem(
      icon: Icons.help_outline,
      title: 'Item 2',
      subtitle: 'Subtitle for Item 2',
      greyMode: false,
      onTap: () {
        // TODO: Implement onTap logic for Item 2
      },
    ),
     FaqHelpItem(
      icon: Icons.help_outline,
      title: 'Item 3',
      subtitle: 'Subtitle for Item 3',
      greyMode: false,
      onTap: () {
        // TODO: Implement onTap logic for Item 2
      },
    ),
  ];

  @action
  void onSearch(String value) {
  }
}
