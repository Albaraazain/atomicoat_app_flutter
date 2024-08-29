import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/system_repository.dart';

class GetOperationHistory implements UseCase<List<SystemOperation>, NoParams> {
  final SystemRepository repository;

  GetOperationHistory(this.repository);

  @override
  Future<Either<Failure, List<SystemOperation>>> call(NoParams params) async {
    return await repository.getOperationHistory();
  }
}