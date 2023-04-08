import 'package:ki_mit_talal/features/core/models/steps.dart';
import 'dart:convert';

class AnalyzedInstructions {
  String name;
  final List<Steps> steps;

  AnalyzedInstructions({required this.name, required this.steps});

  factory AnalyzedInstructions.fromJson(Map<String,dynamic> jsonparam) {
    try {
      //final List<dynamic> jsonData = jsonparam;
      final List<Steps> steps = jsonparam['steps']
          .map<Steps>((step) => Steps.fromJson(step))
          .toList();
      return AnalyzedInstructions(name: jsonparam['name'], steps: steps);
    } catch (e) {
      print('Error parsing JSON: $e');
      rethrow;
    }
  }
}
