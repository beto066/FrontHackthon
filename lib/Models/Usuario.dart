import 'package:suport/Models/Message.dart';

class Usuario {
  String nome;
  String email;
  String cpf;
  String rani;
  String senha;
  Message message;

  Usuario({
    required this.nome,
    required this.email,
    required this.cpf,
    required this.rani,
    required this.senha,
    required this.message,
  });

  factory Usuario.fromJson(Map<String, dynamic> json) {
    return Usuario(
      nome: json['nome'],
      email: json['email'],
      cpf: json['cpf'],
      rani: json['rani'],
      senha: json['senha'],
      message: Message.fromJson(json['message']),
    );
  }
}