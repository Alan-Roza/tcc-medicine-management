import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:tcc_medicine_management/app/modules/first_access/user_level_assistance/controller/user_level_assistance_controller.dart';

class UserLevelAssistancePage extends StatelessWidget {
  final UserLevelAssistanceController userLevelAssistanceController =
      UserLevelAssistanceController();
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Observer(
                  builder: (_) => GestureDetector(
                    onTap: () {
                      if (userLevelAssistanceController.currentPage < 2) {
                        _pageController.animateToPage(
                          userLevelAssistanceController.currentPage + 1,
                          duration: Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      }
                    },
                    child: Text(
                      'Voltar',
                      style: TextStyle(
                          color: Colors
                              .grey), // Change color to indicate it's clickable
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: PageView(
                controller: _pageController,
                onPageChanged: userLevelAssistanceController.setPage,
                children: [
                  buildPage(context),
                  buildPage(context),
                  buildPage(context),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Observer(
                  builder: (_) => GestureDetector(
                    onTap: () {
                      if (userLevelAssistanceController.currentPage < 2) {
                        _pageController.animateToPage(
                          userLevelAssistanceController.currentPage + 1,
                          duration: Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      }
                    },
                    child: Text(
                      'Voltar',
                      style: TextStyle(
                          color: Colors
                              .grey), // Change color to indicate it's clickable
                    ),
                  ),
                ),
                Observer(
                  builder: (_) => Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(3, (index) {
                      return Container(
                        margin: const EdgeInsets.symmetric(horizontal: 4.0),
                        width:
                            userLevelAssistanceController.currentPage == index
                                ? 12.0
                                : 8.0,
                        height:
                            userLevelAssistanceController.currentPage == index
                                ? 12.0
                                : 8.0,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color:
                              userLevelAssistanceController.currentPage == index
                                  ? Colors.blue
                                  : Colors.grey,
                        ),
                      );
                    }),
                  ),
                ),
                Observer(
                  builder: (_) => GestureDetector(
                    onTap: () {
                      if (userLevelAssistanceController.currentPage < 2) {
                        _pageController.animateToPage(
                          userLevelAssistanceController.currentPage + 1,
                          duration: Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      }
                    },
                    child: Text(
                      'Continuar',
                      style: TextStyle(
                          color: Colors
                              .blue), // Change color to indicate it's clickable
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildPage(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Adicione uma imagem local ou de rede aqui
          // Image.asset('assets/image.png', height: 200),
          // Simulação da imagem
          Container(
            height: 200,
            color: Colors.grey.shade200,
            child: Center(child: Text('Imagem')),
          ),
          SizedBox(height: 20),
          Text(
            'OS NÍVEIS DE USUÁRIOS',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Text(
            'Salus foi projetado para oferecer flexibilidade e suporte personalizado, garantindo que os usuários possam gerenciar sua saúde de maneira independente, ao mesmo tempo em que têm a opção de receber assistência de um Responsável caso necessário. Estamos comprometidos em proporcionar uma experiência segura, confiável e intuitiva para todos os nossos usuários.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 20),
          Observer(
            builder: (_) => ElevatedButton(
              onPressed: userLevelAssistanceController.toggleAssistance,
              child: Text(userLevelAssistanceController.assistanceRequired
                  ? 'Assistência Ativada'
                  : 'Assistência Desativada'),
            ),
          ),
        ],
      ),
    );
  }
}
