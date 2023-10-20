class Notice {
  String text;
  String title;

  Notice({
    required this.text,
    required this.title,
  });

  factory Notice.fromJson(Map<String, dynamic> json) {
    return Notice(
      text: json['text'],
      title: json['title'],
    );
  }
}