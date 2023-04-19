import 'package:flutter/foundation.dart';

import 'measures.dart';

class Ingredients {
  String? aisle;
  num amount;
  String? consistency;
  int? id;
  String? image;
  Measures? measures;
  List<dynamic>? meta;
  String name;
  String? original;
  String? originalName;
  String unit;

  Ingredients({
    this.aisle,
    required this.amount,
    this.consistency,
    this.id,
    this.image,
    this.measures,
    this.meta,
    required this.name,
    this.original,
    this.originalName,
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

  factory Ingredients.fromSnapshot(Map<String, dynamic> json) {
    return Ingredients(
      amount: json['amount'] ?? 0,
      name: json['name'] ?? "",
      unit: json['unit'] ?? "",
    );
  }


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['amount'] = this.amount;
    data['name'] = this.name;
    data['unit'] = this.unit;
    return data;
  }
}