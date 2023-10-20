import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:suport/Models/Message.dart';

class StatefulMessages extends StatefulWidget {
  final String topic;

  const StatefulMessages(this.topic, {super.key});

  @override
  MessagesScreenState createState() => MessagesScreenState();
}

class MessagesScreenState extends State<StatefulMessages> {
  Future<List<Message>>? data;

  @override
  void initState() {
    super.initState();
    data = fetchData();
  }

  Future<List<Message>> fetchData() async {
    List<Message> dataList = [];
    final response = await http.get(Uri.parse('http://localhost:8080/message/topic/${widget.topic}/unatribbuited'));
    if (response.statusCode == 200) {
      final List data = json.decode(response.body);
      data.forEach((element) {
        dataList.add(new Message.fromJson(element));
      });
    }
    return dataList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Dados'),
      ),
      body: FutureBuilder<List<Message>>(
        future: this.data,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var messages = snapshot.data!;
            return ListView.builder(
              itemCount: messages.length,
              prototypeItem: const ListTile(
                title: Text('Depositos'),
              ),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed('DetailsMessage', arguments: messages[index].id);
                  },
                  child: ListTile(
                    title: Text(
                      messages[index].text,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                      overflow: TextOverflow.ellipsis, // Trunca o texto se for muito longo
                      maxLines: 1,
                    ),
                    subtitle: Divider(),
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }
          return const CircularProgressIndicator();
        },
      ),
    );
  }
}