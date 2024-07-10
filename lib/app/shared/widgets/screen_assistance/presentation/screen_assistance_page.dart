import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:go_router/go_router.dart';
import 'package:tcc_medicine_management/app/shared/widgets/screen_assistance/controller/screen_assistance_controller.dart';
import 'package:tcc_medicine_management/app/shared/widgets/screen_assistance/widgets/body_assistance_widget.dart';

class ScreenAssistancePage extends StatelessWidget {
  final ScreenAssistanceController screenAssistanceController = ScreenAssistanceController();
  final PageController _pageController = PageController();

  final String redirectPath;
  final List<BodyAssistanceWidget> bodyAssistanceWidget;

  ScreenAssistancePage({
    super.key,
    required this.redirectPath,
    required this.bodyAssistanceWidget,
  });

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
                SafeArea(
                  child: Observer(
                    builder: (_) => GestureDetector(
                      onTap: () {
                        context.goNamed(redirectPath);
                      },
                      child: const Text(
                        'Pular',
                        style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
                        // Change color to indicate it's clickable
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: PageView(
                controller: _pageController,
                onPageChanged: screenAssistanceController.setPage,
                children: [
                  ...bodyAssistanceWidget,
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Observer(
                  builder: (_) {
                    if (screenAssistanceController.currentPage < 1) {
                      return const SizedBox(width: 70);
                    }

                    return SizedBox(
                      width: 70,
                      child: GestureDetector(
                        onTap: () {
                          if (screenAssistanceController.currentPage >= 1) {
                            _pageController.animateToPage(
                              screenAssistanceController.currentPage - 1,
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                            );
                          }
                        },
                        child: const Text(
                          'Voltar',
                          style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold), // Change color to indicate it's clickable
                        ),
                      ),
                    );
                  },
                ),
                Observer(
                  builder: (_) => Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(bodyAssistanceWidget.length, (index) {
                      return Container(
                        margin: const EdgeInsets.symmetric(horizontal: 4.0),
                        width: screenAssistanceController.currentPage == index ? 10.0 : 8.0,
                        height: screenAssistanceController.currentPage == index ? 10.0 : 8.0,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: screenAssistanceController.currentPage == index
                              ? Colors.blue
                              : Colors.blue.withOpacity(0.5),
                        ),
                      );
                    }),
                  ),
                ),
                Observer(
                  builder: (_) => Container(
                    width: 70,
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                      onTap: () {
                        if (screenAssistanceController.currentPage < bodyAssistanceWidget.length - 1) {
                          _pageController.animateToPage(
                            screenAssistanceController.currentPage + 1,
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                        } else {
                          context.goNamed(redirectPath);
                        }
                      },
                      child: Text(
                        screenAssistanceController.currentPage < bodyAssistanceWidget.length - 1 ? 'Continuar' : 'Finalizar',
                        style: const TextStyle(color: Colors.blue, fontWeight: FontWeight.bold), // Change color to indicate it's clickable
                      ),
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
}
