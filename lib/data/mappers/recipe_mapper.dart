import 'dart:math';
import 'dart:math' as math;

import 'package:chef_challenge_project/data/mappers/ingredient_mapper.dart';
import 'package:chef_challenge_project/data/mappers/step_mapper.dart';
import 'package:chef_challenge_project/models/DTOs/recipe_dto.dart';
import 'package:chef_challenge_project/models/entities.dart';
import 'package:html/parser.dart' as html_parser;

class RecipeMapper {
  Recipe call(RecipeDTO dto) {
    final ingredientMapper = IngredientMapper();
    final stepMapper = StepMapper();
    final Random random = Random();

    final readyInMinutes = dto.readyInMinutes;
    final totalPrepSeconds = (dto.preparationMinutes ?? readyInMinutes * 0.4) * 60;
    final totalCookingSeconds = (dto.cookingMinutes ?? readyInMinutes * 0.6) * 60;

    final prepStepsCount = dto.steps.fold<int>(0, (prevValue, curStep) {
      if (stepMapper.inferStepType(curStep.step) == StepType.prep) {
        return 1 + prevValue;
      }
      return prevValue;
    });

    final cookingStepsCount = dto.steps.length - prepStepsCount;

    final stepPrepSeconds = prepStepsCount == 0
        ? 0
        : (totalPrepSeconds / prepStepsCount).round();
    final stepCookingSeconds = cookingStepsCount == 0
        ? 0
        : (totalCookingSeconds / cookingStepsCount).round();

    return Recipe(
      name: dto.title,
      tags: dto.dishTypes,
      recipeType: dto.vegan ? RecipeType.vegetarian : RecipeType.meat,
      difficulty: Difficulty.values[random.nextInt(Difficulty.values.length)],
      description: cleanSummary(dto.summary),
      ingredients: dto.extendedIngredients
          .map((ingredient) => ingredientMapper.call(ingredient))
          .toList(),
      calories: dto.calories,
      protein: dto.protein,
      carbs: dto.carbs,
      steps: dto.steps.map((step) {
        final stepDuration = Duration(
          seconds: stepMapper.inferStepType(step.step) == StepType.prep
              ? stepPrepSeconds
              : stepCookingSeconds,
        );
        final acceptableMarginDuration = Duration(
          milliseconds: math.max((stepDuration.inMilliseconds * 0.2).round(), 1000),
        );

        return stepMapper.call(step, stepDuration, acceptableMarginDuration);
      }).toList(),
      imageUrl: dto.imageUrl,
    );
  }

  String cleanSummary(String htmlText) {
  final document = html_parser.parse(htmlText);
  return document.body?.text.trim() ?? '';
}
}
