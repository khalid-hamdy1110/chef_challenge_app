import 'package:chef_challenge_project/models/api_result.dart';
import 'package:chef_challenge_project/models/entities.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'explore_state.freezed.dart';

@freezed
sealed class ExploreState with _$ExploreState {
  const factory ExploreState.initial() = ExploreInitial;

  const factory ExploreState.loading() = ExploreLoading;

  const factory ExploreState.success({
    required List<Recipe> recipes,
    required List<Recipe> filteredRecipes,
    required List<String> allTags,
    Recipe? recipeOfTheDay,
    @Default(true) bool listView,
    @Default(<String>[]) List<String> selectedTags,
  }) = ExploreSuccess;

  const factory ExploreState.failure({required ApiError error}) = ExploreFailure;
}
