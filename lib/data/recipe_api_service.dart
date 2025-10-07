import 'package:chef_challenge_project/data/mappers/recipe_mapper.dart';
import 'package:chef_challenge_project/models/DTOs/ingredient_dto.dart';
import 'package:chef_challenge_project/models/DTOs/recipe_dto.dart';
import 'package:chef_challenge_project/models/DTOs/step_dto.dart';
import 'package:chef_challenge_project/models/api_result.dart';
import 'package:chef_challenge_project/models/entities.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class RecipeApiService {
  final Dio _dio;

  RecipeApiService()
    : _dio = Dio(
        BaseOptions(
          baseUrl: dotenv.env['API_BASE_URL'] ?? '',
          queryParameters: {'apiKey': dotenv.env['API_KEY']},
        ),
      );

  Future<ApiResult<List<Recipe>>> getRecipes() async {
    try {
      final response = await _dio.get('/random?includeNutrition=true&number=3');

      final List<Future<RecipeDTO>>
      recipeDtoFutures = (response.data['recipes'] as List).map((json) async {
        final stepsResponse = await _dio.get(
          '/${json['id']}/analyzedInstructions',
        );

        final List<StepDTO> stepDtos = (stepsResponse.data[0]['steps'] as List)
            .map((json) => StepDTO.fromJSON(json))
            .toList();
        final List<IngredientDTO> ingredientDTOs =
            (json['extendedIngredients'] as List)
                .map((ingredientJson) => IngredientDTO.fromJSON(ingredientJson))
                .toList();
        return RecipeDTO.fromJSON(json, stepDtos, ingredientDTOs);
      }).toList();

      final recipeDtos = await Future.wait(recipeDtoFutures);

      final recipeMapper = RecipeMapper();

      final recipes = recipeDtos
          .map((recipeDto) => recipeMapper.call(recipeDto))
          .toList();

      return ApiResult.success(recipes);
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.receiveTimeout) {
        return ApiResult.failure(
          ApiError(
            message:
                'Connection timed out. Please check your internet connection.',
            type: ApiErrorType.timeout,
          ),
        );
      }

      if (e.type == DioExceptionType.connectionError) {
        return ApiResult.failure(
          ApiError(
            message: 'No internet connection available.',
            type: ApiErrorType.network,
          ),
        );
      }

      return ApiResult.failure(
        ApiError(
          message: e.message ?? 'An error occurred while fetching posts.',
          type: ApiErrorType.server,
          statusCode: e.response?.statusCode,
        ),
      );
    } catch (e) {
      return ApiResult.failure(
        ApiError(message: 'Unexpected error: $e', type: ApiErrorType.unknown),
      );
    }
  }
}
