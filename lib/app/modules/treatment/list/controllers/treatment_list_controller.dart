import 'package:mobx/mobx.dart';
import 'package:tcc_medicine_management/app/modules/treatment/list/model/dto/treatment_list_dto.dart';
import 'package:tcc_medicine_management/app/modules/treatment/list/model/dto/treatment_list_request.dart';
import 'package:tcc_medicine_management/app/modules/treatment/list/repository/treatment_list_repository.dart';
import 'package:tcc_medicine_management/app/modules/treatment/shared/widgets/treatment_card_widget/controllers/treatment_card_controller.dart';
import 'package:tcc_medicine_management/app/modules/treatment/shared/widgets/treatment_card_widget/model/treatment_card_model.dart';
import 'package:tcc_medicine_management/main.dart';

part 'treatment_list_controller.g.dart';

class TreatmentListController = _TreatmentListController with _$TreatmentListController;

abstract class _TreatmentListController with Store {
  final TreatmentListRepository _treatmentListRepository = getIt<TreatmentListRepository>();

@observable
  String search = "";

  @observable
  ObservableList<TreatmentCardController> treatmentCards = ObservableList<TreatmentCardController>();

  @observable
  bool multiSelectionIsEnabled = false;

  @action
  void enableMultiSelection() => multiSelectionIsEnabled = true;

  @action
  void disableMultiSelection() {
    multiSelectionIsEnabled = false;
    _resetSelectedTasks();
  }

  @action
  void _resetSelectedTasks() {
    treatmentCards.where((element) => element.isSelected).forEach((element) {
      element.removeSelection();
    });
  }

  @action
  void selectAllCards(bool? value) {
    for (var card in treatmentCards) {
      card.isSelected = value ?? false;
    }
  }

  @action
  void removeSelectedTasks() {
    treatmentCards.removeWhere((element) => element.isSelected);

    disableMultiSelection();
  }

  @action
  Future<void> deleteTreatments(List<int> ids) async {
    try {
      for (var id in ids) {
        await _treatmentListRepository.delete(id);
      }
      getListTreatments(TreatmentListRequestDto(search: search, size: 100));
      removeSelectedTasks();
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  @action
  Future<void> getListTreatments(TreatmentListRequestDto? parameters) async {
    try {
      final List<TreatmentListDto> dataResponse = await _treatmentListRepository.exec(parameters);

      treatmentCards.clear();
      for (var element in dataResponse) {
        treatmentCards.add(
          TreatmentCardController(
            TreatmentCard(
              id: element.id.toString(),
              name: element.name!,
              quantity: element.resume?.medicineQuantity ?? 0,
              expirationDate: element.resume?.lastEndDate ?? "Sem Fim",
              patientName: element.user!,
              priority: element.importance!,
            ),
          ),
        );
      }
    } catch (e) {
      return Future.error(e.toString());
    }
  }
}