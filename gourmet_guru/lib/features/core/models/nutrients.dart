class Nutrients {
  double calories;
  double carbohydrates;
  double fat;
  double protein;

  Nutrients({
    required this.calories,
    required this.carbohydrates,
    required this.fat,
    required this.protein,
  });

  factory Nutrients.fromJson(Map<String, dynamic> json) {
    return Nutrients(
      calories: json['calories'],
      carbohydrates: json['carbohydrates'],
      fat: json['fat'],
      protein: json['protein'],
    );
  }
}