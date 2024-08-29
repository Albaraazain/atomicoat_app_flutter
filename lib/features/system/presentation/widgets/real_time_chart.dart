import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class RealTimeChart extends StatelessWidget {
  final List<FlSpot> data;
  final String title;
  final Color lineColor;

  const RealTimeChart({
    Key? key,
    required this.data,
    required this.title,
    this.lineColor = Colors.blue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: Theme.of(context).textTheme.headline6),
            SizedBox(height: 8.0),
            SizedBox(
              height: 200,
              child: LineChart(
                LineChartData(
                  gridData: FlGridData(show: false),
                  titlesData: FlTitlesData(show: false),
                  borderData: FlBorderData(show: true),
                  minX: 0,
                  maxX: data.length.toDouble() - 1,
                  minY: data.map((spot) => spot.y).reduce((a, b) => a < b ? a : b),
                  maxY: data.map((spot) => spot.y).reduce((a, b) => a > b ? a : b),
                  lineBarsData: [
                    LineChartBarData(
                      spots: data,
                      isCurved: true,
                      color: lineColor,
                      barWidth: 2,
                      isStrokeCapRound: true,
                      dotData: FlDotData(show: false),
                      belowBarData: BarAreaData(show: false),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}