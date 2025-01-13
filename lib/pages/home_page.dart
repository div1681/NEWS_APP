import 'package:flutter/material.dart';
import 'package:news_app/pages/profile_page.dart';
import 'package:news_app/utilities/my_button.dart';
import 'package:news_app/utilities/news.dart';

class HomePage extends StatelessWidget {
  final List<List<String>> news = [
    ['News 1', 'More about News 1'],
    ['News 2', 'More about News 2'],
    ['News 3', 'More about News 3'],
    ['News 4', 'More about News 4'],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber[400],
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
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0, top: 0),
            child: IconButton(
              icon: Icon(
                Icons.assignment_ind_outlined,
                size: 42,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ProfilePage()));
              },
            ),
          )
        ],
      ),
      body: Column(
        children: [
          Row(
            children: [
              MyButton(
                label: "Tech",
                api:
                    "https://newsapi.org/v2/top-headlines?category=technology&apiKey=2004aea50dd449c9b8ea63e87d203708",
                onPressed: () {},
              ),
              MyButton(
                  label: "Sports",
                  api:
                      "https://newsapi.org/v2/top-headlines?category=sports&apiKey=2004aea50dd449c9b8ea63e87d203708",
                  onPressed: () {}),
              MyButton(
                  label: "Cinema",
                  api:
                      "https://newsapi.org/v2/top-headlines?category=entertainment&apiKey=2004aea50dd449c9b8ea63e87d203708",
                  onPressed: () {}),
            ],
          ),
          // Expanded(
          //     child: ListView.builder(
          //         itemCount: 4,
          //         itemBuilder: (context, index) {
          //           return Padding(
          //             padding: EdgeInsets.only(
          //                 bottom: index == news.length - 1 ? 24.0 : 0),
          //             child: NewsTile(

          //             ),
          //           );
          //         })),
        ],
      ),
      backgroundColor: Colors.amber[50],
    );
  }
}
