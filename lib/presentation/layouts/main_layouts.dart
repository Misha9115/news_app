
import 'package:flutter/material.dart';
import 'package:news_paper/res/app_routes.dart';

class MainLayout extends StatefulWidget {
  int selectedIndex = 0;
  final String title;
  final Widget body;

  MainLayout({required this.selectedIndex, required this.title, required this.body, Key? key}) : super(key: key);

  @override
  _MainLayoutState createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: widget.body,
        appBar: AppBar(
          title: Text(widget.title),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: 'Favorite',
            ),
          ],
          currentIndex: widget.selectedIndex,
          selectedItemColor: Colors.amber[800],
          onTap: _onItemTapped,
        ));
  }

  void _onItemTapped(int index) {
    if (widget.selectedIndex != index) {
      if (index == 0) {
        Navigator.of(context).pushNamed(
          AppRoutes.homePage,
        );
      }
      if (index == 1) {
        Navigator.of(context).pushNamed(
          AppRoutes.favPage,
        );
      }
    }
    setState(() {
      widget.selectedIndex = index;
    });
  }
}
