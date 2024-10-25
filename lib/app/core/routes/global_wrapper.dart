import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:tcc_medicine_management/app/modules/main_home/main/controllers/main_home_controller.dart';
import 'package:tcc_medicine_management/app/shared/controllers/user/user_controller.dart';

class GlobalWrapper extends StatefulWidget {
  final Widget child;

  const GlobalWrapper({super.key, required this.child});

  @override
  State<GlobalWrapper> createState() => _GlobalWrapperState();
}

class _GlobalWrapperState extends State<GlobalWrapper> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final userController = Provider.of<UserController>(context);
    final mainHomeController = Provider.of<MainHomeController>(context);
    final currentRoute = GoRouter.of(context).routeInformationProvider.value.uri.toString();

    final bool isExcludedRoute = currentRoute == '/' ||
        currentRoute.startsWith('/first-access') ||
        currentRoute.startsWith('/login') ||
        currentRoute.startsWith('/signup');

    return Stack(
      key: _scaffoldKey,
      children: [
        widget.child,
        Observer(
          builder: (_) {
            final shouldShowButton = userController.patientId != null && !isExcludedRoute;

            if (shouldShowButton) {
              return Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: Container(
                  height: 25,
                  color: const Color.fromARGB(193, 183, 28, 28),
                  child: Center(
                    child: Text(
                      'Acessando: ${userController.patientName ?? 'Paciente'}'.toUpperCase(),
                      style: TextStyle(
                        decoration: TextDecoration.none,
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              );
            } else {
              return SizedBox.shrink(); // Return an empty box if the button shouldn't be shown
            }
          },
        ),
        Observer(
          builder: (_) {
            final shouldShowButton = userController.patientId != null && !isExcludedRoute;

            return shouldShowButton
                ? Positioned(
                    bottom: 73,
                    left: 16,
                    child: FloatingActionButton(
                      backgroundColor: Colors.red[900],
                      foregroundColor: Colors.white,
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text('Sair da Sessão',
                                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500)),
                              content: Text(
                                  'Vocẽ tem certeza que deseja sair do acesso ao paciente ${userController.patientName ?? ''}?'),
                              actionsPadding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                              buttonPadding: const EdgeInsets.symmetric(horizontal: 0),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text('Cancelar', style: TextStyle(color: Colors.black38)),
                                ),
                                TextButton(
                                  onPressed: () {
                                    userController.removePatient();
                                    mainHomeController.setSelectedIndex(0);
                                    Navigator.of(context).pop();
                                    Navigator.of(context).pushNamed('/main-home');
                                  },
                                  child: const Text('Sair'),
                                ),
                              ],
                            );
                          },
                        );
                      },
                      child: const Icon(Icons.logout),
                    ),
                  )
                : SizedBox.shrink(); // Return an empty box if the FAB shouldn't be shown
          },
        ),
      ],
    );
  }
}
