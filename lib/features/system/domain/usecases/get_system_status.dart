import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/system.dart';
import '../repositories/system_repository.dart';

class GetSystemStatus implements UseCase<System, NoParams> {
  final SystemRepository repository;

  GetSystemStatus(this.repository);

  @override
  Future<Either<Failure, System>> call(NoParams params) async {
    return await repository.getSystemStatus();
  }
}

class NoParams {}