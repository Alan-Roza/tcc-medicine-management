import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:intl/intl.dart';
import 'package:tcc_medicine_management/app/modules/main_home/profile/shared/patient_card_widget/controllers/patient_card_controller.dart';

class PatientCardWidget extends StatelessWidget {
  @override
  final Key key;
  final PatientCardController patientCard;

  const PatientCardWidget({
    required this.key,
    required this.patientCard,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final patientListController = Provider.of<PatientListController>(context);

    return Observer(
      builder: (_) {
        return GestureDetector(
          // onTap: () => {
          //   if (patientListController.multiSelectionIsEnabled)
          //     {patientCard.toggleSelection()}
          //   else
          //     context.goNamed('TreatmentView', queryParameters: {
          //       'readOnly': 'true',
          //     }),
          // },
          // onLongPress: () => {
          //   patientListController.enableMultiSelection(),
          //   patientCard.addSelection(),
          // },
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Card(
              color: false ? const Color.fromARGB(75, 0, 170, 255) : Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              elevation: 0,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: const Color(0xFFFF5334),
                    ),
                    // padding: const EdgeInsets.symmetric(horizontal: 6.0),
                    height: MediaQuery.of(context).size.height * 0.2,
                    width: 100,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: Image.network(
                            'https://picsum.photos/3250?image=9',
                            fit: BoxFit.cover,
                            height: MediaQuery.of(context).size.height * 0.12,
                            width: 100,
                          ),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        const Text(
                          'ÚLTIMO ACESSO',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.w200,
                          ),
                        ),
                        Text(
                          DateFormat('dd/MM/yyyy').format(patientCard.lastAccess),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
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
                  const SizedBox(width: 8.0),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 16.0),
                    child: Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Comprimido",
                            style: TextStyle(fontWeight: FontWeight.w300),
                          ),
                          Text(
                            patientCard.name,
                            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 8),
                          RichText(
                            softWrap: true,
                            overflow: TextOverflow.ellipsis,
                            text: TextSpan(
                              style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black87),
                              children: [
                                const TextSpan(
                                  text: "Contato: ",
                                  style: TextStyle(fontWeight: FontWeight.normal),
                                ),
                                TextSpan(
                                  text: patientCard.cellphone,
                                ),
                                const TextSpan(
                                  text: "\nIdade: ",
                                  style: TextStyle(fontWeight: FontWeight.normal),
                                ),
                                TextSpan(
                                  text: patientCard.age.toString(),
                                ),
                                const TextSpan(
                                  text: "\nGênero: ",
                                  style: TextStyle(fontWeight: FontWeight.normal),
                                ),
                                TextSpan(
                                  text: patientCard.gender,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
