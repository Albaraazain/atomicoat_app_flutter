import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../entities/system.dart';

// The SystemRepository interface defines the contract for interacting with the system data source.

abstract class SystemRepository {
  /// Fetches the current status of the system.
  ///
  /// Returns a [Future] that completes with an [Either]:
  /// - [Right] containing a [System] entity if the operation is successful.
  /// - [Left] containing a [Failure] if an error occurs.
  Future<Either<Failure, System>> getSystemStatus();

  /// Updates a specific parameter of the system.
  ///
  /// [parameter] is the name of the parameter to update.
  /// [value] is the new value for the parameter.
  ///
  /// Returns a [Future] that completes with an [Either]:
  /// - [Right] containing `void` if the operation is successful.
  /// - [Left] containing a [Failure] if an error occurs.
  Future<Either<Failure, void>> updateSystemParameter(String parameter, dynamic value);

  /// Starts the system operation.
  ///
  /// Returns a [Future] that completes with an [Either]:
  /// - [Right] containing `void` if the operation is successful.
  /// - [Left] containing a [Failure] if an error occurs.
  Future<Either<Failure, void>> startSystem();

  /// Stops the system operation.
  ///
  /// Returns a [Future] that completes with an [Either]:
  /// - [Right] containing `void` if the operation is successful.
  /// - [Left] containing a [Failure] if an error occurs.
  Future<Either<Failure, void>> stopSystem();

  /// Retrieves the system operation history.
  ///
  /// Returns a [Future] that completes with an [Either]:
  /// - [Right] containing a [List<SystemOperation>] if the operation is successful.
  /// - [Left] containing a [Failure] if an error occurs.
  Future<Either<Failure, List<SystemOperation>>> getOperationHistory();
}

/// Represents a single operation performed on the system.
class SystemOperation {
  final DateTime timestamp;
  final String operation;
  final Map<String, dynamic> parameters;

  SystemOperation({
    required this.timestamp,
    required this.operation,
    required this.parameters,
  });
}