import 'package:app/ui/screens/auth/login.dart';
import 'package:app/ui/screens/home.dart';
import 'package:app/ui/screens/splash/welcome.dart';
import 'package:flutter/cupertino.dart';

class Routes {

  // make class non-instantiable
  Routes._();

  //static variables
  static const String splash = '/splash';
  static const String login = '/login';
  static const String home = '/home';

  static final routes = <String, WidgetBuilder>{
    splash: (BuildContext context) => WelcomeScreen(),
    login: (BuildContext context) => LoginScreen(),
    home: (BuildContext context) => HomeScreen(),
  };

}