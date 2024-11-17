import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:tcc_medicine_management/app/modules/medicine/list/controllers/medicine_stock_list_controller.dart';
import 'package:tcc_medicine_management/app/shared/constants/constants.dart';
import 'package:tcc_medicine_management/app/shared/controllers/user/user_controller.dart';

class MedicineScheduleCardWidget extends StatelessWidget {
  @override
  final Key key;
  final Map<String, dynamic> medicineCard;

  MedicineScheduleCardWidget({
    required this.key,
    required this.medicineCard,
  }) : super(key: key);

  var leadingIcon;

  @override
  Widget build(BuildContext context) {
    final userController = Provider.of<UserController>(context);
    Map<String, dynamic> priorityData = _getPriorityData(medicineCard['importance']);

    return Observer(
      builder: (_) {
        // leadingIcon = null;

        // if (store.multiSelectionIsEnabled) {
        //     if (medicineCard.isSelected) {
        //       leadingIcon = const Icon(
        //         Icons.check_circle,
        //         color: Colors.green,
        //       );
        //     } else {
        //       leadingIcon = const Icon(Icons.check_circle_outline);
        //     }
        //   }

        return GestureDetector(
          onTap: () => {
            // TODO: To redirect need medicineId
              // context.goNamed('MedicineStockView',
              //     queryParameters: {'readOnly': 'true', 'medicineId': medicineCard.medicineId.toString()}),
          },
          child: Card(
            color: const Color.fromARGB(255, 255, 255, 255),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            elevation: 0,
            child: Stack(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 16.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
                        child: medicineCard['picture'] != null && medicineCard['picture']!.isNotEmpty
                            ? Image.network(
                                Constants.baseUrl + medicineCard['picture']!,
                                fit: BoxFit.cover,
                                width: 55,
                                headers: {
                                  'Authorization': 'Bearer ${userController.token}',
                                },
                              )
                            : Image.asset(
                                'assets/images/generic_medicine.png',
                                fit: BoxFit.cover,
                                width: 55,
                              ),
                      ),
                      const SizedBox(width: 8.0),
                      Expanded(
                        flex: 8,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Tratamento',
                              style: TextStyle(fontWeight: FontWeight.w300),
                            ),
                            Text(
                              medicineCard['treatmentName'] ?? '',
                              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'Medicamento',
                              style: TextStyle(fontWeight: FontWeight.w300),
                            ),
                            Text(
                              medicineCard['medicineName'] ?? '',
                              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            // const SizedBox(height: 8),
                            // RichText(
                            //   text: TextSpan(
                            //     style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black87),
                            //     children: [
                            //       const TextSpan(
                            //         text: "Quantidade: ",
                            //         style: TextStyle(fontWeight: FontWeight.normal),
                            //       ),
                            //       TextSpan(
                            //         text: "${medicineCard.quantity} unidade(s)",
                            //       ),
                            //       const TextSpan(
                            //         text: "\nVencimento: ",
                            //         style: TextStyle(fontWeight: FontWeight.normal),
                            //       ),
                            //       TextSpan(
                            //         text: medicineCard.expirationDate,
                            //       ),
                            //       const TextSpan(
                            //         text: "\nÚltimo Preço: ",
                            //         style: TextStyle(fontWeight: FontWeight.normal),
                            //       ),
                            //       TextSpan(
                            //         text: "R\$${medicineCard.price}",
                            //       ),
                            //     ],
                            //   ),
                            // ),
                          ],
                        ),
                      ),
                    ],
                  ),
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
