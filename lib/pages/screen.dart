import 'package:flutter/material.dart';
import 'package:pcs3_sem5/pages/home_page.dart';
import 'package:pcs3_sem5/pages/profile_page.dart';

class Screen extends StatefulWidget {
  const Screen({super.key});

  @override
   ScreenState createState() => ScreenState();
}

class ScreenState extends State<Screen> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    HomePage(),
    ProfilePage()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[

          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Главная',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Избранное',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Профиль',
          ),

        ],
        currentIndex: _selectedIndex,
        selectedItemColor: const Color.fromARGB(255, 32, 100, 156),
        onTap: _onItemTapped,
      ),
    );
  }

}
// class _ScreenState extends State<Screen> {
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//
//     );
//   }
//
// }
