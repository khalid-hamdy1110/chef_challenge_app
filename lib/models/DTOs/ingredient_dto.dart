class IngredientDTO {
  final String name;
  final String original;

  IngredientDTO({required this.name, required this.original});

  factory IngredientDTO.fromJSON(Map<String, dynamic> json) {
    return IngredientDTO(name: json['name'], original: json['original']);
  }
}
