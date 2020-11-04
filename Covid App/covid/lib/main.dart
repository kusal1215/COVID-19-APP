import 'package:covid/pages/pages.dart';
import 'package:covid/screens/screens.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
        visualDensity: VisualDensity.adaptivePlatformDensity
      ),
      // initialRoute: '/home',
      routes:{
        '/loading': (context) => Loading(),
        '/home': (context) =>Home(),
        '/location':(context) =>ChooseLocation(),
        '/statscreen':(context) =>StatScreen(),
      } ,
      home: BotttomNavScreen(),
    );
  }
}