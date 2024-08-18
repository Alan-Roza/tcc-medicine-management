import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:tcc_medicine_management/app/modules/medicine/form/controllers/medicine_form_controller.dart';
import 'package:tcc_medicine_management/app/modules/medicine/shared/widgets/medicine_stock_basic_form_widget.dart';
import 'package:tcc_medicine_management/app/modules/medicine/shared/widgets/medicine_stock_optional_form_widget.dart';
import 'package:tcc_medicine_management/app/shared/widgets/custom_text_field/custom_text_field_widget.dart';

class MedicineStockReviewFormWidget extends StatefulWidget {
  const MedicineStockReviewFormWidget({super.key});

  @override
  MedicineStockReviewFormWidgetState createState() => MedicineStockReviewFormWidgetState();
}

class MedicineStockReviewFormWidgetState extends State<MedicineStockReviewFormWidget>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return const Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MedicineStockBasicFormWidget(
            readOnly: true,
          ),
          SizedBox(height: 24.0),
          MedicineStockOptionalFormWidget(
            readOnly: true,
          ),
        ],
      ),
    );
  }
}
