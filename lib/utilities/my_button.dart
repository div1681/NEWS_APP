import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/utilities/article.dart';
import 'package:news_app/utilities/news.dart';

// ignore: must_be_immutable
class MyButton extends StatefulWidget {
  final String label;
  VoidCallback onPressed;
  final String api;

  MyButton({
    super.key,
    required this.label,
    required this.api,
    required this.onPressed,
  });

  @override
  State<MyButton> createState() => _MyButtonState();
}

class _MyButtonState extends State<MyButton> {
  bool pressed = false;
  List<Article> articles = [];

  Future getNews() async {
    final uri = Uri.parse(widget.api);
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      var body = response.body;
      var json = jsonDecode(body);
      for (var eacharticle in json["articles"]) {
        final article = Article(
            title: eacharticle['title'],
            urltoimage: eacharticle["urlToImage"],
            publishat: eacharticle['publishedAt'],
            content: eacharticle['content']);
        articles.add(article);
      }
      print(articles.length);
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => NewsTile(articles: articles)));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Failed to fetch news. Please try again.")),
      );
    }
  }

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
          getNews();
        },
      )),
    );
  }
}
