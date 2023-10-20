import 'package:suport/Models/Notice.dart';

class Dicionary {
  String name;
  Notice notice;

  Dicionary({
    required this.name,
    required this.notice,
  });

  factory Dicionary.fromJson(Map<String, dynamic> json) {
    return Dicionary(
      name: json['name'],
      notice: Notice.fromJson(json['notice']),
    );
  }
}