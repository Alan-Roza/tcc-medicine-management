import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:tcc_medicine_management/app/modules/main_home/profile/faq_help/model/faq_help_model.dart';

part 'faq_help_controller.g.dart';

class FaqHelpController = _FaqHelpController with _$FaqHelpController;

abstract class _FaqHelpController with Store {
  @observable
  int currentPage = 0;
  @observable
  FaqHelpItem? selectedItem;

  List<FaqHelpItem> faqHelpItems = [
    FaqHelpItem(
      icon: Icons.help_outline,
      title: 'Item 1',
      subtitle: 'Subtitle for Item 1',
      greyMode: false,
      answers: List.generate(
        5,
        (index) => FaqHelpAnswer(
          question: 'Question $index',
          answer: 'Answer $index',
        ),
      ),
      onTap: () {
        // TODO: Implement onTap logic for Item 2
      },
    ),
    FaqHelpItem(
      icon: Icons.help_outline,
      title: 'Item 2',
      subtitle: 'Subtitle for Item 2',
      greyMode: false,
      answers: List.generate(
        5,
        (index) => FaqHelpAnswer(
          question: 'Question $index',
          answer: 'Answer $index',
        ),
      ),
      onTap: () {
        // TODO: Implement onTap logic for Item 2
      },
    ),
    FaqHelpItem(
      icon: Icons.help_outline,
      title: 'Item 3',
      subtitle: 'Subtitle for Item 3',
      greyMode: false,
      answers: List.generate(
        5,
        (index) => FaqHelpAnswer(
          question: 'Question $index',
          answer: 'Answer $index',
        ),
      ),
      onTap: () {
        // TODO: Implement onTap logic for Item 2
      },
    ),
  ];

  @observable
  ObservableList<bool> isOpenList = ObservableList.of([false, false]);

  @action
  void toggle(int index) {
    isOpenList[index] = !isOpenList[index];
  }

  @action
  void onSearch(String value) {}

  @action
  void onSelectItem(FaqHelpItem helpItem) {
    selectedItem = helpItem;
  }
}
