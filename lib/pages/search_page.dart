import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.amber[50],
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
          actions: [
            Padding(
              padding: const EdgeInsets.only(top: 12, right: 18),
              child: Icon(
                Icons.search,
                size: 36,
              ),
            ),
          ],
        ),
        body: Center(
          child: Column(children: [
            Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Container(
                  // ignore: sort_child_properties_last
                  child: TextField(
                    style: TextStyle(fontSize: 24, color: Colors.black),
                    textAlignVertical: TextAlignVertical.center,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(left: 25),
                        hintText: "Search here...",
                        hintStyle:
                            TextStyle(fontSize: 24, color: Colors.black54),
                        border: InputBorder.none,
                        suffixIcon: IconButton(
                            onPressed: () {},
                            icon: Image.asset(
                              'lib/icons/next.png',
                              height: 40,
                              width: 40,
                            ))),
                  ),
                  height: 60,
                  width: 390,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(
                      color: Colors.black45,
                      width: 2.0,
                    ),
                  ),
                ))
          ]),
        ));
  }
}
