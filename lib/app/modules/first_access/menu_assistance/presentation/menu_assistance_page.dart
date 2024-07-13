import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tcc_medicine_management/app/shared/widgets/screen_assistance/presentation/screen_assistance_page.dart';
import 'package:tcc_medicine_management/app/shared/widgets/screen_assistance/widgets/body_assistance_widget.dart';

class MenuAssistancePage extends StatelessWidget {
  const MenuAssistancePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenAssistancePage(
      redirectPath: 'Home',
      bodyAssistanceWidget: [
        BodyAssistanceWidget(
          isInverse: true,
          image: SvgPicture.asset('assets/images/bottom-navigation-home.svg', fit: BoxFit.cover,),
          // image: Image.asset('assets/images/bottom-navigator.png'),
          title: 'ÍNICIO',
          message: const [
            // TextSpan(
            //   text: "Salus ",
            //   style: TextStyle(color: Colors.black54, fontWeight: FontWeight.bold),
            // ),
            TextSpan(
              text:
                  'Escolha o tipo de usuário ideal para você, existem dois tipos, os pacientes e os responsáveis. Escolha o tipo de usuário ideal para você, existem dois tipos, os pacientes e os responsáveis. Escolha o tipo de usuário ideal para você, existem dois tipos, os pacientes e os responsáveis',
              style: TextStyle(color: Colors.black54),
            ),
            // TextSpan(
            //   text: "independente",
            //   style: TextStyle(color: Colors.black54, fontWeight: FontWeight.bold),
            // ),
            // TextSpan(
            //   text: ', ao mesmo tempo em que têm a opção de receber ',
            //   style: TextStyle(color: Colors.black54),
            // ),
            // TextSpan(
            //   text: "assistência ",
            //   style: TextStyle(color: Colors.black54, fontWeight: FontWeight.bold),
            // ),
            // TextSpan(
            //   text:
            //       'de um Responsável caso necessário. Estamos comprometidos em proporcionar uma experiência segura, confiável e intuitiva para todos os nossos usuários.',
            //   style: TextStyle(color: Colors.black54),
            // ),
          ],
        ),

        BodyAssistanceWidget(
          isInverse: true,
          image: SvgPicture.asset('assets/images/bottom-navigation-home.svg', fit: BoxFit.cover,),
          // image: Image.asset('assets/images/bottom-navigator.png'),
          title: 'ÍNICIO',
          message: const [
            // TextSpan(
            //   text: "Salus ",
            //   style: TextStyle(color: Colors.black54, fontWeight: FontWeight.bold),
            // ),
            TextSpan(
              text:
                  'Escolha o tipo de usuário ideal para você, existem dois tipos, os pacientes e os responsáveis. Escolha o tipo de usuário ideal para você, existem dois tipos, os pacientes e os responsáveis. Escolha o tipo de usuário ideal para você, existem dois tipos, os pacientes e os responsáveis',
              style: TextStyle(color: Colors.black54),
            ),
            // TextSpan(
            //   text: "independente",
            //   style: TextStyle(color: Colors.black54, fontWeight: FontWeight.bold),
            // ),
            // TextSpan(
            //   text: ', ao mesmo tempo em que têm a opção de receber ',
            //   style: TextStyle(color: Colors.black54),
            // ),
            // TextSpan(
            //   text: "assistência ",
            //   style: TextStyle(color: Colors.black54, fontWeight: FontWeight.bold),
            // ),
            // TextSpan(
            //   text:
            //       'de um Responsável caso necessário. Estamos comprometidos em proporcionar uma experiência segura, confiável e intuitiva para todos os nossos usuários.',
            //   style: TextStyle(color: Colors.black54),
            // ),
          ],
        ),

        BodyAssistanceWidget(
          isInverse: true,
          image: SvgPicture.asset('assets/images/bottom-navigation-home.svg', fit: BoxFit.cover,),
          // image: Image.asset('assets/images/bottom-navigator.png'),
          title: 'ÍNICIO',
          message: const [
            // TextSpan(
            //   text: "Salus ",
            //   style: TextStyle(color: Colors.black54, fontWeight: FontWeight.bold),
            // ),
            TextSpan(
              text:
                  'Escolha o tipo de usuário ideal para você, existem dois tipos, os pacientes e os responsáveis. Escolha o tipo de usuário ideal para você, existem dois tipos, os pacientes e os responsáveis. Escolha o tipo de usuário ideal para você, existem dois tipos, os pacientes e os responsáveis',
              style: TextStyle(color: Colors.black54),
            ),
            // TextSpan(
            //   text: "independente",
            //   style: TextStyle(color: Colors.black54, fontWeight: FontWeight.bold),
            // ),
            // TextSpan(
            //   text: ', ao mesmo tempo em que têm a opção de receber ',
            //   style: TextStyle(color: Colors.black54),
            // ),
            // TextSpan(
            //   text: "assistência ",
            //   style: TextStyle(color: Colors.black54, fontWeight: FontWeight.bold),
            // ),
            // TextSpan(
            //   text:
            //       'de um Responsável caso necessário. Estamos comprometidos em proporcionar uma experiência segura, confiável e intuitiva para todos os nossos usuários.',
            //   style: TextStyle(color: Colors.black54),
            // ),
          ],
        ),

        BodyAssistanceWidget(
          isInverse: true,
          image: SvgPicture.asset('assets/images/bottom-navigation-home.svg', fit: BoxFit.cover,),
          // image: Image.asset('assets/images/bottom-navigator.png'),
          title: 'ÍNICIO',
          message: const [
            // TextSpan(
            //   text: "Salus ",
            //   style: TextStyle(color: Colors.black54, fontWeight: FontWeight.bold),
            // ),
            TextSpan(
              text:
                  'Escolha o tipo de usuário ideal para você, existem dois tipos, os pacientes e os responsáveis. Escolha o tipo de usuário ideal para você, existem dois tipos, os pacientes e os responsáveis. Escolha o tipo de usuário ideal para você, existem dois tipos, os pacientes e os responsáveis',
              style: TextStyle(color: Colors.black54),
            ),
            // TextSpan(
            //   text: "independente",
            //   style: TextStyle(color: Colors.black54, fontWeight: FontWeight.bold),
            // ),
            // TextSpan(
            //   text: ', ao mesmo tempo em que têm a opção de receber ',
            //   style: TextStyle(color: Colors.black54),
            // ),
            // TextSpan(
            //   text: "assistência ",
            //   style: TextStyle(color: Colors.black54, fontWeight: FontWeight.bold),
            // ),
            // TextSpan(
            //   text:
            //       'de um Responsável caso necessário. Estamos comprometidos em proporcionar uma experiência segura, confiável e intuitiva para todos os nossos usuários.',
            //   style: TextStyle(color: Colors.black54),
            // ),
          ],
        ),
        
      ],
    );
  }
}
