import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tcc_medicine_management/app/modules/unauth/presentation/widgets/unauth_layout_widget.dart';

class UnauthLoginPage extends StatelessWidget {
  const UnauthLoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color(0xFF33ABE9),
      body: UnauthLayoutWidget(
        dinamicHeight: height / 2,
        logo: const SizedBox(
          width: 200,
          child: Text('BEM-VINDO DE VOLTA!',
              style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.w400,
                color: Colors.white,
                height: 1.2,
              ),
              textAlign: TextAlign.center),
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
                    start: 25,
                    end: 25,
                  ),
                  width: MediaQuery.of(context).size.width * 0.75,
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      LayoutBuilder(
                        builder:
                            (BuildContext context, BoxConstraints constraints) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'LOGIN',
                                style: TextStyle(
                                    fontSize: 22,
                                    fontFamily:
                                        'Roboto', // Set the font family to Roboto
                                    fontWeight: FontWeight.w500,
                                    height: 1.2),
                              ),
                              Container(
                                width: constraints.maxWidth / 10,
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
                      SizedBox(
                        height: height / 2.21,
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 5.0),
                                child: TextField(
                                  decoration: InputDecoration(
                                    labelText: 'Usuário',
                                    prefixIcon: const Icon(Icons.person),
                                    suffixIcon: IconButton(
                                      icon: const Icon(Icons.clear),
                                      onPressed: () {
                                        // Clear the text field
                                      },
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 5.0),
                                child: TextField(
                                  decoration: InputDecoration(
                                    labelText: 'Senha',
                                    prefixIcon: const Icon(Icons.person),
                                    suffixIcon: IconButton(
                                      icon: const Icon(Icons.clear),
                                      onPressed: () {
                                        // Clear the text field
                                      },
                                    ),
                                  ),
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  RichText(
                                      text: TextSpan(
                                        text: "Esqueci minha senha",
                                        style: const TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () {
                                            // Handle terms of use tap
                                          },
                                      ),
                                    ),
                                ],
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 25.0),
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    foregroundColor: Colors.white,
                                    backgroundColor: const Color(0xFF00A8FF),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  onPressed: () {
                                    context.goNamed('Login');
                                  },
                                  child: Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.75,
                                    height: 51,
                                    alignment: Alignment.center,
                                    child: const Text(
                                      'Entrar',
                                      style: TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 15.0),
                                child: RichText(
                                  text: TextSpan(
                                    children: [
                                      const TextSpan(
                                        text: "Não possui uma conta? ",
                                        style: TextStyle(color: Colors.black),
                                      ),
                                      TextSpan(
                                        text: "Cadastrar",
                                        style: const TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () {
                                            context.goNamed('Signup');
                                            // Handle terms of use tap
                                          },
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
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
