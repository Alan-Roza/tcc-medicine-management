import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:tcc_medicine_management/app/modules/first_access/address_info/controller/address_info_controller.dart';
import 'package:tcc_medicine_management/app/shared/widgets/custom_text_field/custom_text_field_widget.dart';

class AddressInfoFormWidget extends StatefulWidget {
  final bool readOnly;

  const AddressInfoFormWidget({super.key, this.readOnly = false});

  @override
  AddressInfoFormWidgetState createState() => AddressInfoFormWidgetState();
}

class AddressInfoFormWidgetState extends State<AddressInfoFormWidget> with SingleTickerProviderStateMixin {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final AddressInfoController addressInfoController = Provider.of<AddressInfoController>(context);

    return Form(
      key: _formKey,
      child: Column(
        children: [
          Observer(
            builder: (_) => CustomTextFieldWidget(
              textEditingController: addressInfoController.postalCode,
              icon: Icons.local_post_office_rounded,
              label: 'CEP',
              onChanged: (value) {
                if (value.length == 8) {
                  addressInfoController.getAddressInfo(value);
                }
              },
            ),
          ),
          Observer(
            builder: (_) => CustomTextFieldWidget(
              textEditingController: addressInfoController.street,
              icon: Icons.streetview_outlined,
              label: 'Logradouro',
            ),
          ),
          Observer(
            builder: (_) => CustomTextFieldWidget(
              textEditingController: addressInfoController.neighborhood,
              icon: Icons.location_city_outlined,
              label: 'Bairro',
            ),
          ),
          Observer(
            builder: (_) => CustomTextFieldWidget(
              textEditingController: addressInfoController.city,
              icon: Icons.location_pin,
              label: 'Município',
            ),
          ),
          Observer(
            builder: (_) => CustomTextFieldWidget(
              textEditingController: addressInfoController.state,
              icon: Icons.map,
              label: 'UF',
            ),
          ),
        ],
      ),
    );
  }
}
