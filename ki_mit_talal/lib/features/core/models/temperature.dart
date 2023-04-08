class Temperature {
  final double number;
  final String unit;

  Temperature({required this.number, required this.unit});

  factory Temperature.fromJson(Map<String, dynamic> json) {
    return Temperature(number: json['number'], unit: json['unit']);
  }
}