import 'package:chef_challenge_project/models/DTOs/ingredient_dto.dart';
import 'package:chef_challenge_project/models/entities.dart';

class IngredientMapper {
  Ingredient call(IngredientDTO dto) {
    return Ingredient(
      name: dto.name,
      amount: dto.original
    );
  }
}