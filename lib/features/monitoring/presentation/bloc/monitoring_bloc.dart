import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'monitoring_event.dart';
part 'monitoring_state.dart';

class MonitoringBloc extends Bloc<MonitoringEvent, MonitoringState> {
  MonitoringBloc() : super(MonitoringInitial()) {
    on<StartMonitoring>(_onStartMonitoring);
    on<StopMonitoring>(_onStopMonitoring);
    on<UpdateMonitoringData>(_onUpdateMonitoringData);
  }

  Timer? _timer;

  void _onStartMonitoring(StartMonitoring event, Emitter<MonitoringState> emit) {
    if (_timer != null) {
      _timer!.cancel();
    }
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      add(UpdateMonitoringData(_generateMockData()));
    });
    emit(MonitoringActive(data: _generateMockData()));
  }

  void _onStopMonitoring(StopMonitoring event, Emitter<MonitoringState> emit) {
    if (_timer != null) {
      _timer!.cancel();
      _timer = null;
    }
    emit(MonitoringInactive());
  }

  void _onUpdateMonitoringData(UpdateMonitoringData event, Emitter<MonitoringState> emit) {
    emit(MonitoringActive(data: event.data));
  }

  Map<String, dynamic> _generateMockData() {
    return {
      'temperature': (100 + DateTime.now().second % 50).toDouble(),
      'pressure': 2.0 + (DateTime.now().millisecond % 1000) / 500,
      'flow_rate': 5 + DateTime.now().second % 10,
      'coating_thickness': 0.1 + (DateTime.now().millisecond % 500) / 1000,
    };
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }
}