import 'package:chef_challenge_project/models.dart';
import 'package:chef_challenge_project/states/user/user_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserState.initial());

  void setCookingLevel(Difficulty difficulty) {
    emit(state.copyWith(cookingLevel: difficulty));
  }

  void setName(String name) {
    emit(state.copyWith(name: name));
  }

  void onFavorite(Recipe recipe) {
    if (state.favorites.contains(recipe)) {
      emit(
        state.copyWith(favorites: List.from(state.favorites)..remove(recipe)),
      );
    } else {
      emit(state.copyWith(favorites: List.from(state.favorites)..add(recipe)));
    }
  }

  void onDoneWithRecipe(RecipeHistory recipeHistory) {
    emit(state.copyWith(history: List.from(state.history)..add(recipeHistory)));
  }
}
