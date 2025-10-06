class StepDTO {
  final int number;
  final String step;

  StepDTO({required this.number, required this.step});

  factory StepDTO.fromJSON(Map<String, dynamic> json) {
    return StepDTO(number: json['number'], step: json['step']);
  }
}