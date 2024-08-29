import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/system_bloc.dart';
import '../bloc/system_event.dart';

class SystemControlsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('System Controls', style: Theme.of(context).textTheme.headline6),
            SizedBox(height: 8.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () => context.read<SystemBloc>().add(StartSystemEvent()),
                  child: Text('Start System'),
                ),
                ElevatedButton(
                  onPressed: () => context.read<SystemBloc>().add(StopSystemEvent()),
                  child: Text('Stop System'),
                ),
              ],
            ),
            SizedBox(height: 16.0),
            _buildParameterControl(context, 'Temperature', 'temperature'),
            _buildParameterControl(context, 'Pressure', 'pressure'),
            _buildParameterControl(context, 'Flow Rate', 'flowRate'),
          ],
        ),
      ),
    );
  }

  Widget _buildParameterControl(BuildContext context, String label, String parameter) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label),
        SizedBox(
          width: 100,
          child: TextField(
            keyboardType: TextInputType.number,
            onSubmitted: (value) {
              context.read<SystemBloc>().add(
                  UpdateSystemParameterEvent(parameter, double.parse(value))
              );
            },
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              contentPadding: EdgeInsets.symmetric(horizontal: 8.0),
            ),
          ),
        ),
      ],
    );
  }
}