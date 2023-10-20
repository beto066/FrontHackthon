import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:suport/Models/Message.dart';

class StatefulDetailsMessage extends StatefulWidget {
  final int idMessage;

  const StatefulDetailsMessage({super.key, required this.idMessage});

  @override
  StatefulDetailsScreenState createState() => StatefulDetailsScreenState();
}

class StatefulDetailsScreenState extends State<StatefulDetailsMessage> {
  Future<Message>? message;

  @override
  void initState() {
    print(widget.idMessage);
    super.initState();
    this.message = fetchData();
  }

  Future<Message> fetchData() async {
    final response = await http.get(
        Uri.parse('http://localhost:8080/message/${widget.idMessage}')
    );
    final Map<String, dynamic> data = json.decode(response.body);
    print(new Message.fromJson(data));
    return new Message.fromJson(data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Elogio'),
      ),
      body: FutureBuilder<Message>(
        future: this.message!,
        builder: (context, snapshot) {
          print(snapshot.data);
          if (snapshot.hasData) {
            var m = snapshot.data!;
            return Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                  ),
                  const Text(
                    'Mensagem: ',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                  ),
                  Text(
                    m.text,
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            );
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }
          return const CircularProgressIndicator();
        }
      ),
    );
  }
}