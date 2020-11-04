import 'package:covid/config/palette.dart';
import 'package:covid/pages/loading.dart';
import 'package:covid/screens/screens.dart';
import 'package:flutter/material.dart';

class BotttomNavScreen extends StatefulWidget {
  @override
  _BotttomNavScreenState createState() => _BotttomNavScreenState();
}

class _BotttomNavScreenState extends State<BotttomNavScreen> {

  final List _screens = [
    HomeScreen(),
    StatScreen(),
    StatScreenglobal(),
    Scaffold(),
    Scaffold(),
  ];

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        elevation: 0.0,
        items: [Icons.home , Icons.insert_chart , Icons.bubble_chart , Icons.info]
          .asMap()
          .map((key, value) => MapEntry(
            key,
            BottomNavigationBarItem(
              title: Text(''),
              icon: Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 6.0,
                  horizontal: 16.0,
                ),
                decoration: BoxDecoration(
                  color: _currentIndex == key 
                    ? Palette.primaryColor
                    : Colors.transparent,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Icon(value),
              ),
            ),
          ))
          .values
          .toList(),
      ),
    );
  }
}