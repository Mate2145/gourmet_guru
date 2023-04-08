class IngredientinInstruction {
  final int id;
  final String image;
  final String name;

  IngredientinInstruction({required this.id, required this.image, required this.name});

  factory IngredientinInstruction.fromJson(Map<String, dynamic> json) {
    return IngredientinInstruction(id: json['id'], image: json['image'], name: json['name']);
  }
}