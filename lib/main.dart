import 'package:app/util/constants.dart';
import 'package:app/screens/splash/welcome.dart';
import 'package:flutter/material.dart';



void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Astroplant',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: CColors.COLOR_BLACK,
        backgroundColor: CColors.COLOR_BLACK,
        accentColor: CColors.COLOR_GREEN,
        textTheme: TEXT_THEME_DEFAULT,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: 'Larsseit'
      ),
      initialRoute: '/',
      home: WelcomeScreen(),
    );
  }


}