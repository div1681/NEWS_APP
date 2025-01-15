import 'package:flutter/material.dart';
import 'get_news.dart';

// ignore: must_be_immutable
class MyButton extends StatefulWidget {
  final String label;
  VoidCallback onPressed;

  MyButton({
    super.key,
    required this.label,
    required this.onPressed,
  });

  @override
  State<MyButton> createState() => _MyButtonState();
}

class _MyButtonState extends State<MyButton> {
  bool pressed = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 18, top: 20, right: 0),
      child: (OutlinedButton(
        style: OutlinedButton.styleFrom(
            minimumSize: Size(105, 45),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            side: BorderSide(
                color: pressed ? Colors.white : Colors.black, width: 2),
            backgroundColor: pressed ? Colors.black : Colors.amber[50]),
        child: Text(
          widget.label,
          style: TextStyle(
              color: pressed ? Colors.amber : Colors.black, fontSize: 20),
        ),
        onPressed: () {
          setState(() {
            pressed = !pressed;
          });
          widget.onPressed();
          //getNews(widget.api);
        },
      )),
    );
  }
}
