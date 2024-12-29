import 'package:flutter/material.dart';

class Saved extends StatelessWidget {
  const Saved({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber[400],
        leading: IconButton(
            icon: Container(
                padding: EdgeInsets.all(4),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.black,
                      width: 2,
                    )),
                child: Icon(Icons.arrow_back_outlined)),
            onPressed: () {
              Navigator.pop(context);
            }),
        centerTitle: true,
        title: Padding(
          padding: const EdgeInsets.only(top: 10, bottom: 15),
          child: Text(
            "NewsApp",
            style: TextStyle(
              fontSize: 42,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: Container(
        color: Colors.amber[50],
      ),
    );
  }
}
