import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MyButton extends StatefulWidget {
  final String label;
  VoidCallback onPressed;
  final bool isSelected;

  MyButton({
    super.key,
    required this.label,
    required this.onPressed,
    required this.isSelected,
  });

  @override
  State<MyButton> createState() => _MyButtonState();
}

class _MyButtonState extends State<MyButton> {
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
                color: widget.isSelected ? Colors.white : Colors.black,
                width: 2),
            backgroundColor:
                widget.isSelected ? Colors.black : Colors.amber[50]),
        child: Text(
          widget.label,
          style: TextStyle(
              color: widget.isSelected ? Colors.amber : Colors.black,
              fontSize: 20),
        ),
        onPressed: () {
          widget.onPressed();
        },
      )),
    );
  }
}
