import 'package:equatable/equatable.dart';
import '../../domain/entities/system.dart';
import '../../domain/entities/system_operation.dart';

abstract class SystemState extends Equatable {
  const SystemState();

  @override
  List<Object> get props => [];
}

class SystemInitial extends SystemState {}

class SystemLoading extends SystemState {}

class SystemLoaded extends SystemState {
  final System system;

  const SystemLoaded(this.system);

  @override
  List<Object> get props => [system];
}

class OperationHistoryLoaded extends SystemState {
  final List<SystemOperation> history;

  const OperationHistoryLoaded(this.history);

  @override
  List<Object> get props => [history];
}

class SystemError extends SystemState {
  final String message;

  const SystemError(this.message);

  @override
  List<Object> get props => [message];
}