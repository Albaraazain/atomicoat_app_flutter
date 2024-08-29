import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:auto_route/auto_route.dart';
import '../bloc/recipe_bloc.dart';
import '../../domain/entities/recipe.dart';

class RecipePage extends StatelessWidget implements AutoRouteWrapper {
  const RecipePage({Key? key}) : super(key: key);

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (context) => RecipeBloc()..add(LoadRecipes()),
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Recipes')),
      body: BlocBuilder<RecipeBloc, RecipeState>(
        builder: (context, state) {
          if (state is RecipeLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is RecipeLoaded) {
            return _buildRecipeList(context, state.recipes);
          } else if (state is RecipeError) {
            return Center(child: Text('Error: ${state.message}'));
          } else {
            return const Center(child: Text('No recipes available'));
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddRecipeDialog(context),
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildRecipeList(BuildContext context, List<Recipe> recipes) {
    return ListView.builder(
      itemCount: recipes.length,
      itemBuilder: (context, index) {
        final recipe = recipes[index];
        return ListTile(
          title: Text(recipe.name),
          subtitle: Text('${recipe.steps.length} steps'),
          trailing: IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () {
              context.read<RecipeBloc>().add(DeleteRecipe(recipe.id));
            },
          ),
          onTap: () => _showRecipeDetails(context, recipe),
        );
      },
    );
  }

  void _showAddRecipeDialog(BuildContext context) {
    final nameController = TextEditingController();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Add New Recipe'),
        content: TextField(
          controller: nameController,
          decoration: const InputDecoration(labelText: 'Recipe Name'),
        ),
        actions: [
          TextButton(
            child: const Text('Cancel'),
            onPressed: () => Navigator.of(context).pop(),
          ),
          TextButton(
            child: const Text('Add'),
            onPressed: () {
              if (nameController.text.isNotEmpty) {
                final newRecipe = Recipe(
                  id: DateTime.now().toString(),
                  name: nameController.text,
                  steps: [],
                );
                context.read<RecipeBloc>().add(AddRecipe(newRecipe));
                Navigator.of(context).pop();
              }
            },
          ),
        ],
      ),
    );
  }

  void _showRecipeDetails(BuildContext context, Recipe recipe) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(recipe.name),
        content: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: recipe.steps.map((step) {
              return ListTile(
                title: Text(step.action),
                subtitle: Text(step.parameters.toString()),
              );
            }).toList(),
          ),
        ),
        actions: [
          TextButton(
            child: const Text('Close'),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ],
      ),
    );
  }
}