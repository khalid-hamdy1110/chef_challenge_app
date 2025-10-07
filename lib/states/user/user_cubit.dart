import 'package:chef_challenge_project/data/caching_service.dart';
import 'package:chef_challenge_project/models/entities.dart';
import 'package:chef_challenge_project/states/user/user_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit(this._cachingService) : super(UserState.initial());

  final CachingService _cachingService;

  void setCookingLevel(Difficulty difficulty) {
    _cachingService.setUser(cookingLevel: difficulty);
    emit(state.copyWith(cookingLevel: difficulty));
  }

  void setName(String name) {
    _cachingService.setUser(name: name);
    emit(state.copyWith(name: name));
  }

  void onFavorite(Recipe recipe) {
    if (state.favorites.contains(recipe)) {
      _cachingService.setUser(
        favorites: List.from(state.favorites)..remove(recipe),
      );
      emit(
        state.copyWith(favorites: List.from(state.favorites)..remove(recipe)),
      );
    } else {
      _cachingService.setUser(
        favorites: List.from(state.favorites)..add(recipe),
      );
      emit(state.copyWith(favorites: List.from(state.favorites)..add(recipe)));
    }
  }

  void onDoneWithRecipe(RecipeHistory recipeHistory) {
    _cachingService.setUser(
      history: List.from(state.history)..add(recipeHistory),
    );
    emit(state.copyWith(history: List.from(state.history)..add(recipeHistory)));
  }

  void loadFromCache() {
    final user = _cachingService.getUser();
    emit(
      state.copyWith(
        showOnboarding: user.showOnboarding,
        name: user.name,
        cookingLevel: user.cookingLevel,
        favorites: user.favorites,
        history: user.history,
      ),
    );
  }

  void onFirstOnboarding() {
    _cachingService.setUser(showOnboarding: false);
    emit(state.copyWith(showOnboarding: false));
  }
}
