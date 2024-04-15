import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tcc_medicine_management/app/modules/unauth/presentation/widgets/unauth_layout_widget.dart';

class UnauthLoginPage extends StatefulWidget {
  const UnauthLoginPage({super.key});

  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<UnauthLoginPage> {
  bool _obscureText = true;
  double _listHeight = 500.0;

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollNotification>(
      onNotification: (scrollNotification) {
        if (scrollNotification is ScrollUpdateNotification) {
          double newHeight = 500.0 -
              (scrollNotification.metrics.pixels /
                  MediaQuery.of(context).size.height *
                  500.0);
          setState(() {
            _listHeight = newHeight.clamp(100.0, 500.0);
          });
        }
        return true;
      },
      child: Scaffold(
        backgroundColor: const Color(0xFF33ABE9),
        body: UnauthLayoutWidget(
          dinamicHeight: _listHeight,
          logo: SizedBox(
            width: 200,
            child: Text('bem-vindo de volta!'.toUpperCase(),
                style: const TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                  height: 1.2,
                ),
                textAlign: TextAlign.center),
          ),
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height - _listHeight,
            child: Container(
              padding: const EdgeInsetsDirectional.only(
                start: 25,
                end: 25,
              ),
              width: MediaQuery.of(context).size.width * 0.75,
              color: Colors.white,
              child: SingleChildScrollView(
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
                              'login'.toUpperCase(),
                              style: const TextStyle(
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
                            ),
                          ],
                        );
                      },
                    ),
                    // Expanded(child: Container()),
                    Column(
                      children: <Widget>[
                        const SizedBox(height: 50),
                        TextField(
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
                        TextField(
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
                        TextField(
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
                        TextField(
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
                        TextField(
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
                        TextField(
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
                        TextField(
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
                        TextField(
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
                        TextField(
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
                        TextField(
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
                        TextField(
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
                        TextField(
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
                        TextField(
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
                        TextField(
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
                        TextField(
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
                        TextField(
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
                        TextField(
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
                        TextField(
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
                        TextField(
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
                        TextField(
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
                        TextField(
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
                        TextField(
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
                        TextField(
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
                        TextField(
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
                        TextField(
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
                        TextField(
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
                        TextField(
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
                        TextField(
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
                        TextField(
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
                        TextField(
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
                        TextField(
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
                        TextField(
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
                        TextField(
                          obscureText: _obscureText,
                          decoration: InputDecoration(
                            labelText: 'Senha',
                            prefixIcon: const Icon(Icons.lock),
                            suffixIcon: IconButton(
                              icon: Icon(
                                _obscureText
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                              ),
                              onPressed: _togglePasswordVisibility,
                            ),
                          ),
                        ),
                        TextField(
                          obscureText: _obscureText,
                          decoration: InputDecoration(
                            labelText: 'Senha',
                            prefixIcon: const Icon(Icons.lock),
                            suffixIcon: IconButton(
                              icon: Icon(
                                _obscureText
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                              ),
                              onPressed: _togglePasswordVisibility,
                            ),
                          ),
                        ),
                        TextField(
                          obscureText: _obscureText,
                          decoration: InputDecoration(
                            labelText: 'Senha',
                            prefixIcon: const Icon(Icons.lock),
                            suffixIcon: IconButton(
                              icon: Icon(
                                _obscureText
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                              ),
                              onPressed: _togglePasswordVisibility,
                            ),
                          ),
                        ),
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
                      ],
                    ),
                    // Expanded(child: Container()),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
