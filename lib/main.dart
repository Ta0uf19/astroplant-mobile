import 'package:app/di/injector_provider.dart';
import 'package:app/routes.dart';
import 'package:app/stores/auth/login_store.dart';
import 'package:app/stores/auth/register_store.dart';
import 'package:app/ui/constants.dart';
import 'package:app/ui/screens/splash/welcome.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  /// Setup service locator (DI)
  setupInjection();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (_) => LoginStore()),
        Provider(create: (_) => RegisterStore()),
      ],
      child: MaterialApp(
        title: 'Astroplant',
        debugShowCheckedModeBanner: false,
        theme: themeData,
        initialRoute: '/',
        routes: Routes.routes,
        home: WelcomeScreen(),
      ),
    );
  }
}
