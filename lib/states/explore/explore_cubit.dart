import 'package:chef_challenge_project/data/recipe_api_service.dart';
import 'package:chef_challenge_project/models/entities.dart';
import 'package:chef_challenge_project/states/explore/explore_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExploreCubit extends Cubit<ExploreState> {
  ExploreCubit(this._service) : super(const ExploreState.initial());

  final RecipeApiService _service;

  Future<void> loadRecipes() async {
    emit(const ExploreState.loading());

    final result = await _service.getRecipes();

    if (result.isSuccess) {
      emit(
        ExploreState.success(
          recipes: result.data!,
          filteredRecipes: result.data!,
          allTags: result.data!
              .expand((recipe) => recipe.tags)
              .toSet()
              .toList(),
          recipeOfTheDay: _getRecipeOfTheDay(result.data!),
        ),
      );
    } else {
      emit(ExploreState.failure(error: result.error!));
    }
  }

  void toggleListView(bool listView) {
    state.maybeMap(
      success: (s) => emit(s.copyWith(listView: listView)),
      orElse: () {},
    );
  }

  void filterRecipes({required String searchWord}) {
  state.maybeMap(
    success: (s) {
      final query = searchWord.trim().toLowerCase();
      final normalizedSelected =
          s.selectedTags.map((tag) => tag.toLowerCase().trim()).toList();

      final filtered = s.recipes.where((recipe) {
        final name = recipe.name.toLowerCase();
        final description = recipe.description.toLowerCase();
        final recipeTags =
            recipe.tags.map((tag) => tag.toLowerCase().trim()).toList();

        final matchesQuery =
            query.isEmpty || name.contains(query) || description.contains(query);

        final matchesTags = normalizedSelected.isEmpty ||
            normalizedSelected.every(recipeTags.contains);

        return matchesQuery && matchesTags;
      }).toList()
        ..sort((a, b) => a.name.compareTo(b.name));

      emit(s.copyWith(filteredRecipes: filtered));
    },
    orElse: () {},
  );
}

  void onTagSelect(String tag) {
    state.maybeMap(
      success: (s) {
        if (s.selectedTags.contains(tag)) {
          emit(
            s.copyWith(selectedTags: List.from(s.selectedTags)..remove(tag)),
          );
        } else {
          emit(s.copyWith(selectedTags: List.from(s.selectedTags)..add(tag)));
        }
      },
      orElse: () {},
    );
  }

  void clearTags() {
    state.maybeMap(
      success: (s) => emit(s.copyWith(selectedTags: [])),
      orElse: () {},
    );
  }

  Recipe _getRecipeOfTheDay(List<Recipe> recipes) {
    final now = DateTime.now();

    final seed = now.year * 10000 + now.month * 100 + now.day;
    final index = seed % recipes.length;
    return recipes[index];
  }
}
