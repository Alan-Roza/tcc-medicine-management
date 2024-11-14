
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tcc_medicine_management/app/modules/main_home/main/model/dto/resume_drawer_response_dto.dart';

class CustomPieChart extends StatelessWidget {
  final ResumeDrawerResponseDto resumeDrawer;

  const CustomPieChart({super.key, required this.resumeDrawer});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: PieChart(
        PieChartData(
          sections: [
            PieChartSectionData(
              color: Color(0xFFA6B054),
              value: (resumeDrawer.available ?? 1).toDouble(),
              title: '',
              radius: 15,
              titleStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            PieChartSectionData(
              color: Color(0xFFFF8981),
              value: (resumeDrawer.occupied ?? 1).toDouble(),
              title: '',
              radius: 15,
              titleStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
            ),
          ],
          centerSpaceRadius: 25,
          sectionsSpace: 0,
        ),
      ),
    );
  }
}