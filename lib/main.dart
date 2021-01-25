import 'package:app/constants.dart';
import 'package:app/screens/home_screen.dart';
import 'file:///C:/Users/Taoufik/Desktop/Android%20TP/Flutter/app/lib/screens/dashboard/dashboard.dart';
import 'package:app/screens/welcome_screen.dart';
import 'package:flutter/material.dart';



void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hello',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: COLOR_BLACK,
        backgroundColor: COLOR_BLACK,
        accentColor: COLOR_GREEN,
        textTheme: TEXT_THEME_DEFAULT,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: 'Larsseit'
      ),
      initialRoute: '/',
      home: WelcomeScreen(),
    );
  }


}