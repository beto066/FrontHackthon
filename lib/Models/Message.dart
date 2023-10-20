
class Message {
  int id;
  String text;
  String topic;

  Message({
    required this.id,
    required this.text,
    required this.topic,
  });

  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
      id: json['id'],
      text: json['text'],
      topic: json['topic'],
    );
  }
}