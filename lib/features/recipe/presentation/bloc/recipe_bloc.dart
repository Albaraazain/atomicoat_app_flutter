import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../domain/entities/recipe.dart';

part 'recipe_event.dart';
part 'recipe_state.dart';

// Mock data
List<Recipe> mockRecipes = [
  Recipe(
    id: '1',
    name: 'Basic Coating',
    steps: [
      RecipeStep(action: 'SetTemperature', parameters: {'temperature': 100}),
      RecipeStep(action: 'SetPressure', parameters: {'pressure': 2.5}),
      RecipeStep(action: 'Coat', parameters: {'duration': 300}),
    ],
  ),
  Recipe(
    id: '2',
    name: 'Advanced Coating',
    steps: [
      RecipeStep(action: 'SetTemperature', parameters: {'temperature': 150}),
      RecipeStep(action: 'SetPressure', parameters: {'pressure': 3.0}),
      RecipeStep(action: 'Coat', parameters: {'duration': 450}),
      RecipeStep(action: 'Cool', parameters: {'targetTemperature': 25}),
    ],
  ),
];

class RecipeBloc extends Bloc<RecipeEvent, RecipeState> {
  RecipeBloc() : super(RecipeInitial()) {
    on<LoadRecipes>(_onLoadRecipes);
    on<AddRecipe>(_onAddRecipe);
    on<UpdateRecipe>(_onUpdateRecipe);
    on<DeleteRecipe>(_onDeleteRecipe);
  }

  Future<void> _onLoadRecipes(
      LoadRecipes event,
      Emitter<RecipeState> emit,
      ) async {
    try {
      emit(RecipeLoading());
      // Simulate network delay
      await Future.delayed(const Duration(seconds: 1));
      // In a real app, you would fetch recipes from an API or local database here
      emit(RecipeLoaded(recipes: List.from(mockRecipes)));
    } catch (e) {
      emit(RecipeError(message: 'Failed to load recipes: ${e.toString()}'));
    }
  }

  Future<void> _onAddRecipe(
      AddRecipe event,
      Emitter<RecipeState> emit,
      ) async {
    try {
      final currentState = state;
      if (currentState is RecipeLoaded) {
        emit(RecipeLoading());
        // Simulate network delay
        await Future.delayed(const Duration(seconds: 1));
        // In a real app, you would add the recipe to an API or local database here
        final updatedRecipes = List<Recipe>.from(currentState.recipes)..add(event.recipe);
        emit(RecipeLoaded(recipes: updatedRecipes));
      }
    } catch (e) {
      emit(RecipeError(message: 'Failed to add recipe: ${e.toString()}'));
    }
  }

  Future<void> _onUpdateRecipe(
      UpdateRecipe event,
      Emitter<RecipeState> emit,
      ) async {
    try {
      final currentState = state;
      if (currentState is RecipeLoaded) {
        emit(RecipeLoading());
        // Simulate network delay
        await Future.delayed(const Duration(seconds: 1));
        // In a real app, you would update the recipe in an API or local database here
        final updatedRecipes = currentState.recipes.map((recipe) {
          return recipe.id == event.recipe.id ? event.recipe : recipe;
        }).toList();
        emit(RecipeLoaded(recipes: updatedRecipes));
      }
    } catch (e) {
      emit(RecipeError(message: 'Failed to update recipe: ${e.toString()}'));
    }
  }

  Future<void> _onDeleteRecipe(
      DeleteRecipe event,
      Emitter<RecipeState> emit,
      ) async {
    try {
      final currentState = state;
      if (currentState is RecipeLoaded) {
        emit(RecipeLoading());
        // Simulate network delay
        await Future.delayed(const Duration(seconds: 1));
        // In a real app, you would delete the recipe from an API or local database here
        final updatedRecipes = currentState.recipes.where((recipe) => recipe.id != event.id).toList();
        emit(RecipeLoaded(recipes: updatedRecipes));
      }
    } catch (e) {
      emit(RecipeError(message: 'Failed to delete recipe: ${e.toString()}'));
    }
  }
}