import '../../domain/entities/system.dart';

class SystemModel extends System {
  const SystemModel({
    required double temperature,
    required double pressure,
    required double flowRate,
    required bool isOperational,
    required List<PresetConfiguration> presetConfigurations,
  }) : super(
    temperature: temperature,
    pressure: pressure,
    flowRate: flowRate,
    isOperational: isOperational,
    presetConfigurations: presetConfigurations,
  );

  factory SystemModel.fromJson(Map<String, dynamic> json) {
    return SystemModel(
      temperature: json['temperature'],
      pressure: json['pressure'],
      flowRate: json['flowRate'],
      isOperational: json['isOperational'],
      presetConfigurations: (json['presetConfigurations'] as List)
          .map((preset) => PresetConfiguration.fromJson(preset))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'temperature': temperature,
      'pressure': pressure,
      'flowRate': flowRate,
      'isOperational': isOperational,
      'presetConfigurations': presetConfigurations.map((preset) => preset.toJson()).toList(),
    };
  }
}

class PresetConfigurationModel extends PresetConfiguration {
  const PresetConfigurationModel({
    required String name,
    required double temperature,
    required double pressure,
    required double flowRate,
  }) : super(
    name: name,
    temperature: temperature,
    pressure: pressure,
    flowRate: flowRate,
  );

  factory PresetConfigurationModel.fromJson(Map<String, dynamic> json) {
    return PresetConfigurationModel(
      name: json['name'],
      temperature: json['temperature'],
      pressure: json['pressure'],
      flowRate: json['flowRate'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'temperature': temperature,
      'pressure': pressure,
      'flowRate': flowRate,
    };
  }
}