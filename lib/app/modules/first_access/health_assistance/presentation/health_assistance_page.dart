import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tcc_medicine_management/app/shared/widgets/screen_assistance/presentation/screen_assistance_page.dart';
import 'package:tcc_medicine_management/app/shared/widgets/screen_assistance/widgets/body_assistance_widget.dart';

class HealthAssistancePage extends StatelessWidget {
  const HealthAssistancePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenAssistancePage(
      redirectPath: 'HealthInfo',
      previousPath: 'AddressInfo',
      bodyAssistanceWidget: [
        BodyAssistanceWidget(
          image: SvgPicture.asset('assets/images/medical_care.svg', height: 200),
          title: 'NÓS PRECISAMOS DE VOCÊ!',
          message: const [
            TextSpan(
              text:
                  'Nós precisamos que você preencha o máximo de informações a seguir a respeito da sua saúde, queremos entender melhor como está você, para que possamos ajudá-lo futuramente.',
              style: TextStyle(color: Colors.black54),
            ),
            
          ],
        ),
      ],
    );
  }
}
