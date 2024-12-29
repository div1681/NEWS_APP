import 'package:flutter/material.dart';
import 'package:news_app/pages/home_page.dart';
import 'package:news_app/pages/saved.dart';
import 'package:news_app/pages/search_page.dart';

class Navigationbar extends StatefulWidget {
  const Navigationbar({super.key});

  @override
  State<Navigationbar> createState() => _NavigationbarState();
}

class _NavigationbarState extends State<Navigationbar> {
  int index1 = 0;
  void navigate(int index) {
    setState(() {
      index1 = index;
    });
  }

  final List<Widget> pages = [
    HomePage(),
    SearchPage(),
    Saved(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[index1],
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.amber[300],
          selectedItemColor: Colors.black,
          selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
          selectedFontSize: 22,
          unselectedFontSize: 18,
          unselectedLabelStyle: TextStyle(color: Colors.black),
          onTap: navigate,
          currentIndex: index1,
          items: [
            BottomNavigationBarItem(
                icon: Image.asset(
                  'lib/icons/house-blank.png',
                  width: 26,
                  height: 26,
                  color: Color(0xFF4E4E4E),
                ),
                label: "Home"),
            BottomNavigationBarItem(
                icon: Image.asset(
                  'lib/icons/search (1).png',
                  width: 26,
                  height: 26,
                  color: Color(0xFF4E4E4E),
                ),
                label: "Search"),
            BottomNavigationBarItem(
                icon: Image.asset(
                  'lib/icons/saved.png',
                  height: 26,
                  width: 26,
                  color: Color(0xFF4E4E4E),
                ),
                label: "Saved"),
          ]),
    );
  }
}
