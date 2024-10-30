
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomPieChart extends StatelessWidget {
  const CustomPieChart({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: PieChart(
        PieChartData(
          sections: [
            PieChartSectionData(
              color: Color(0xFFFAB95B),
              value: 60,
              title: '',
              radius: 15,
              titleStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            PieChartSectionData(
              color: Color(0xFFA6B054),
              value: 30,
              title: '',
              radius: 15,
              titleStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            PieChartSectionData(
              color: Color(0xFFFF8981),
              value: 10,
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