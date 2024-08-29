import '../../domain/entities/system_operation.dart';

class SystemOperationModel extends SystemOperation {
  SystemOperationModel({
    required DateTime timestamp,
    required String operation,
    required Map<String, dynamic> parameters,
  }) : super(
    timestamp: timestamp,
    operation: operation,
    parameters: parameters,
  );

  factory SystemOperationModel.fromJson(Map<String, dynamic> json) {
    return SystemOperationModel(
      timestamp: DateTime.parse(json['timestamp']),
      operation: json['operation'],
      parameters: Map<String, dynamic>.from(json['parameters']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'timestamp': timestamp.toIso8601String(),
      'operation': operation,
      'parameters': parameters,
    };
  }

  factory SystemOperationModel.fromEntity(SystemOperation operation) {
    return SystemOperationModel(
      timestamp: operation.timestamp,
      operation: operation.operation,
      parameters: operation.parameters,
    );
  }
}