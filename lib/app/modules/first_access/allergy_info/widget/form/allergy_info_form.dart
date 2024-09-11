import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:tcc_medicine_management/app/modules/first_access/allergy_info/controller/allergy_info_controller.dart';

class AllergyInfoFormWidget extends StatefulWidget {
  final bool readOnly;

  const AllergyInfoFormWidget({super.key, this.readOnly = false});

  @override
  AllergyInfoFormWidgetState createState() => AllergyInfoFormWidgetState();
}

class AllergyInfoFormWidgetState extends State<AllergyInfoFormWidget> with SingleTickerProviderStateMixin {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final AllergyInfoController allergyInfoController = Provider.of<AllergyInfoController>(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Text(
          textAlign: TextAlign.justify,
          'Escreva todos os medicamentos que você possui alergia, separando-os por vírgula.',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal, color: Colors.black54, height: 1.4),
        ),
        const SizedBox(height: 30.0),
        const Text(
          'Medicamentos',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        TextField(
          controller: _controller,
          decoration: InputDecoration(
            labelText: 'Digite os medicamentos',
            suffixIcon: IconButton(
              icon: const Icon(
                Icons.add,
                color: Colors.blue,
              ),
              onPressed: () {
                allergyInfoController.addMedicine(_controller.text);
                _controller.clear();
              },
            ),
          ),
        ),
        const SizedBox(height: 16),
        Observer(
          builder: (_) => Wrap(
            spacing: 8.0,
            children: allergyInfoController.medicines
                .map((medicine) => Chip(
                      label: Text(
                        medicine,
                        style: TextStyle(
                          color: Theme.of(context).primaryColor, // Set text color to primaryColor
                        ),
                      ),
                      onDeleted: () => allergyInfoController.removeMedicine(medicine),
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          color: Theme.of(context).primaryColor, // Set border color to primaryColor
                          width: 1, // Set border width
                        ),
                        borderRadius: BorderRadius.circular(10), // Add a border radius
                      ),
                      deleteIconColor: Theme.of(context).primaryColor, // Set delete icon color to primaryColor
                    ))
                .toList(),
          ),
        ),
      ],
    );
  }
}
