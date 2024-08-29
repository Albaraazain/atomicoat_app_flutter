part of 'monitoring_bloc.dart';

abstract class MonitoringEvent extends Equatable {
  const MonitoringEvent();

  @override
  List<Object> get props => [];
}

class StartMonitoring extends MonitoringEvent {}

class StopMonitoring extends MonitoringEvent {}

class UpdateMonitoringData extends MonitoringEvent {
  final Map<String, dynamic> data;

  const UpdateMonitoringData(this.data);

  @override
  List<Object> get props => [data];
}