import 'package:flutter/material.dart';

class FeedbackButton extends StatelessWidget {
  final String text;
  final Function onPressed;
  final Color color;

  FeedbackButton({required this.text, required this.onPressed,  required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.0),
      child: ElevatedButton(
        onPressed: () {
          onPressed();
        },
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(color),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50.0), // Define a borda redonda
            ),
          ),
        ),
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.6,
          child:  Text(text, textAlign: TextAlign.center,),
        ),
      ),
    );
  }
}