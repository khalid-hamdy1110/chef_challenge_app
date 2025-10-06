// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i10;
import 'package:chef_challenge_project/models/entities.dart' as _i12;
import 'package:chef_challenge_project/screens/explore_screen.dart' as _i1;
import 'package:chef_challenge_project/screens/explore_shell_screen.dart'
    as _i2;
import 'package:chef_challenge_project/screens/favorites_screen.dart' as _i3;
import 'package:chef_challenge_project/screens/history_screen.dart' as _i4;
import 'package:chef_challenge_project/screens/navigation_bar_screen.dart'
    as _i5;
import 'package:chef_challenge_project/screens/onboard_screen.dart' as _i6;
import 'package:chef_challenge_project/screens/recipe_challenge_screen.dart'
    as _i7;
import 'package:chef_challenge_project/screens/recipe_challenge_summary_screen.dart'
    as _i8;
import 'package:chef_challenge_project/screens/recipe_details_screen.dart'
    as _i9;
import 'package:collection/collection.dart' as _i13;
import 'package:flutter/material.dart' as _i11;

/// generated route for
/// [_i1.ExploreScreen]
class ExploreRoute extends _i10.PageRouteInfo<void> {
  const ExploreRoute({List<_i10.PageRouteInfo>? children})
    : super(ExploreRoute.name, initialChildren: children);

  static const String name = 'ExploreRoute';

  static _i10.PageInfo page = _i10.PageInfo(
    name,
    builder: (data) {
      return const _i1.ExploreScreen();
    },
  );
}

/// generated route for
/// [_i2.ExploreShellScreen]
class ExploreShellRoute extends _i10.PageRouteInfo<void> {
  const ExploreShellRoute({List<_i10.PageRouteInfo>? children})
    : super(ExploreShellRoute.name, initialChildren: children);

  static const String name = 'ExploreShellRoute';

  static _i10.PageInfo page = _i10.PageInfo(
    name,
    builder: (data) {
      return const _i2.ExploreShellScreen();
    },
  );
}

/// generated route for
/// [_i3.FavoritesScreen]
class FavoritesRoute extends _i10.PageRouteInfo<void> {
  const FavoritesRoute({List<_i10.PageRouteInfo>? children})
    : super(FavoritesRoute.name, initialChildren: children);

  static const String name = 'FavoritesRoute';

  static _i10.PageInfo page = _i10.PageInfo(
    name,
    builder: (data) {
      return const _i3.FavoritesScreen();
    },
  );
}

/// generated route for
/// [_i4.HistoryScreen]
class HistoryRoute extends _i10.PageRouteInfo<void> {
  const HistoryRoute({List<_i10.PageRouteInfo>? children})
    : super(HistoryRoute.name, initialChildren: children);

  static const String name = 'HistoryRoute';

  static _i10.PageInfo page = _i10.PageInfo(
    name,
    builder: (data) {
      return const _i4.HistoryScreen();
    },
  );
}

/// generated route for
/// [_i5.NavigationBarScreen]
class NavigationBarRoute extends _i10.PageRouteInfo<void> {
  const NavigationBarRoute({List<_i10.PageRouteInfo>? children})
    : super(NavigationBarRoute.name, initialChildren: children);

  static const String name = 'NavigationBarRoute';

  static _i10.PageInfo page = _i10.PageInfo(
    name,
    builder: (data) {
      return const _i5.NavigationBarScreen();
    },
  );
}

/// generated route for
/// [_i6.OnboardScreen]
class OnboardRoute extends _i10.PageRouteInfo<void> {
  const OnboardRoute({List<_i10.PageRouteInfo>? children})
    : super(OnboardRoute.name, initialChildren: children);

  static const String name = 'OnboardRoute';

  static _i10.PageInfo page = _i10.PageInfo(
    name,
    builder: (data) {
      return const _i6.OnboardScreen();
    },
  );
}

/// generated route for
/// [_i7.RecipeChallengeScreen]
class RecipeChallengeRoute
    extends _i10.PageRouteInfo<RecipeChallengeRouteArgs> {
  RecipeChallengeRoute({
    _i11.Key? key,
    required _i12.Recipe recipe,
    List<_i10.PageRouteInfo>? children,
  }) : super(
         RecipeChallengeRoute.name,
         args: RecipeChallengeRouteArgs(key: key, recipe: recipe),
         initialChildren: children,
       );

  static const String name = 'RecipeChallengeRoute';

  static _i10.PageInfo page = _i10.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<RecipeChallengeRouteArgs>();
      return _i7.RecipeChallengeScreen(key: args.key, recipe: args.recipe);
    },
  );
}

class RecipeChallengeRouteArgs {
  const RecipeChallengeRouteArgs({this.key, required this.recipe});

  final _i11.Key? key;

  final _i12.Recipe recipe;

  @override
  String toString() {
    return 'RecipeChallengeRouteArgs{key: $key, recipe: $recipe}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! RecipeChallengeRouteArgs) return false;
    return key == other.key && recipe == other.recipe;
  }

  @override
  int get hashCode => key.hashCode ^ recipe.hashCode;
}

/// generated route for
/// [_i8.RecipeChallengeSummaryScreen]
class RecipeChallengeSummaryRoute
    extends _i10.PageRouteInfo<RecipeChallengeSummaryRouteArgs> {
  RecipeChallengeSummaryRoute({
    _i11.Key? key,
    required _i12.Recipe recipe,
    required List<_i12.SummaryStep> summary,
    List<_i10.PageRouteInfo>? children,
  }) : super(
         RecipeChallengeSummaryRoute.name,
         args: RecipeChallengeSummaryRouteArgs(
           key: key,
           recipe: recipe,
           summary: summary,
         ),
         initialChildren: children,
       );

  static const String name = 'RecipeChallengeSummaryRoute';

  static _i10.PageInfo page = _i10.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<RecipeChallengeSummaryRouteArgs>();
      return _i8.RecipeChallengeSummaryScreen(
        key: args.key,
        recipe: args.recipe,
        summary: args.summary,
      );
    },
  );
}

class RecipeChallengeSummaryRouteArgs {
  const RecipeChallengeSummaryRouteArgs({
    this.key,
    required this.recipe,
    required this.summary,
  });

  final _i11.Key? key;

  final _i12.Recipe recipe;

  final List<_i12.SummaryStep> summary;

  @override
  String toString() {
    return 'RecipeChallengeSummaryRouteArgs{key: $key, recipe: $recipe, summary: $summary}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! RecipeChallengeSummaryRouteArgs) return false;
    return key == other.key &&
        recipe == other.recipe &&
        const _i13.ListEquality().equals(summary, other.summary);
  }

  @override
  int get hashCode =>
      key.hashCode ^ recipe.hashCode ^ const _i13.ListEquality().hash(summary);
}

/// generated route for
/// [_i9.RecipeDetailsScreen]
class RecipeDetailsRoute extends _i10.PageRouteInfo<RecipeDetailsRouteArgs> {
  RecipeDetailsRoute({
    _i11.Key? key,
    required _i12.Recipe recipe,
    List<_i10.PageRouteInfo>? children,
  }) : super(
         RecipeDetailsRoute.name,
         args: RecipeDetailsRouteArgs(key: key, recipe: recipe),
         initialChildren: children,
       );

  static const String name = 'RecipeDetailsRoute';

  static _i10.PageInfo page = _i10.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<RecipeDetailsRouteArgs>();
      return _i9.RecipeDetailsScreen(key: args.key, recipe: args.recipe);
    },
  );
}

class RecipeDetailsRouteArgs {
  const RecipeDetailsRouteArgs({this.key, required this.recipe});

  final _i11.Key? key;

  final _i12.Recipe recipe;

  @override
  String toString() {
    return 'RecipeDetailsRouteArgs{key: $key, recipe: $recipe}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! RecipeDetailsRouteArgs) return false;
    return key == other.key && recipe == other.recipe;
  }

  @override
  int get hashCode => key.hashCode ^ recipe.hashCode;
}
