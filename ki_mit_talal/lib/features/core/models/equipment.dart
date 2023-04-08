import 'package:ki_mit_talal/features/core/models/temperature.dart';

class Equipment {
  final int id;
  final String image;
  final String name;
  final Temperature? temperature;

  Equipment({required this.id, required this.image, required this.name, this.temperature});

  factory Equipment.fromJson(Map<String, dynamic> json) {
    final Temperature? temperature = json['temperature'] != null ? Temperature.fromJson(json['temperature']) : null;
    return Equipment(id: json['id'], image: json['image'], name: json['name'], temperature: temperature);
  }
}