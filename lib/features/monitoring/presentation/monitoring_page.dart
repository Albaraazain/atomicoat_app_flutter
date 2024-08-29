import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:auto_route/auto_route.dart';
import './bloc/monitoring_bloc.dart';
import '../../../../core/widgets/main_bottom_nav_bar.dart';

@AutoRoute(page: MonitoringPage)
class MonitoringPage extends StatelessWidget {
  const MonitoringPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MonitoringBloc(),
      child: Scaffold(
        appBar: AppBar(title: const Text('Monitoring')),
        body: BlocBuilder<MonitoringBloc, MonitoringState>(
          builder: (context, state) {
            if (state is MonitoringActive) {
              return _buildMonitoringData(context, state.data);
            } else if (state is MonitoringInactive) {
              return const Center(child: Text('Monitoring is inactive'));
            } else if (state is MonitoringError) {
              return Center(child: Text('Error: ${state.message}'));
            } else {
              return const Center(child: Text('Start monitoring to see data'));
            }
          },
        ),
        floatingActionButton: _buildFloatingActionButton(context),
        bottomNavigationBar: const MainBottomNavBar(),
      ),
    );
  }

  Widget _buildMonitoringData(BuildContext context, Map<String, dynamic> data) {
    return ListView.builder(
      itemCount: data.length,
      itemBuilder: (context, index) {
        String key = data.keys.elementAt(index);
        dynamic value = data[key];
        return ListTile(
          title: Text(key),
          subtitle: Text(value.toString()),
        );
      },
    );
  }

  Widget _buildFloatingActionButton(BuildContext context) {
    return BlocBuilder<MonitoringBloc, MonitoringState>(
      builder: (context, state) {
        if (state is MonitoringActive) {
          return FloatingActionButton(
            onPressed: () => context.read<MonitoringBloc>().add(StopMonitoring()),
            child: const Icon(Icons.stop),
          );
        } else {
          return FloatingActionButton(
            onPressed: () => context.read<MonitoringBloc>().add(StartMonitoring()),
            child: const Icon(Icons.play_arrow),
          );
        }
      },
    );
  }
}