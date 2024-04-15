import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tcc_medicine_management/app/modules/unauth/presentation/widgets/unauth_layout_widget.dart';

class UnauthHomePage extends StatelessWidget {
  const UnauthHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF33ABE9),
      body: UnauthLayoutWidget(
        logo: const Text(
          'LOGO',
          style: TextStyle(
            fontSize: 35,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        child: Expanded(
          flex: 2,
          child: Stack(
            children: [
              Positioned(
                top: -1,
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  padding: const EdgeInsetsDirectional.only(
                    start: 20,
                    end: 20,
                  ),
                  width: MediaQuery.of(context).size.width * 0.75,
                  color: Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      LayoutBuilder(
                        builder:
                            (BuildContext context, BoxConstraints constraints) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'bem-vindo ao tcc \no seu assistente médico!'
                                    .toUpperCase(),
                                style: const TextStyle(
                                    fontSize: 22,
                                    fontFamily:
                                        'Roboto', // Set the font family to Roboto
                                    fontWeight: FontWeight.w500,
                                    height: 1.2),
                              ),
                              Container(
                                width: constraints.maxWidth / 5,
                                height: 6,
                                margin: const EdgeInsets.only(top: 5),
                                decoration: BoxDecoration(
                                  color: const Color(0xFF00A8FF),
                                  border: Border.all(
                                    color: const Color(
                                        0xFF00A8FF), // Set border color
                                    width: 2, // Set border width
                                  ),
                                  borderRadius: BorderRadius.circular(
                                      10), // Add a border radius
                                ),
                              )
                            ],
                          );
                        },
                      ),
                      Expanded(child: Container()),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: const Color(
                              0xFF00A8FF), // Set the text color to white
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                10), // Set the border radius to 10 pixels
                          ),
                        ),
                        onPressed: () {
                          context.goNamed('MedicineStockList');
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.75,
                          height:
                              51, // Set the width to 80% of the screen width
                          alignment: Alignment.center, // Center the text
                          child: const Text(
                            'Entrar',
                            style: TextStyle(
                              fontSize: 16, // Set the font size to 16 pixels
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          side: const BorderSide(
                            color: Color(0xFF00A8FF),
                            width: 1,
                          ),
                          backgroundColor: Colors.white,
                          foregroundColor: const Color(
                              0xFF00A8FF), // Set the text color to white
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                10), // Set the border radius to 10 pixels
                          ),
                        ),
                        onPressed: () {
                          context.goNamed('MedicineStockList');
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.75,
                          height:
                              51, // Set the width to 80% of the screen width
                          alignment: Alignment.center, // Center the text
                          child: const Text(
                            'Cadastrar',
                            style: TextStyle(
                              fontSize: 16, // Set the font size to 16 pixels
                            ),
                          ),
                        ),
                      ),
                      Expanded(child: Container()),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
