import 'package:ki_mit_talal/features/core/models/temperature.dart';

class Equipment {
   int? id;
   String? image;
   String name;
   Temperature? temperature;

  Equipment({this.id,this.image, required this.name,this.temperature});

  factory Equipment.fromJson(Map<String, dynamic> json) {
    final Temperature? temperature = json['temperature'] != null ? Temperature.fromJson(json['temperature']) : null;
    return Equipment(id: json['id'], image: json['image'], name: json['name'], temperature: temperature);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['name'] = this.name;
    return data;
  }

}