import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextFieldWidget extends StatelessWidget {
  final TextEditingController? textEditingController;
  final String label;
  final Function? onChanged;
  final IconData? icon;
  final Function? onClear;
  final Function? onTap;
  final bool? clearable;
  final bool readOnly;
  final bool? enabled;
  final FormFieldValidator<String>? validator;
  final String? type;

  const CustomTextFieldWidget({
    super.key,
    required this.label,
    this.textEditingController,
    this.onChanged,
    this.icon,
    this.onClear,
    this.clearable,
    this.onTap,
    this.readOnly = false,
    this.enabled = true,
    this.validator,
    this.type,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: TextFormField(
        onTap: () {
          if (onTap != null) onTap!();
        },
        enabled: enabled,
        readOnly: readOnly,
        decoration: InputDecoration(
          prefixIcon: Icon(icon),
          suffixIcon: clearable == true && clearable!
              ? IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: () {
                    if (onClear != null) onClear!();
                    textEditingController?.clear(); // Clear the text field
                  },
                )
              : null,
          labelText: label,
        ),
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: validator,
        controller: textEditingController,
        keyboardType: type == 'numeric' ? TextInputType.number : TextInputType.text,
        // inputFormatters: type == 'numeric' ? [FilteringTextInputFormatter.digitsOnly] : [],
        onChanged: (value) {
          if (onChanged != null) onChanged!(value);
        },
      ),
    );
  }
}
