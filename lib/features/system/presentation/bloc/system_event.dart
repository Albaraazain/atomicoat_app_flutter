import 'package:equatable/equatable.dart';

abstract class SystemEvent extends Equatable {
  const SystemEvent();

  @override
  List<Object> get props => [];
}

class GetSystemStatusEvent extends SystemEvent {}

class UpdateSystemParameterEvent extends SystemEvent {
  final String parameter;
  final dynamic value;

  const UpdateSystemParameterEvent(this.parameter, this.value);

  @override
  List<Object> get props => [parameter, value];
}

class StartSystemEvent extends SystemEvent {}

class StopSystemEvent extends SystemEvent {}

class GetOperationHistoryEvent extends SystemEvent {}

class SystemUpdateReceivedEvent extends SystemEvent {
  final System systemUpdate;

  const SystemUpdateReceivedEvent(this.systemUpdate);

  @override
  List<Object> get props => [systemUpdate];
}