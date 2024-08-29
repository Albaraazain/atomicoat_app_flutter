import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/system.dart';
import '../repositories/system_repository.dart';

class ApplyPresetConfiguration implements UseCase<void, PresetConfiguration> {
  final SystemRepository repository;

  ApplyPresetConfiguration(this.repository);

  @override
  Future<Either<Failure, void>> call(PresetConfiguration params) async {
    return await repository.applyPresetConfiguration(params);
  }
}