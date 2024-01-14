class CookingSteps {
  final int stepNumber;
  final String ingredientName;
  final String ingredientDescription;
  final String stepDescription;

  CookingSteps({
    required this.stepNumber,
    required this.ingredientName,
    required this.ingredientDescription,
    required this.stepDescription,
  });

  factory CookingSteps.fromJson(dynamic json) {
    return CookingSteps(
      stepNumber: json['stepNumber'] as int,
      ingredientName: json['ingredientName'] as String,
      ingredientDescription: json['ingredientDescription'] as String,
      stepDescription: json['stepDescription'] as String,
    );
  }

  static List<CookingSteps> stepsFromSnapshot(List snapshot) {
    return snapshot.map((data) {
      return CookingSteps.fromJson(data);
    }).toList();
  }

  @override
  String toString() {
    return 'CookingStep {stepNumber: $stepNumber, ingredientName: $ingredientName, ingredientDescription: $ingredientDescription, stepDescription: $stepDescription}';
  }
}