import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/system_bloc.dart';
import '../bloc/system_state.dart';

class RealTimeGraph extends StatelessWidget {
  final String parameter;

  RealTimeGraph({required this.parameter});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SystemBloc, SystemState>(
      builder: (context, state) {
        if (state is SystemLoaded) {
          // This is a simplified example. You'd need to maintain a list of historical values.
          return LineChart(
            LineChartData(
              gridData: FlGridData(show: false),
              titlesData: FlTitlesData(show: false),
              borderData: FlBorderData(show: true),
              lineBarsData: [
                LineChartBarData(
                  spots: [
                    FlSpot(0, _getValue(state.system)),
                    // Add more spots based on historical data
                  ],
                  isCurved: true,
                  colors: [Colors.blue],
                  dotData: FlDotData(show: false),
                  belowBarData: BarAreaData(show: false),
                ),
              ],
            ),
          );
        }
        return Container();
      },
    );
  }

  double _getValue(System system) {
    switch (parameter) {
      case 'temperature':
        return system.temperature;
      case 'pressure':
        return system.pressure;
      case 'flowRate':
        return system.flowRate;
      default:
        return 0;
    }
  }
}