import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/system_bloc.dart';
import '../../domain/entities/system_operation.dart';

class OperationHistoryWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Operation History', style: Theme.of(context).textTheme.headline6),
            SizedBox(height: 8.0),
            BlocBuilder<SystemBloc, SystemState>(
              builder: (context, state) {
                if (state is OperationHistoryLoaded) {
                  return _buildOperationList(state.history);
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              },
            ),
            ElevatedButton(
              onPressed: () => context.read<SystemBloc>().add(GetOperationHistoryEvent()),
              child: Text('Refresh History'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOperationList(List<SystemOperation> history) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: history.length,
      itemBuilder: (context, index) {
        final operation = history[index];
        return ListTile(
          title: Text(operation.operation),
          subtitle: Text(operation.timestamp.toString()),
          trailing: Text(operation.parameters.toString()),
        );
      },
    );
  }
}