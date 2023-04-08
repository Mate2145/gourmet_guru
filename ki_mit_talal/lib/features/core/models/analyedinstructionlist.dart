import 'analyzedInstructions.dart';

class AnalyzedInstructionsList {
  final List<AnalyzedInstructions> instructions;

  AnalyzedInstructionsList({required this.instructions});

  factory AnalyzedInstructionsList.fromJson(List<dynamic> json) {
    List<AnalyzedInstructions> instructionsList = [];

    for (var i = 0; i < json.length; i++) {
      instructionsList.add(AnalyzedInstructions.fromJson(json[i]));
    }

    return AnalyzedInstructionsList(instructions: instructionsList);
  }
}
