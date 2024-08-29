import 'package:flutter/material.dart';
import '../../domain/entities/system.dart';

class SystemStatusWidget extends StatelessWidget {
  final System system;

  const SystemStatusWidget({Key? key, required this.system}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('System Status', style: Theme.of(context).textTheme.headline6),
            SizedBox(height: 8.0),
            _buildStatusRow('Temperature', '${system.temperature}°C'),
            _buildStatusRow('Pressure', '${system.pressure} kPa'),
            _buildStatusRow('Flow Rate', '${system.flowRate} L/min'),
            _buildStatusRow('Operational', system.isOperational ? 'Yes' : 'No'),
          ],
        ),
      ),
    );
  }

  Widget _buildStatusRow(String label, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: TextStyle(fontWeight: FontWeight.bold)),
          Text(value),
        ],
      ),
    );
  }
}