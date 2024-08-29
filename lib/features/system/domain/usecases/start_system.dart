import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/system_repository.dart';

class StartSystem implements UseCase<void, NoParams> {
  final SystemRepository repository;

  StartSystem(this.repository);

  @override
  Future<Either<Failure, void>> call(NoParams params) async {
    return await repository.startSystem();
  }
}