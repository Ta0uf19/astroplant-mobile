
import 'package:app/di/injector_provider.dart';
import 'package:app/routes.dart';
import 'package:app/ui/constants.dart';
import 'package:app/ui/screens/splash/welcome.dart';
import 'package:flutter/material.dart';


void main() {
  /// Setup service locator (DI)
  setupInjection();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Astroplant',
      debugShowCheckedModeBanner: false,
      theme: themeData,
      initialRoute: '/',
      routes: Routes.routes,
      home: WelcomeScreen(),
    );
  }


}