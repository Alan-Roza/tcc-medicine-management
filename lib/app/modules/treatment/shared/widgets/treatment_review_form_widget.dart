import 'package:flutter/material.dart';
import 'package:tcc_medicine_management/app/modules/treatment/shared/widgets/treatment_basic_form_widget.dart';
import 'package:tcc_medicine_management/app/modules/treatment/shared/widgets/treatment_medicine_form_widget.dart';

class TreatmentReviewFormWidget extends StatefulWidget {
  const TreatmentReviewFormWidget({super.key});

  @override
  TreatmentReviewFormWidgetState createState() => TreatmentReviewFormWidgetState();
}

class TreatmentReviewFormWidgetState extends State<TreatmentReviewFormWidget>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return const Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TreatmentBasicFormWidget(
            readOnly: true,
          ),
          SizedBox(height: 24.0),
          TreatmentMedicineFormWidget(
            readOnly: true,
          ),
        ],
      ),
    );
  }
}
