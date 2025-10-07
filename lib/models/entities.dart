import 'package:freezed_annotation/freezed_annotation.dart';

part 'entities.freezed.dart';
part 'entities.g.dart';

enum RecipeType { meat, vegetarian }

enum Difficulty { beginner, intermediate, chef }

enum StepType { prep, cooking }

enum AcceptanceMarginStatus { beforeMargin, withinMargin, afterMargin }

@freezed
abstract class Ingredient with _$Ingredient {
  const factory Ingredient({required String amount, required String name}) =
      _Ingredient;

  factory Ingredient.fromJson(Map<String, dynamic> json) => _$IngredientFromJson(json);
}

@freezed
abstract class RecipeStep with _$RecipeStep {
  const factory RecipeStep({
    required int number,
    required String name,
    required String description,
    required StepType stepType,
    required Duration duration,
    required Duration acceptableMarginDuration,
    String? comment,
  }) = _RecipeStep;

  factory RecipeStep.fromJson(Map<String, dynamic> json) => _$RecipeStepFromJson(json);
}

@freezed
abstract class SummaryStep with _$SummaryStep {
  const factory SummaryStep({
    required RecipeStep step,
    required Duration timeTaken,
    required AcceptanceMarginStatus marginStatus,
    required Duration totalTimeTaken,
  }) = _SummaryStep;

  factory SummaryStep.fromJson(Map<String, dynamic> json) => _$SummaryStepFromJson(json);
}

@freezed
abstract class Recipe with _$Recipe {
  const factory Recipe({
    required String name,
    required List<String> tags,
    required RecipeType recipeType,
    required Difficulty difficulty,
    required String description,
    required List<Ingredient> ingredients,
    required int calories,
    required int protein,
    required int carbs,
    required List<RecipeStep> steps,
    required String imageUrl,
  }) = _Recipe;

  factory Recipe.fromJson(Map<String, dynamic> json) => _$RecipeFromJson(json);
}

extension RecipeGetters on Recipe {
  double difficultyFactor(Difficulty cookingLevel) {
    /* Difficulty Factor will be used to determine how much extra time should
       be given to the user based on their own cooking level, this factor will then
       be multiplied with the provided acceptaable margin in each step to determine
       the amount of time given to the user. */

    switch (cookingLevel) {
      case Difficulty.beginner:
        if (difficulty == Difficulty.beginner) {
          return 1;
        } else if (difficulty == Difficulty.intermediate) {
          return 1.5;
        }
        return 2;
      case Difficulty.intermediate:
        if (difficulty == Difficulty.beginner) {
          return 0.5;
        } else if (difficulty == Difficulty.intermediate) {
          return 1;
        }
        return 1.5;
      case Difficulty.chef:
        if (difficulty == Difficulty.beginner) {
          return 0;
        } else if (difficulty == Difficulty.intermediate) {
          return 0.5;
        }
        return 1;
    }
  }

  Duration get totalDuration {
    Duration total = Duration.zero;
    for (RecipeStep step in steps) {
      total += step.duration;
    }
    return total;
  }

  Duration totalAcceptableMargin(Difficulty cookingLevel) {
    Duration total = Duration.zero;
    for (RecipeStep step in steps) {
      total += step.acceptableMarginDuration*difficultyFactor(cookingLevel);
    }
    return total;
  }

  int get prepTime {
    Duration total = Duration.zero;
    for (RecipeStep step in steps) {
      if (step.stepType == StepType.prep) {
        total += step.duration;
      }
    }
    return total.inMinutes;
  }

  int get cookingTime {
    Duration total = Duration.zero;
    for (RecipeStep step in steps) {
      if (step.stepType == StepType.cooking) {
        total += step.duration;
      }
    }
    return total.inMinutes;
  }
}

@freezed
abstract class RecipeHistory with _$RecipeHistory {
  const factory RecipeHistory({
    required Recipe recipe,
    required List<SummaryStep> summary
  }) = _RecipeHistory;

  factory RecipeHistory.fromJson(Map<String, dynamic> json) => _$RecipeHistoryFromJson(json);
}