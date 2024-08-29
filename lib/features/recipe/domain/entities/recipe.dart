import 'package:equatable/equatable.dart';

class Recipe extends Equatable {
  final String id;
  final String name;
  final List<RecipeStep> steps;

  const Recipe({
    required this.id,
    required this.name,
    required this.steps,
  });

  @override
  List<Object?> get props => [id, name, steps];
}

class RecipeStep extends Equatable {
  final String action;
  final Map<String, dynamic> parameters;

  const RecipeStep({
    required this.action,
    required this.parameters,
  });

  @override
  List<Object?> get props => [action, parameters];
}