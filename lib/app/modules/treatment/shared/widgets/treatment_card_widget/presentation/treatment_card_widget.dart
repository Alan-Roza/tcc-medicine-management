import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:tcc_medicine_management/app/modules/treatment/list/controllers/treatment_list_controller.dart';
import 'package:tcc_medicine_management/app/modules/treatment/shared/widgets/treatment_card_widget/controllers/treatment_card_controller.dart';
import 'package:tcc_medicine_management/app/shared/controllers/user/user_controller.dart';

class TreatmentCardWidget extends StatelessWidget {
  @override
  final Key key;
  final TreatmentCardController treatmentCard;

  const TreatmentCardWidget({
    required this.key,
    required this.treatmentCard,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final treatmentListController = Provider.of<TreatmentListController>(context);
    final userController = Provider.of<UserController>(context);

    Map<String, dynamic> priorityData = _getPriorityData(treatmentCard.priority);

    return Observer(
      builder: (_) {
        return GestureDetector(
          onTap: () => {
            if (treatmentListController.multiSelectionIsEnabled)
              {treatmentCard.toggleSelection()}
            else
              context.goNamed('TreatmentView', queryParameters: {
                'readOnly': 'true',
                'treatmentId': treatmentCard.id,
              }),
          },
          onLongPress: () => {
            treatmentListController.enableMultiSelection(),
            treatmentCard.addSelection(),
          },
          child: Card(
            color: treatmentCard.isSelected ? const Color.fromARGB(75, 0, 170, 255) : Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            elevation: 0,
            child: Stack(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color: const Color(0xFFFF5334),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 6.0),
                      height: MediaQuery.of(context).size.height * 0.2,
                      width: 100,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          const Text(
                            'Paciente',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          Text(
                            // treatmentCard.patientName, //TODO: when patient name comes from the server, change this
                            userController.name ??
                                treatmentCard.patientName.substring(0, treatmentCard.patientName.indexOf('@')),
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                        ],
                      ),
                    ),
                    // Container(
                    //   decoration: const BoxDecoration(color: Color(0x00ff5334)),
                    //   child: Center(
                    //     child: Column(
                    //       children: [
                    //         const Text(
                    //           'Paciente',
                    //           style: TextStyle(color: Colors.white, fontWeight: FontWeight.w300),
                    //         ),
                    //         Text(
                    //           treatmentCard.patientName,
                    //           style: const TextStyle(color: Colors.white),
                    //         ),
                    //       ],
                    //     ),
                    //   ),
                    // ),
                    const SizedBox(width: 5.0),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
                      child: Expanded(
                        flex: 8,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Texto "Tratamento"
                            const Text(
                              "Tratamento",
                              style: TextStyle(fontWeight: FontWeight.w300),
                            ),
                            // Aplicar elipsis ao tratamento
                            // Usando um Text normal para elipsis com propriedades de estilo
                            Text(
                              treatmentCard.name.length > 15
                                ? '${treatmentCard.name.substring(0, 15)}...'
                                : treatmentCard.name,
                              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                            const SizedBox(height: 8),
                            RichText(
                              text: TextSpan(
                                style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black87),
                                children: [
                                  const TextSpan(
                                    text: "Quantidade: ",
                                    style: TextStyle(fontWeight: FontWeight.normal),
                                  ),
                                  TextSpan(
                                    text: "${treatmentCard.quantity} medicamento(s)",
                                  ),
                                  const TextSpan(
                                    text: "\nVencimento: ",
                                    style: TextStyle(fontWeight: FontWeight.normal),
                                  ),
                                  TextSpan(
                                    text: DateFormat.yMd().format(DateTime.parse(treatmentCard.expirationDate)).length > 13
                                      ? '${DateFormat.yMd().format(DateTime.parse(treatmentCard.expirationDate)).substring(0, 13)}...' // Truncate and add ellipsis
                                      : DateFormat.yMd().format(DateTime.parse(treatmentCard.expirationDate)),
                                  ),
                                  // TODO: verify what text put instead of price
                                  // const TextSpan(
                                  //   text: "\nÚltimo Preço: ",
                                  //   style: TextStyle(fontWeight: FontWeight.normal),
                                  // ),
                                  // TextSpan(
                                  //   text: "R\$${treatmentCard.price.toStringAsFixed(2)}",
                                  // ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Positioned(
                  top: 12,
                  right: 12,
                  child: Container(
                    padding: const EdgeInsets.all(4.0),
                    decoration: BoxDecoration(
                      color: priorityData["background"],
                      borderRadius: BorderRadius.circular(3.0),
                      border: Border.all(
                        color: priorityData["color"],
                        width: 1.0,
                      ),
                    ),
                    child: Text(
                      priorityData["text"],
                      style: TextStyle(color: priorityData["color"], fontSize: 8, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Map<String, dynamic> _getPriorityData(String? priority) {
    switch (priority) {
      case 'Nenhuma':
        return {
          'text': '',
          'background': Colors.transparent,
          'color': Colors.transparent,
        };
      case 'Baixa':
        return {
          'text': 'Comum',
          'background': Colors.green[100],
          'color': Colors.green[800],
        };
      case 'Média':
        return {
          'text': 'Moderado',
          'background': Colors.yellow[100],
          'color': Colors.yellow[800],
        };
      case 'Alta':
        return {
          'text': 'Prioritário',
          'background': Colors.orange[100],
          'color': Colors.orange[800],
        };
      case 'Crítica':
        return {
          'text': 'De Risco',
          'background': Colors.red[100],
          'color': Colors.red[800],
        };
      default:
        return {
          'text': '',
          'background': Colors.transparent,
          'color': Colors.transparent,
        };
    }
  }
}
