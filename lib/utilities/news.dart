import 'package:flutter/material.dart';
import 'package:news_app/pages/news_details.dart';

class NewsTile extends StatelessWidget {
  final List<dynamic> articles;

  NewsTile({required this.articles});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 24, left: 18, right: 18),
      child: GestureDetector(
        onTap: () {
          //  Navigator.push(context,
          //      MaterialPageRoute(builder: (context) => NewsDetails(news: news)));
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            gradient: LinearGradient(
              colors: [Colors.amber[400]!, Colors.amber[600]!],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 4,
                offset: Offset(2, 2),
              ),
            ],
          ),
          height: 250,
          width: 390,
          child: Center(
              child: Text(
            articles[1]['title'],
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
          )),
        ),
      ),
    );
  }
}
