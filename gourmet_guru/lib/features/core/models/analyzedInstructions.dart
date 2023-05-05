import 'package:gourmet_guru/features/core/models/steps.dart';
import 'dart:convert';

class AnalyzedInstructions {
  String name;
  final List<Steps> steps;

  AnalyzedInstructions({required this.name, required this.steps});

  factory AnalyzedInstructions.fromJson(Map<String, dynamic> jsonparam) {
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

  factory AnalyzedInstructions.fromSnapshot(Map<String, dynamic> jsonparam) {
    try {
      //final List<dynamic> jsonData = jsonparam;
      final List<Steps> steps = jsonparam['steps']
          .map<Steps>((step) => Steps.fromSnapshot(step))
          .toList();
      return AnalyzedInstructions(name: jsonparam['name'], steps: steps);
    } catch (e) {
      print('Error parsing JSON: $e');
      rethrow;
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['name'] = this.name;
    data['steps'] = this.steps.map((step) => step.toJson()).toList();
    return data;
  }
}
