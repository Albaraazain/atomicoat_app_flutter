import 'package:equatable/equatable.dart';

class System extends Equatable {
  final double temperature;
  final double pressure;
  final double flowRate;
  final bool isOperational;
  final List<PresetConfiguration> presetConfigurations;

  const System({
    required this.temperature,
    required this.pressure,
    required this.flowRate,
    required this.isOperational,
    required this.presetConfigurations,
  });

  @override
  List<Object?> get props => [temperature, pressure, flowRate, isOperational, presetConfigurations];
}

class PresetConfiguration extends Equatable {
  final String name;
  final double temperature;
  final double pressure;
  final double flowRate;

  const PresetConfiguration({
    required this.name,
    required this.temperature,
    required this.pressure,
    required this.flowRate,
  });

  @override
  List<Object?> get props => [name, temperature, pressure, flowRate];
}