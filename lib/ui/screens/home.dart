import 'package:app/components/cbottom_nav.dart';
import 'package:app/custom_icons.dart';
import 'package:app/screens/command/command.dart';
import 'package:app/screens/configuration/configuration.dart';
import 'package:app/screens/dashboard/dashboard.dart';
import 'package:app/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {

  HomeScreen({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HomeState();
}

class _HomeState extends State<HomeScreen> {

  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[DashboardScreen(), CommandScreen(), ConfigurationScreen()];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CColors.black,
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: CBottomNav(
        index: _selectedIndex, // this will be set when a new tab is tapped
        items: [
          CBottomNavItem(CustomIcons.dashboard),
          CBottomNavItem(CustomIcons.commands),
          CBottomNavItem(CustomIcons.settings),
        ],
        onTap: _onItemTapped,
        iconStyle: IconStyle(size: 23),
      ),
    );
  }
}