import 'package:dartz/dartz.dart';
import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/entities/system.dart';
import '../../domain/entities/system_operation.dart';
import '../../domain/repositories/system_repository.dart';
import '../datasources/system_local_data_source.dart';
import '../datasources/system_remote_data_source.dart';
import '../models/system_model.dart';
import '../models/system_operation_model.dart';

class SystemRepositoryImpl implements SystemRepository {
  final SystemRemoteDataSource remoteDataSource;
  final SystemLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  SystemRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, System>> getSystemStatus() async {
    if (await networkInfo.isConnected) {
      try {
        final remoteSystem = await remoteDataSource.getSystemStatus();
        localDataSource.cacheSystemStatus(remoteSystem);
        return Right(remoteSystem);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final localSystem = await localDataSource.getLastKnownSystemStatus();
        return Right(localSystem);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }

  @override
  Future<Either<Failure, void>> updateSystemParameter(String parameter, dynamic value) async {
    if (await networkInfo.isConnected) {
      try {
        await remoteDataSource.updateSystemParameter(parameter, value);
        return const Right(null);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(NetworkFailure());
    }
  }

  @override
  Future<Either<Failure, void>> startSystem() async {
    if (await networkInfo.isConnected) {
      try {
        await remoteDataSource.startSystem();
        return const Right(null);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(NetworkFailure());
    }
  }

  @override
  Future<Either<Failure, void>> stopSystem() async {
    if (await networkInfo.isConnected) {
      try {
        await remoteDataSource.stopSystem();
        return const Right(null);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(NetworkFailure());
    }
  }

  @override
  Future<Either<Failure, List<SystemOperation>>> getOperationHistory() async {
    if (await networkInfo.isConnected) {
      try {
        final remoteHistory = await remoteDataSource.getOperationHistory();
        localDataSource.cacheOperationHistory(remoteHistory);
        return Right(remoteHistory);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final localHistory = await localDataSource.getLastKnownOperationHistory();
        return Right(localHistory);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }

  @override
  Stream<System> getSystemUpdates() {
    return remoteDataSource.getSystemUpdates();
  }
}