import 'package:suport/Models/Message.dart';

class Suport {
  late String name;
  late String email;
  String? senha;
  List<Message>? messages;
  List<Message>? message;

  Suport({
    required this.name,
    required this.email,
    required this.senha,
    required this.messages,
    required this.message,
  });

  factory Suport.fromJson(Map<String, dynamic> json) {
    var messageList = json['messages'] as List;
    List<Message> messages = messageList.map((messageJson) => Message.fromJson(messageJson)).toList();

    var messageList2 = json['message'] as List;
    List<Message> message = messageList2.map((messageJson) => Message.fromJson(messageJson)).toList();

    return Suport(
      name: json['name'],
      email: json['email'],
      senha: json['senha'],
      messages: messages,
      message: message,
    );
  }
}