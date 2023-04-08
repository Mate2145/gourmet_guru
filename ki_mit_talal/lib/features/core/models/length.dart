class Length {
  num number;
  String unit;

  Length({required this.number, required this.unit});

  factory Length.fromJson(Map<String, dynamic> json) {
    return Length(
      number: json['number'] ?? 0,
      unit: json['unit'],
    );
  }
}