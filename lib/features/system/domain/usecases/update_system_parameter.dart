import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/system_repository.dart';

class UpdateSystemParameter implements UseCase<void, Params> {
  final SystemRepository repository;

  UpdateSystemParameter(this.repository);

  @override
  Future<Either<Failure, void>> call(Params params) async {
    return await repository.updateSystemParameter(params.parameter, params.value);
  }
}

class Params extends Equatable {
  final String parameter;
  final dynamic value;

  const Params({required this.parameter, required this.value});

  @override
  List<Object?> get props => [parameter, value];
}