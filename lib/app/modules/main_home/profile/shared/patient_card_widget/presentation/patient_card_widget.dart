import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:tcc_medicine_management/app/modules/main_home/main/controllers/main_home_controller.dart';
import 'package:tcc_medicine_management/app/modules/main_home/profile/shared/patient_card_widget/controllers/patient_card_controller.dart';
import 'package:tcc_medicine_management/app/shared/controllers/user/user_controller.dart';

class PatientCardWidget extends StatelessWidget {
  @override
  final Key key;
  final PatientCardController patientCard;

  const PatientCardWidget({
    required this.key,
    required this.patientCard,
  }) : super(key: key);

  String formatPhoneNumber(String phoneNumber) {
    // Remover o código do país (55)
    String withoutCountryCode = phoneNumber.substring(2);

    // Extrair o DDD (primeiros 2 dígitos após remover o código do país)
    String ddd = withoutCountryCode.substring(0, 2);

    // Extrair o restante do número
    String firstPart = withoutCountryCode.substring(2, 7);
    String secondPart = withoutCountryCode.substring(7);

    // Formatar como (XX) XXXXX-XXXX
    return '($ddd) $firstPart-$secondPart';
  }

  @override
  Widget build(BuildContext context) {
    final patientCardController = Provider.of<PatientCardController>(context);
    final userController = Provider.of<UserController>(context);
    final mainHomeController = Provider.of<MainHomeController>(context);

    return Observer(
      builder: (_) {
        return GestureDetector(
          onTap: () => {
            userController.patientId = patientCard.id,
            userController.patientName = patientCard.name,
            mainHomeController.setSelectedIndex(0),
            patientCardController.accessPatient(patientCard.id),
            context.goNamed("MainHome"),
          },
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
                      boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        spreadRadius: 1,
                        blurRadius: 10,
                        offset: Offset(3, 0), // changes position of shadow
                      ),
                      ],
                    ),
                    // padding: const EdgeInsets.symmetric(horizontal: 6.0),
                    height: MediaQuery.of(context).size.height * 0.2,
                    width: 100,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                      if (patientCard.imageUrl.isNotEmpty)
                        ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child: Image.network(
                          patientCard.imageUrl,
                          headers: {
                          'Authorization': 'Bearer ${userController.token}',
                          },
                          fit: BoxFit.cover,
                          height: MediaQuery.of(context).size.height * 0.12,
                          width: 100,
                        ),
                        ),
                      if (patientCard.imageUrl.isEmpty)
                        ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child: Container(
                          width: 100,
                          height: MediaQuery.of(context).size.height * 0.12,
                          color: const Color.fromARGB(78, 255, 185, 173),
                          child: const Icon(
                          Icons.camera_alt_outlined,
                          size: 55,
                          color: Colors.white,
                          ),
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
                        patientCard.lastAccess != null
                          ? DateFormat('dd/MM/yyyy').format(patientCard.lastAccess!)
                          : '-',
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
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Paciente',
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
                                text: "Idade: ",
                                style: TextStyle(fontWeight: FontWeight.normal),
                              ),
                              TextSpan(
                                text: "${patientCard.age} ano(s)",
                              ),
                              const TextSpan(
                                text: "\nGênero: ",
                                style: TextStyle(fontWeight: FontWeight.normal),
                              ),
                              TextSpan(
                                text: patientCard.gender,
                              ),
                              const TextSpan(
                                text: "\nContato: ",
                                style: TextStyle(fontWeight: FontWeight.normal),
                              ),
                              TextSpan(
                                text: formatPhoneNumber(patientCard.cellphone),
                              ),
                            ],
                          ),
                        ),
                      ],
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
