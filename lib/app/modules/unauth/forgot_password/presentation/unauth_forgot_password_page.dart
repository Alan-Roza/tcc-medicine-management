import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tcc_medicine_management/app/modules/main_home/main/controllers/main_home_controller.dart';
import 'package:tcc_medicine_management/app/modules/unauth/forgot_password/controller/forgot_password_controller.dart';
import 'package:tcc_medicine_management/app/modules/unauth/shared/widgets/unauth_layout_widget.dart';

class UnauthForgotPasswordPage extends StatefulWidget {
  const UnauthForgotPasswordPage({super.key});

  @override
  State<UnauthForgotPasswordPage> createState() => _UnauthForgotPasswordPageState();
}

class _UnauthForgotPasswordPageState extends State<UnauthForgotPasswordPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final forgotPasswordController = ForgotPasswordController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _fetchInitialData();
    });
  }

  void _fetchInitialData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // String? token = prefs.getString('token');
    // if (token != null && token.isNotEmpty) {
    //   context.goNamed('MainHome');
    // } else {
      await prefs.clear();
    // }
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    var keyboardHeight = MediaQuery.of(context).viewInsets.bottom;

    return Scaffold(
      // resizeToAvoidBottomInset: false, // This is to keyboard overflow
      backgroundColor: const Color(0xFF33ABE9),
      body: UnauthLayoutWidget(
        dinamicHeight: (height / 2) - keyboardHeight,
        logo: const SizedBox(
          width: 200,
          child: Text('RECUPERAR SENHA!',
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
                                'IREMOS TE ENVIAR UMA NOVA SENHA',
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
                        height: height / 3,
                        child: SingleChildScrollView(
                          child: Form(
                            key: _formKey,
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 5.0),
                                  child: Observer(
                                    builder: (_) => TextFormField(
                                      onChanged: forgotPasswordController.setEmail,
                                      decoration: const InputDecoration(
                                        labelText: 'E-mail',
                                        prefixIcon: Icon(Icons.email_outlined),
                                      ),
                                      validator: (_) => forgotPasswordController.emailError,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 25.0),
                                  child: ElevatedButton(
                                    onPressed: () async {
                                      try {
                                        await forgotPasswordController.onSubmit(_formKey);
                                        context.goNamed('Home');

                                        ScaffoldMessenger.of(context).showSnackBar(
                                          SnackBar(
                                            backgroundColor: Colors.green,
                                            content: Text(
                                                "Foi enviado um e-mail para ${forgotPasswordController.email}"), // Customize with your success message
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
                                        'Enviar',
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
                                          text: "Lembrei minhas credenciais? ",
                                          style: TextStyle(color: Colors.black54),
                                        ),
                                        TextSpan(
                                          text: "Entrar",
                                          style: const TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
                                          recognizer: TapGestureRecognizer()
                                            ..onTap = () {
                                              context.goNamed('Login');
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
