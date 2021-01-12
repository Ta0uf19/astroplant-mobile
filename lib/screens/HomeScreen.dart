import 'package:app/components/CBottomNav.dart';
import 'package:app/components/CToggleSwitch.dart';
import 'package:app/components/CTextInput.dart';
import 'package:app/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../CustomIcons.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool status = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.black,
      bottomNavigationBar: CBottomNav(
        items: [
          CBottomNavItem(CustomIcons.dashboard),
          CBottomNavItem(CustomIcons.commands),
          CBottomNavItem(CustomIcons.settings),
        ],
        iconStyle: IconStyle(
            size: 23
        ),
      ),
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: SvgPicture.asset('assets/icons/menu.svg'),
          onPressed: () {},
        ),
      ),
      body: Column(
        children: <Widget>[
          //HeaderWithSearch(size: size),
          Container(
            width: size.width,
            padding: EdgeInsets.only(
              left: kDefaultPadding,
              right: kDefaultPadding,
              top: kDefaultPadding
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CTextInput(
                      textHint: "Email",
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CTextInput(
                    textHint: "Password",
                    isPasswordType: true
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CTextInput(
                    icon: Icon(Icons.search, color: Colors.lightGreenAccent),
                  ),
                ),
                CToggleSwitch(
                    value: status,
                    onToggle: (val) {
                      setState(() {
                        status = val;
                      });
                }),
                CToggleSwitch(
                    value: status,
                    width: 35,
                    height: 20,
                    toggleSize: 15,
                    onToggle: (val) {
                  setState(() {
                    status = val;
                  });
                })
              ],
            ),
          ),
        ],
      ),
    );
  }
}