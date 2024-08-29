import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/system_bloc.dart';
import '../widgets/system_status_widget.dart';
import '../widgets/system_controls_widget.dart';
import '../widgets/operation_history_widget.dart';
import '../widgets/interactive_system_diagram.dart';

class SystemPage extends StatefulWidget {
  @override
  _SystemPageState createState() => _SystemPageState();
}

class _SystemPageState extends State<SystemPage> {
  bool _showDiagram = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('System Control'),
        actions: [
          IconButton(
            icon: Icon(_showDiagram ? Icons.view_list : Icons.view_module),
            onPressed: () {
              setState(() {
                _showDiagram = !_showDiagram;
              });
            },
          ),
        ],
      ),
      body: BlocProvider(
        create: (context) => SystemBloc(
          getSystemStatus: sl(),
          updateSystemParameter: sl(),
          startSystem: sl(),
          stopSystem: sl(),
          getOperationHistory: sl(),
          getSystemUpdates: sl(),
        )..add(GetSystemStatusEvent()),
        child: BlocBuilder<SystemBloc, SystemState>(
          builder: (context, state) {
            if (state is SystemLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is SystemLoaded) {
              return _showDiagram
                  ? _buildDiagramView(context, state)
                  : _buildStandardView(context, state);
            } else if (state is SystemError) {
              return Center(child: Text(state.message));
            }
            return Center(child: Text('Unexpected state'));
          },
        ),
      ),
    );
  }

  Widget _buildDiagramView(BuildContext context, SystemLoaded state) {
    return InteractiveSystemDiagram(
      svgAsset: 'assets/system_diagram.svg',
      componentColors: _getComponentColors(state.system),
      onComponentTap: (componentId) {
        // Show detailed component information or controls
        _showComponentDetails(context, componentId);
      },
    );
  }

  Widget _buildStandardView(BuildContext context, SystemLoaded state) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SystemStatusWidget(system: state.system),
          SystemControlsWidget(),
          OperationHistoryWidget(),
        ],
      ),
    );
  }

  Map<String, Color> _getComponentColors(System system) {
    // Implement logic to determine colors based on system state
    return {
      'heater1': system.temperature > 100 ? Colors.red : Colors.green,
      'pressureChamber': system.pressure > 50 ? Colors.orange : Colors.green,
      // Add more components and their color logic
    };
  }

  void _showComponentDetails(BuildContext context, String componentId) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Component Details: $componentId'),
        content: Text('Add detailed information and controls for $componentId here.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text('Close'),
          ),
        ],
      ),
    );
  }
}