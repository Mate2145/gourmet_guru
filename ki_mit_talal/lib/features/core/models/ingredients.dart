import 'package:flutter/foundation.dart';

import 'measures.dart';

class Ingredients {
  String aisle;
  num amount;
  String consistency;
  int id;
  String image;
  Measures measures;
  List<dynamic> meta;
  String name;
  String original;
  String originalName;
  String unit;

  Ingredients({
    required this.aisle,
    required this.amount,
    required this.consistency,
    required this.id,
    required this.image,
    required this.measures,
    required this.meta,
    required this.name,
    required this.original,
    required this.originalName,
    required this.unit,
  });

  factory Ingredients.fromJson(Map<String, dynamic> json) {
    return Ingredients(
      aisle: json['aisle'] ?? "",
      amount: json['amount'] ?? 0,
      consistency: json['consitency'] ?? "",
      id: json['id'] ?? 0,
      image: json['image'],
      measures: Measures.fromJson(json['measures'] ?? []),
      meta: json['meta'] ?? [],
      name: json['name'] ?? "",
      original: json['original'] ?? "",
      originalName: json['originalName'] ?? "",
      unit: json['unit'] ?? "",
    );
  }
}