part of 'monitoring_bloc.dart';

abstract class MonitoringState extends Equatable {
  const MonitoringState();

  @override
  List<Object> get props => [];
}

class MonitoringInitial extends MonitoringState {}

class MonitoringActive extends MonitoringState {
  final Map<String, dynamic> data;

  const MonitoringActive({required this.data});

  @override
  List<Object> get props => [data];
}

class MonitoringInactive extends MonitoringState {}

class MonitoringError extends MonitoringState {
  final String message;

  const MonitoringError({required this.message});

  @override
  List<Object> get props => [message];
}