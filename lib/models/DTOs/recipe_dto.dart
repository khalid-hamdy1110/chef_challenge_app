import 'package:chef_challenge_project/models/DTOs/ingredient_dto.dart';
import 'package:chef_challenge_project/models/DTOs/step_dto.dart';

class RecipeDTO {
  final int id;
  final String title;
  final String summary;
  final String imageUrl;
  final bool vegan;
  final List<IngredientDTO> extendedIngredients;
  final int calories;
  final int protein;
  final int carbs;
  final List<String> dishTypes;
  final List<StepDTO> steps;
  final int readyInMinutes;
  final int? preparationMinutes;
  final int? cookingMinutes;

  RecipeDTO({
    required this.id,
    required this.title,
    required this.summary,
    required this.imageUrl,
    required this.vegan,
    required this.extendedIngredients,
    required this.calories,
    required this.protein,
    required this.carbs,
    required this.dishTypes,
    required this.steps,
    required this.readyInMinutes,
    required this.preparationMinutes,
    required this.cookingMinutes,
  });

  factory RecipeDTO.fromJSON(Map<String, dynamic> json, List<StepDTO> steps, List<IngredientDTO> ingredients) {
    return RecipeDTO(
      id: json['id'],
      title: json['title'],
      summary: json['summary'],
      imageUrl: json['image'],
      vegan: json['vegan'],
      extendedIngredients: ingredients,
      calories: (json["nutrition"]["nutrients"][0]['amount']as double).round(),
      protein: (json["nutrition"]["nutrients"][10]['amount']as double).round(),
      carbs: (json["nutrition"]["nutrients"][3]['amount']as double).round(),
      dishTypes: (json['dishTypes'] as List).map((element) => element.toString()).toList(),
      steps: steps,
      readyInMinutes: json['readyInMinutes'],
      preparationMinutes: json['preparationMinutes'],
      cookingMinutes: json['cookingMinutes'],
    );
  }
}
