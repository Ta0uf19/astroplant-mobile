import 'package:app/screens/HomeScreen.dart';
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
        primaryColor: Colors.black,
        //textTheme: Theme.of(context).textTheme.apply(bodyColor: kTextColor),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: 'Larsseit'
      ),
      initialRoute: '/',
      home: HomeScreen(),
    );
  }


}