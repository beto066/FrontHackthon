import 'package:flutter/material.dart';
import 'package:suport/Components/FeedbackButton.dart';

class StatelessHome extends StatelessWidget {
  const StatelessHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Aplicativo de suporte',
          textAlign: TextAlign.center,
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const CircleAvatar(
              radius: 80.0,
              backgroundColor: Colors.black12,
              child: Icon(Icons.person, color: Colors.grey, size:100.0),
            ),

            SizedBox(height: MediaQuery.of(context).size.height * 0.05,),
            const Text(
              "Escolha o portal de requisições",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.05,),
            FeedbackButton(
              color: Color.fromRGBO(255, 113, 82, 1.0),
              text: 'Denúncias',
              onPressed: () {
                Navigator.of(context).pushNamed('Messages', arguments: 'Denuncia');
              },
            ),
            FeedbackButton(
              color: Colors.blue,
              text: 'Reclamações',
              onPressed: () {
                print('object');
                Navigator.of(context).pushNamed('Messages', arguments: 'Reclamação');
              },
            ),
            FeedbackButton(
              color: Colors.lightGreen,
              text: 'Elogios',
              onPressed: () {
                Navigator.of(context).pushNamed('Messages', arguments: 'Elogio');
              },
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.2,),
          ],
        ),
      ),
    );
  }
}
