import '../entities/system.dart';
import '../repositories/system_repository.dart';

class GetSystemUpdates {
  final SystemRepository repository;

  GetSystemUpdates(this.repository);

  Stream<System> call() {
    return repository.getSystemUpdates();
  }
}