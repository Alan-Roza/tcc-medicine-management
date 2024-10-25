import 'package:flutter/material.dart';
import 'package:tcc_medicine_management/app/shared/widgets/screen_assistance/presentation/screen_assistance_page.dart';
import 'package:tcc_medicine_management/app/shared/widgets/screen_assistance/widgets/body_assistance_widget.dart';

class MenuAssistancePage extends StatelessWidget {
  const MenuAssistancePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenAssistancePage(
      redirectPath: 'MainHome',
      bodyAssistanceWidget: [
        BodyAssistanceWidget(
          isInverse: true,
          // image: SvgPicture.asset('assets/images/bottom-navigation-home.svg', fit: BoxFit.cover,),
          image: Image.asset('assets/images/navigator-home.png', fit: BoxFit.cover),
          title: 'INÍCIO',
          message: const [
            // TextSpan(
            //   text: "Salus ",
            //   style: TextStyle(color: Colors.black54, fontWeight: FontWeight.bold),
            // ),
            TextSpan(
              text:
                  'Bem-vindo ao nosso aplicativo de gestão de medicamentos! A partir do menu inicial, você pode acessar as principais funcionalidades do sistema, facilitando o controle e o acompanhamento de seus medicamentos.',
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
          image: Image.asset('assets/images/navigator-treatment.png', fit: BoxFit.cover),
          title: 'TRATAMENTO',
          message: const [
            // TextSpan(
            //   text: "Salus ",
            //   style: TextStyle(color: Colors.black54, fontWeight: FontWeight.bold),
            // ),
            TextSpan(
              text:
                  'Na seção de Tratamentos, você pode gerenciar de forma prática todos os tratamentos que está realizando. Aqui você encontra informações detalhadas e ferramentas para acompanhar seu progresso.',
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
          image: Image.asset('assets/images/navigator-medicine.png', fit: BoxFit.cover),
          title: 'MEDICAMENTOS',
          message: const [
            // TextSpan(
            //   text: "Salus ",
            //   style: TextStyle(color: Colors.black54, fontWeight: FontWeight.bold),
            // ),
            TextSpan(
              text:
                  'Na seção de Medicamentos, você pode gerenciar seu estoque pessoal de medicamentos de forma simples e organizada. Isso garante que você tenha controle total sobre a quantidade disponível e evite falta de medicamentos essenciais.',
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
          image: Image.asset('assets/images/navigator-profile.png', fit: BoxFit.cover),
          title: 'PERFIL',
          message: const [
            // TextSpan(
            //   text: "Salus ",
            //   style: TextStyle(color: Colors.black54, fontWeight: FontWeight.bold),
            // ),
            TextSpan(
              text:
                  'Na seção de Perfil, você pode gerenciar suas informações pessoais e configurar o aplicativo de acordo com suas necessidades e preferências.',
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
