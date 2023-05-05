class Measure {
  double amount;
  String unitLong;
  String unitShort;

  Measure({
    required this.amount,
    required this.unitLong,
    required this.unitShort,
  });

  factory Measure.fromJson(Map<String, dynamic> json) {
    return Measure(
      amount: json['amount'].toDouble(),
      unitLong: json['unitLong'],
      unitShort: json['unitShort'],
    );
  }
}