import 'package:chef_challenge_project/models/entities.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_state.freezed.dart';

@freezed
abstract class UserState with _$UserState {
  const factory UserState({
    required Difficulty? cookingLevel,
    required String? name,
    required List<Recipe> favorites,
    required List<RecipeHistory> history,
    required bool showOnboarding
  }) = _UserState;

  factory UserState.initial() {
    return const UserState(
      cookingLevel: null,
      name: null,
      favorites: [],
      history: [],
      showOnboarding: true
    );
  }
}
