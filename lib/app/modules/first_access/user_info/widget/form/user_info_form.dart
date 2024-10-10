import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:tcc_medicine_management/app/modules/first_access/user_info/controller/user_info_controller.dart';
import 'package:tcc_medicine_management/app/shared/widgets/custom_text_field/custom_text_field_widget.dart';

class UserInfoFormWidget extends StatefulWidget {
  final bool readOnly;
  final GlobalKey<FormState> formKey;

  const UserInfoFormWidget({super.key, required this.formKey, this.readOnly = false});

  @override
  UserInfoFormWidgetState createState() => UserInfoFormWidgetState();
}

class UserInfoFormWidgetState extends State<UserInfoFormWidget> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final UserInfoController userInfoController = Provider.of<UserInfoController>(context);

    return Form(
      key: widget.formKey,
      child: Column(
        children: [
          Observer(
            builder: (_) => CustomTextFieldWidget(
              textEditingController: userInfoController.nameController,
              icon: Icons.person_outline,
              label: 'Nome',
              // validator: (_) => userInfoController.nameError,
              onChanged: userInfoController.setName,
            ),
          ),
          Observer(
            builder: (_) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: TextFormField(
                controller: userInfoController.birthDateController,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.calendar_month_rounded),
                  labelText: 'Data de Nascimento',
                ),
                readOnly: true, // Makes the field not editable; only selectable
                onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1900),
                    lastDate: DateTime.now(),
                  );
                  if (pickedDate != null) {
                    // Update the text field with the selected date
                    userInfoController.setBirthDate(pickedDate); // Update your controller/state management solution
                  }
                },
              ),
            ),
          ),
          Observer(
            builder: (_) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: DropdownButtonFormField<Gender>(
                value: userInfoController.gender,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.people_outline),
                  labelText: 'Gênero',
                  // Add other decorations here if necessary
                ),
                items: Gender.values.map((Gender value) {
                  return DropdownMenuItem<Gender>(
                    value: value,
                    child: Text(value.toString().split('.').last),
                  );
                }).toList(),
                onChanged: (Gender? value) {
                  if (value != null) {
                    userInfoController.setGender(value);
                  }
                },
              ),
            ),
          ),
          Observer(
            builder: (_) => CustomTextFieldWidget(
              textEditingController: userInfoController.phoneController,
              icon: Icons.phone_outlined,
              label: 'Celular',
            ),
          ),
        ],
      ),
    );
  }
}
