import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/usecases/get_system_status.dart';
import '../../domain/usecases/update_system_parameter.dart';
import '../../domain/usecases/start_system.dart';
import '../../domain/usecases/stop_system.dart';
import '../../domain/usecases/get_operation_history.dart';
import '../../domain/usecases/get_system_updates.dart';
import './system_event.dart';
import './system_state.dart';

class SystemBloc extends Bloc<SystemEvent, SystemState> {
  final GetSystemStatus getSystemStatus;
  final UpdateSystemParameter updateSystemParameter;
  final StartSystem startSystem;
  final StopSystem stopSystem;
  final GetOperationHistory getOperationHistory;
  final GetSystemUpdates getSystemUpdates;

  StreamSubscription? _systemUpdatesSubscription;

  SystemBloc({
    required this.getSystemStatus,
    required this.updateSystemParameter,
    required this.startSystem,
    required this.stopSystem,
    required this.getOperationHistory,
    required this.getSystemUpdates,
  }) : super(SystemInitial()) {
    on<GetSystemStatusEvent>(_onGetSystemStatus);
    on<UpdateSystemParameterEvent>(_onUpdateSystemParameter);
    on<StartSystemEvent>(_onStartSystem);
    on<StopSystemEvent>(_onStopSystem);
    on<GetOperationHistoryEvent>(_onGetOperationHistory);
    on<SystemUpdateReceivedEvent>(_onSystemUpdateReceived);

    // Start listening to system updates
    _systemUpdatesSubscription = getSystemUpdates().listen(
          (systemUpdate) => add(SystemUpdateReceivedEvent(systemUpdate)),
    );
  }

  void _onGetSystemStatus(GetSystemStatusEvent event, Emitter<SystemState> emit) async {
    emit(SystemLoading());
    final result = await getSystemStatus(NoParams());
    result.fold(
          (failure) => emit(SystemError(failure.toString())),
          (system) => emit(SystemLoaded(system)),
    );
  }

  void _onUpdateSystemParameter(UpdateSystemParameterEvent event, Emitter<SystemState> emit) async {
    emit(SystemLoading());
    final result = await updateSystemParameter(Params(parameter: event.parameter, value: event.value));
    result.fold(
          (failure) => emit(SystemError(failure.toString())),
          (_) => add(GetSystemStatusEvent()),
    );
  }

  void _onStartSystem(StartSystemEvent event, Emitter<SystemState> emit) async {
    emit(SystemLoading());
    final result = await startSystem(NoParams());
    result.fold(
          (failure) => emit(SystemError(failure.toString())),
          (_) => add(GetSystemStatusEvent()),
    );
  }

  void _onStopSystem(StopSystemEvent event, Emitter<SystemState> emit) async {
    emit(SystemLoading());
    final result = await stopSystem(NoParams());
    result.fold(
          (failure) => emit(SystemError(failure.toString())),
          (_) => add(GetSystemStatusEvent()),
    );
  }

  void _onGetOperationHistory(GetOperationHistoryEvent event, Emitter<SystemState> emit) async {
    emit(SystemLoading());
    final result = await getOperationHistory(NoParams());
    result.fold(
          (failure) => emit(SystemError(failure.toString())),
          (history) => emit(OperationHistoryLoaded(history)),
    );
  }

  void _onSystemUpdateReceived(SystemUpdateReceivedEvent event, Emitter<SystemState> emit) {
    emit(SystemLoaded(event.systemUpdate));
  }

  @override
  Future<void> close() {
    _systemUpdatesSubscription?.cancel();
    return super.close();
  }
}