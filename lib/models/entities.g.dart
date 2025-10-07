// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'entities.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Ingredient _$IngredientFromJson(Map<String, dynamic> json) =>
    _Ingredient(amount: json['amount'] as String, name: json['name'] as String);

Map<String, dynamic> _$IngredientToJson(_Ingredient instance) =>
    <String, dynamic>{'amount': instance.amount, 'name': instance.name};

_RecipeStep _$RecipeStepFromJson(Map<String, dynamic> json) => _RecipeStep(
  number: (json['number'] as num).toInt(),
  name: json['name'] as String,
  description: json['description'] as String,
  stepType: $enumDecode(_$StepTypeEnumMap, json['stepType']),
  duration: Duration(microseconds: (json['duration'] as num).toInt()),
  acceptableMarginDuration: Duration(
    microseconds: (json['acceptableMarginDuration'] as num).toInt(),
  ),
  comment: json['comment'] as String?,
);

Map<String, dynamic> _$RecipeStepToJson(
  _RecipeStep instance,
) => <String, dynamic>{
  'number': instance.number,
  'name': instance.name,
  'description': instance.description,
  'stepType': _$StepTypeEnumMap[instance.stepType]!,
  'duration': instance.duration.inMicroseconds,
  'acceptableMarginDuration': instance.acceptableMarginDuration.inMicroseconds,
  'comment': instance.comment,
};

const _$StepTypeEnumMap = {StepType.prep: 'prep', StepType.cooking: 'cooking'};

_SummaryStep _$SummaryStepFromJson(Map<String, dynamic> json) => _SummaryStep(
  step: RecipeStep.fromJson(json['step'] as Map<String, dynamic>),
  timeTaken: Duration(microseconds: (json['timeTaken'] as num).toInt()),
  marginStatus: $enumDecode(
    _$AcceptanceMarginStatusEnumMap,
    json['marginStatus'],
  ),
  totalTimeTaken: Duration(
    microseconds: (json['totalTimeTaken'] as num).toInt(),
  ),
);

Map<String, dynamic> _$SummaryStepToJson(_SummaryStep instance) =>
    <String, dynamic>{
      'step': instance.step,
      'timeTaken': instance.timeTaken.inMicroseconds,
      'marginStatus': _$AcceptanceMarginStatusEnumMap[instance.marginStatus]!,
      'totalTimeTaken': instance.totalTimeTaken.inMicroseconds,
    };

const _$AcceptanceMarginStatusEnumMap = {
  AcceptanceMarginStatus.beforeMargin: 'beforeMargin',
  AcceptanceMarginStatus.withinMargin: 'withinMargin',
  AcceptanceMarginStatus.afterMargin: 'afterMargin',
};

_Recipe _$RecipeFromJson(Map<String, dynamic> json) => _Recipe(
  name: json['name'] as String,
  tags: (json['tags'] as List<dynamic>).map((e) => e as String).toList(),
  recipeType: $enumDecode(_$RecipeTypeEnumMap, json['recipeType']),
  difficulty: $enumDecode(_$DifficultyEnumMap, json['difficulty']),
  description: json['description'] as String,
  ingredients: (json['ingredients'] as List<dynamic>)
      .map((e) => Ingredient.fromJson(e as Map<String, dynamic>))
      .toList(),
  calories: (json['calories'] as num).toInt(),
  protein: (json['protein'] as num).toInt(),
  carbs: (json['carbs'] as num).toInt(),
  steps: (json['steps'] as List<dynamic>)
      .map((e) => RecipeStep.fromJson(e as Map<String, dynamic>))
      .toList(),
  imageUrl: json['imageUrl'] as String,
);

Map<String, dynamic> _$RecipeToJson(_Recipe instance) => <String, dynamic>{
  'name': instance.name,
  'tags': instance.tags,
  'recipeType': _$RecipeTypeEnumMap[instance.recipeType]!,
  'difficulty': _$DifficultyEnumMap[instance.difficulty]!,
  'description': instance.description,
  'ingredients': instance.ingredients,
  'calories': instance.calories,
  'protein': instance.protein,
  'carbs': instance.carbs,
  'steps': instance.steps,
  'imageUrl': instance.imageUrl,
};

const _$RecipeTypeEnumMap = {
  RecipeType.meat: 'meat',
  RecipeType.vegetarian: 'vegetarian',
};

const _$DifficultyEnumMap = {
  Difficulty.beginner: 'beginner',
  Difficulty.intermediate: 'intermediate',
  Difficulty.chef: 'chef',
};

_RecipeHistory _$RecipeHistoryFromJson(Map<String, dynamic> json) =>
    _RecipeHistory(
      recipe: Recipe.fromJson(json['recipe'] as Map<String, dynamic>),
      summary: (json['summary'] as List<dynamic>)
          .map((e) => SummaryStep.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RecipeHistoryToJson(_RecipeHistory instance) =>
    <String, dynamic>{'recipe': instance.recipe, 'summary': instance.summary};
