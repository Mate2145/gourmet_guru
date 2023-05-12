class IngredientinInstruction {
  int? id;
  String? image;
  String name;

  IngredientinInstruction({this.id,this.image,required this.name});

  factory IngredientinInstruction.fromJson(Map<String, dynamic> json) {
    return IngredientinInstruction(id: json['id'], image: json['image'], name: json['name']);
  }


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['name'] = this.name;
    return data;
  }

}