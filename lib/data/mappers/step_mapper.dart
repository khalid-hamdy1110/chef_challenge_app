import 'dart:math';

import 'package:chef_challenge_project/models/DTOs/step_dto.dart';
import 'package:chef_challenge_project/models/entities.dart';

class StepMapper {
  RecipeStep call(
    StepDTO dto,
    Duration duration,
    Duration acceptableMarginDuration,
  ) {
    final stepComma = dto.step.split(',').first;
    final stepFullstop = dto.step.split('.').first;
    String name = '';

    if (stepComma.length < stepFullstop.length && stepComma.isNotEmpty) {
      final commaWords = stepComma.split(' ');

      for (int i = 0; i < commaWords.length && i < 4; i++) {
        name += '${commaWords[i]} ';
      }
    } else {
      final fullstopWords = stepFullstop.split(' ');

      for (int i = 0; i < fullstopWords.length && i < 4; i++) {
        name += '${fullstopWords[i]} ';
      }
    }

    return RecipeStep(
      number: dto.number,
      name: name,
      description: dto.step,
      stepType: StepType.values[Random().nextInt(StepType.values.length)],
      duration: duration,
      acceptableMarginDuration: acceptableMarginDuration,
    );
  }

  StepType inferStepType(String description) {
    final s = description.toLowerCase();
    final RegExp cookRegex = RegExp(
      r'\b(?:bake|fry|grill|roast|boil|simmer|cook|saute|sauté|sear|pan[- ]?fry|stir[- ]?fry|poach|steam|braise|stew|broil|toast|heat|brown|carameliz|parboil|scald|reduce|microwave|air[- ]?fry|pressure[- ]?cook|slow[- ]?cook|deep[- ]?fry|griddle|char|sizzle)\w*',
      caseSensitive: false,
    );
    if (cookRegex.hasMatch(s)) return StepType.cooking;
    return StepType.prep;
  }
}
