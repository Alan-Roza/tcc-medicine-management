import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tcc_medicine_management/app/modules/main_home/profile/connection/form/controller/connect_controller.dart';
import 'package:tcc_medicine_management/app/shared/widgets/custom_text_field/custom_text_field_widget.dart';

class ConnectFormWidget extends StatefulWidget {
  final bool readOnly;

  const ConnectFormWidget({super.key, this.readOnly = false});

  @override
  ConnectFormWidgetState createState() => ConnectFormWidgetState();
}

class ConnectFormWidgetState extends State<ConnectFormWidget> with SingleTickerProviderStateMixin {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final ConnectController connectController = Provider.of<ConnectController>(context);

    return Form(
      key: _formKey,
      child: Column(
        children: [
          CustomTextFieldWidget(
            textEditingController: connectController.ssid,
            icon: Icons.wifi,
            label: 'Nome da Rede',
          ),
          CustomTextFieldWidget(
            textEditingController: connectController.password,
            icon: Icons.lock,
            label: 'Senha',
          ),
          CustomTextFieldWidget(
            textEditingController: connectController.unid,
            icon: Icons.person,
            label: 'Código do Usuário',
          ),
        ],
        
      ),
    );
  }
}
