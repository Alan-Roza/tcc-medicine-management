import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tcc_medicine_management/app/shared/widgets/screen_assistance/presentation/screen_assistance_page.dart';
import 'package:tcc_medicine_management/app/shared/widgets/screen_assistance/widgets/body_assistance_widget.dart';

class UserLevelAssistancePage extends StatelessWidget {
  const UserLevelAssistancePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenAssistancePage(
      redirectPath: 'UserInfo',
      bodyAssistanceWidget: [
        BodyAssistanceWidget(
          image: SvgPicture.asset('assets/images/medicine.svg', height: 200),
          title: 'OS NÍVEIS DE USUÁRIO',
          message: const [
            TextSpan(
              text: "Salus ",
              style: TextStyle(color: Colors.black54, fontWeight: FontWeight.bold),
            ),
            TextSpan(
              text:
                  'foi projetado para oferecer flexibilidade e suporte personalizado, garantindo que os usuários possam gerenciar sua saúde de maneira ',
              style: TextStyle(color: Colors.black54),
            ),
            TextSpan(
              text: "independente",
              style: TextStyle(color: Colors.black54, fontWeight: FontWeight.bold),
            ),
            TextSpan(
              text: ', ao mesmo tempo em que têm a opção de receber ',
              style: TextStyle(color: Colors.black54),
            ),
            TextSpan(
              text: "assistência ",
              style: TextStyle(color: Colors.black54, fontWeight: FontWeight.bold),
            ),
            TextSpan(
              text:
                  'de um Responsável caso necessário. Estamos comprometidos em proporcionar uma experiência segura, confiável e intuitiva para todos os nossos usuários.',
              style: TextStyle(color: Colors.black54),
            ),
          ],
        ),

        BodyAssistanceWidget(
          image: SvgPicture.asset('assets/images/medical_care.svg', height: 200),
          title: 'USUÁRIO PACIENTE',
          message: const [
            TextSpan(
              text:
                  'O nível de acesso Paciente é atribuído por padrão a todos os novos usuários ao se cadastrarem no aplicativo. Esse tipo de usuário tem acesso a todas as funcionalidades principais voltadas para o gerenciamento pessoal de saúde.',
              style: TextStyle(color: Colors.black54),
            ),
            
          ],
        ),

        BodyAssistanceWidget(
          image: SvgPicture.asset('assets/images/business_woman.svg', height: 200),
          title: 'USUÁRIO RESPONSÁVEL',
          message: const [
            TextSpan(
              text:
                  'O nível de acesso ',
              style: TextStyle(color: Colors.black54),
            ),
            TextSpan(
              text: "Responsável ",
              style: TextStyle(color: Colors.black54, fontWeight: FontWeight.bold),
            ),
            TextSpan(
              text: 'é projetado para usuários que desejam ou precisam auxiliar outros usuários do tipo ',
              style: TextStyle(color: Colors.black54),
            ),
            TextSpan(
              text: "Paciente ",
              style: TextStyle(color: Colors.black54, fontWeight: FontWeight.bold),
            ),
            TextSpan(
              text:
                  '. Um usuário se torna um Responsável quando um paciente utiliza um ',
              style: TextStyle(color: Colors.black54),
            ),
            TextSpan(
              text: "código ",
              style: TextStyle(color: Colors.black54, fontWeight: FontWeight.bold),
            ),
            TextSpan(
              text:
                  'de 6 dígitos gerado e disponibilizado por este usuário.',
              style: TextStyle(color: Colors.black54),
            ),
          ],
        ),
      ],
    );
  }
}
