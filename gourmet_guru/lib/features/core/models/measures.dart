import 'measure.dart';

class Measures {
  Measure metric;
  Measure us;

  Measures({
    required this.metric,
    required this.us,
  });

  factory Measures.fromJson(Map<String, dynamic> json) {
    return Measures(
      metric: Measure.fromJson(json['metric']),
      us: Measure.fromJson(json['us']),
    );
  }
}