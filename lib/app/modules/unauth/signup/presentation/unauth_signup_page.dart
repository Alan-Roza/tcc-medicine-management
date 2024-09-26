import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:go_router/go_router.dart';
import 'package:tcc_medicine_management/app/modules/unauth/shared/widgets/unauth_layout_widget.dart';
import 'package:tcc_medicine_management/app/modules/unauth/signup/controller/signup_controller.dart';

class UnauthSignupPage extends StatelessWidget {
  const UnauthSignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    final signupController = SignupController();
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color(0xFF33ABE9),
      body: UnauthLayoutWidget(
        dinamicHeight: height / 2,
        logo: const SizedBox(
          width: 200,
          child: Text('OLÁ, SEJA BEM-VINDO!',
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
                              Text(
                                'Cadastrar'.toUpperCase(),
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
                      SizedBox(
                        height: height / 2.3,
                        child: SingleChildScrollView(
                          child: Form(
                            key: formKey,
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 5.0),
                                  child: Observer(
                                    builder: (_) => TextFormField(
                                      onChanged: signupController.setEmail,
                                      decoration: const InputDecoration(
                                        labelText: 'E-mail',
                                        prefixIcon: Icon(Icons.email_outlined),
                                      ),
                                      validator: (_) => signupController.emailError,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 5.0),
                                  child: Observer(
                                    builder: (_) => TextFormField(
                                      obscureText: true,
                                      onChanged: signupController.setPassword,
                                      decoration: const InputDecoration(
                                        labelText: 'Senha',
                                        prefixIcon: Icon(Icons.lock_outline),
                                      ),
                                      validator: (_) => signupController.passwordError,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 5.0),
                                  child: Observer(
                                    builder: (_) => TextFormField(
                                      obscureText: true,
                                      onChanged: signupController.setConfirmPassword,
                                      decoration: const InputDecoration(
                                        labelText: 'Confirmar Senha',
                                        prefixIcon: Icon(Icons.lock_outline),
                                      ),
                                      validator: (_) => signupController.confirmPasswordError,
                                    ),
                                  ),
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
                                      // userController.login("Alan Roza");
                                      
                                      final Future<String?> response = signupController.onSignup(formKey);

                                      response.then(
                                        (value) {
                                          // TODO: validation, use after finished
                                          // if (value != null &&
                                          //     value.isNotEmpty) {
                                          //   ScaffoldMessenger.of(context)
                                          //       .showSnackBar(
                                          //     SnackBar(
                                          //       content: Text(value),
                                          //     ),
                                          //   );
                                          // } else {
                                          if (value!.isNotEmpty) {
                                            ScaffoldMessenger.of(context).showSnackBar(
                                              const SnackBar(
                                                content: Text('Cadastrado realizado com sucesso!'),
                                              ),
                                            );
                                            // context.goNamed('FirstAccess'); // TODO - Add conditional
                                            context.goNamed('MainHome');
                                          }
                                          // }
                                        },
                                      );
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
                                      const EdgeInsets.symmetric(vertical: 5.0),
                                  child: RichText(
                                    text: TextSpan(
                                      children: [
                                        const TextSpan(
                                          text:
                                              "Cadastrando-se com o TCC, você aceita os ",
                                          style: TextStyle(color: Colors.black54),
                                        ),
                                        TextSpan(
                                          text: "Termos de Uso",
                                          style: const TextStyle(color: Colors.blue),
                                          recognizer: TapGestureRecognizer()
                                            ..onTap = () {
                                              // Handle terms of use tap
                                            },
                                        ),
                                        const TextSpan(
                                          text: " e a ",
                                          style: TextStyle(color: Colors.black54),
                                        ),
                                        TextSpan(
                                          text: "Política de Privacidade",
                                          style: const TextStyle(color: Colors.blue),
                                          recognizer: TapGestureRecognizer()
                                            ..onTap = () {
                                              // Handle privacy policy tap
                                            },
                                        ),
                                      ],
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
                                          text: "Já possui uma conta? ",
                                          style: TextStyle(color: Colors.black54),
                                        ),
                                        TextSpan(
                                          text: "Entrar",
                                          style: const TextStyle(color: Colors.blue),
                                          recognizer: TapGestureRecognizer()
                                            ..onTap = () {
                                              context.goNamed('Home');
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
