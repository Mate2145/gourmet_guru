import 'equipment.dart';
import 'instructioningredient.dart';
import 'length.dart';

class Steps {
  int number;
  String step;
  Length? length;
  List<Equipment>? equipment;
  List<IngredientinInstruction>? ingredients;

  Steps({required this.number, required this.step,this.length,this.equipment,this.ingredients});

  factory Steps.fromJson(Map<String, dynamic> json) {
    final List<Equipment> equipment = json['equipment'] != null
        ? List.from(json['equipment'])
            .map<Equipment>((e) => Equipment.fromJson(e))
            .toList()
        : [];
    final List<IngredientinInstruction> ingredients = json['ingredients'] != null
        ? List.from(json['ingredients'])
            .map<IngredientinInstruction>((i) => IngredientinInstruction.fromJson(i))
            .toList()
        : [];
    final Length? length =
        json['length'] != null ? Length.fromJson(json['length']) : null;


    return Steps(
      number: json['number'] ?? 0,
      step: json['step'] ?? "",
      length: json['length'] != null ? Length.fromJson(json['length']) : null,
      equipment: json['equipment'] != null ? List.from(json['equipment']).map<Equipment>((e) => Equipment.fromJson(e)).toList(): [],
      ingredients: json['ingredients'] != null ? List.from(json['ingredients']).map<IngredientinInstruction>((i) => IngredientinInstruction.fromJson(i)).toList(): []
    );
  }
}


