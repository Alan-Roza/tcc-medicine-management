import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:tcc_medicine_management/app/modules/unauth/login/controller/login_controller.dart';
import 'package:tcc_medicine_management/app/modules/unauth/shared/widgets/unauth_layout_widget.dart';
import 'package:tcc_medicine_management/app/shared/controllers/user/user_controller.dart';

class UnauthLoginPage extends StatefulWidget {
  const UnauthLoginPage({super.key});

  @override
  State<UnauthLoginPage> createState() => _UnauthLoginPageState();
}

class _UnauthLoginPageState extends State<UnauthLoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final loginController = LoginController();

  @override
  Widget build(BuildContext context) {
    final userController = Provider.of<UserController>(context);

    double height = MediaQuery.of(context).size.height;
    var keyboardHeight = MediaQuery.of(context).viewInsets.bottom;

    return Scaffold(
      // resizeToAvoidBottomInset: false, // This is to keyboard overflow
      backgroundColor: const Color(0xFF33ABE9),
      body: UnauthLayoutWidget(
        dinamicHeight: (height / 2) - keyboardHeight,
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
                        builder: (BuildContext context, BoxConstraints constraints) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'LOGIN',
                                style: TextStyle(
                                    fontSize: 22,
                                    fontFamily: 'Roboto', // Set the font family to Roboto
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
                                    color: const Color(0xFF00A8FF), // Set border color
                                    width: 2, // Set border width
                                  ),
                                  borderRadius: BorderRadius.circular(10), // Add a border radius
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
                          child: Form(
                            key: _formKey,
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 5.0),
                                  child: Observer(
                                    builder: (_) => TextFormField(
                                      onChanged: loginController.setEmail,
                                      decoration: const InputDecoration(
                                        labelText: 'E-mail',
                                        prefixIcon: Icon(Icons.email_outlined),
                                      ),
                                      validator: (_) => loginController.emailError,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 5.0),
                                  child: Observer(
                                    builder: (_) => TextFormField(
                                      obscureText: !loginController.isPasswordVisible,
                                      onChanged: loginController.setPassword,
                                      decoration: InputDecoration(
                                        labelText: 'Senha',
                                        prefixIcon: const Icon(Icons.lock_outline),
                                        suffixIcon: IconButton(
                                          icon: Icon(loginController.isPasswordVisible
                                              ? Icons.visibility_outlined
                                              : Icons.visibility_off_outlined),
                                          onPressed: () {
                                            loginController.togglePasswordVisibility();
                                          },
                                        ),
                                      ),
                                      validator: (_) => loginController.passwordError,
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
                                  padding: const EdgeInsets.symmetric(vertical: 25.0),
                                  child: ElevatedButton(
                                    onPressed: () async {
                                      try {
                                        final response = await loginController.onSubmitLogin(_formKey);

                                        if (response.userName == null)
                                          context.goNamed('FirstAccess');
                                        else {
                                          userController.login(response.userName ?? 'Desconhecido');
                                          context.goNamed('MainHome');
                                        }

                                        ScaffoldMessenger.of(context).showSnackBar(
                                          const SnackBar(
                                            backgroundColor: Colors.green,
                                            content: Text(
                                                "Login realizado com Sucesso!"), // Customize with your success message
                                          ),
                                        );
                                        return;
                                      } catch (error) {
                                        ScaffoldMessenger.of(context).showSnackBar(
                                          SnackBar(
                                            backgroundColor: Colors.red,
                                            content: Text(error.toString()),
                                          ),
                                        );
                                      }
                                    },
                                    child: Container(
                                      width: MediaQuery.of(context).size.width * 0.75,
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
                                  padding: const EdgeInsets.symmetric(vertical: 15.0),
                                  child: RichText(
                                    text: TextSpan(
                                      children: [
                                        const TextSpan(
                                          text: "Não possui uma conta? ",
                                          style: TextStyle(color: Colors.black54),
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
