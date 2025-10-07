import 'dart:convert';

import 'package:chef_challenge_project/models/entities.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CachingService {
  static const _keyName = 'name';
  static const _keyCookingLevel = 'cooking_level';
  static const _keyFavorites = 'favorites';
  static const _keyHistory = 'history';
  static const _keyOnboarding = 'show_onboarding';

  final SharedPreferencesWithCache _prefs;

  CachingService(this._prefs);

  Future<void> setUser({
    String? name,
    Difficulty? cookingLevel,
    List<Recipe>? favorites,
    List<RecipeHistory>? history,
    bool? showOnboarding,
  }) async {
    if (name != null) {
      await _prefs.setString(_keyName, name);
    }
    if (cookingLevel != null) {
      await _prefs.setString(_keyCookingLevel, cookingLevel.name);
    }
    if (favorites != null) {
      await _prefs.setString(
        _keyFavorites,
        jsonEncode(favorites.map((recipe) => recipe.toJson()).toList()),
      );
    }
    if (history != null) {
      await _prefs.setString(
        _keyHistory,
        jsonEncode(
          history.map((recipeHistory) => recipeHistory.toJson()).toList(),
        ),
      );
    }
    if (showOnboarding != null) {
      await _prefs.setBool(_keyOnboarding, showOnboarding);
    }
  }

  ({
    String? name,
    Difficulty? cookingLevel,
    List<Recipe> favorites,
    List<RecipeHistory> history,
    bool showOnboarding,
  })
  getUser() {
    final name = _prefs.getString(_keyName);
    final cookingLevel = _prefs.getString(_keyCookingLevel) == null
        ? null
        : Difficulty.values.firstWhere(
            (diff) => diff.name == _prefs.getString(_keyCookingLevel),
          );
    final showOnboarding = _prefs.getBool(_keyOnboarding) ?? true;
    final favoritesJson = _prefs.getString(_keyFavorites);
    final historyJson = _prefs.getString(_keyHistory);

    final favorites = favoritesJson == null
        ? <Recipe>[]
        : (jsonDecode(favoritesJson) as List)
              .map((recipe) => Recipe.fromJson(recipe))
              .toList();
    final history = historyJson == null
        ? <RecipeHistory>[]
        : (jsonDecode(historyJson) as List)
              .map((recipeHistory) => RecipeHistory.fromJson(recipeHistory))
              .toList();

    return (
      name: name,
      cookingLevel: cookingLevel,
      favorites: favorites,
      history: history,
      showOnboarding: showOnboarding,
    );
  }
}
