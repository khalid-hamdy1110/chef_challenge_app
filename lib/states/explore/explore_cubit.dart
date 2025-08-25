import 'package:chef_challenge_project/models.dart';
import 'package:chef_challenge_project/states/explore/explore_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExploreCubit extends Cubit<ExploreState> {
  ExploreCubit() : super(ExploreState.initial());

  void updateRecipeOfTheDay() {
    final now = DateTime.now();

    final seed = now.year * 10000 + now.month * 100 + now.day;
    final index = seed % state.recipes.length;
    emit(state.copyWith(recipeOfTheDay: state.recipes[index]));
  }

  void toggleListView(bool listView) {
    emit(state.copyWith(listView: listView));
  }

  void filterRecipes({required String searchWord}) {
    final query = searchWord.trim().toLowerCase();
    final hasQuery = query.isNotEmpty;
    final hasTagFilter = state.selectedTags.isNotEmpty;

    List<Recipe> result;

    if (!hasQuery && !hasTagFilter) {
      result = List<Recipe>.from(state.recipes);
    } else {
      result =
          state.recipes.where((recipe) {
            final matchWord =
                !hasQuery || recipe.name.toLowerCase().contains(query);
            final matchTag =
                !hasTagFilter || state.selectedTags.every(recipe.tags.contains);
            return matchWord && matchTag;
          }).toList()..sort(
            (a, b) => a.name.compareTo(b.name),
          ); // default is growable => mutable
    }

    emit(state.copyWith(filteredRecipe: result));
  }

  void onTagSelect(Tag tag) {
    if (state.selectedTags.contains(tag)) {
      emit(
        state.copyWith(
          selectedTags: List.from(state.selectedTags)..remove(tag),
        ),
      );
    } else {
      emit(
        state.copyWith(selectedTags: List.from(state.selectedTags)..add(tag)),
      );
    }
  }

  void clearTags() {
    emit(state.copyWith(selectedTags: []));
  }
}
