
import 'package:app/components/CBottomNav.dart';
import 'package:app/components/CButton.dart';

import 'package:app/components/CToggleSwitch.dart';
import 'package:app/components/CTextInput.dart';
import 'package:app/constants.dart';
import 'package:app/screens/LoginScreen.dart';
import 'package:app/screens/RegistrationScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


import '../CustomIcons.dart';

const double defaultPaddingSides = 37.0;
const double defaultPaddingTop = 19.0;
const double defaultPaddingBottom = 27.0;

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  bool status = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
    final ThemeData themeData = Theme.of(context);

    final textDescription = "Educational citizen science project with the European Space Agency to engage a new generation of space farmers, collect data and ideas for agriculture on Mars";
    final appName = "ASTROPLANT";
    final logIn = "I already have an account";
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        elevation: 0,
      ),
      body: Container(
        width: size.width,
        padding: EdgeInsets.only(
            left: DEFAULT_PADDING_SIDES,
            right: DEFAULT_PADDING_SIDES,
            top: DEFAULT_PADDING,
            bottom: DEFAULT_PADDING
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                      width: 100,
                      height: 100,
                      margin: EdgeInsets.only(bottom: DEFAULT_PADDING),
                      child: Image.asset('assets/icons/logo.png',)
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: DEFAULT_PADDING*2),
                    child: Text(
                        appName,
                        style: themeData.textTheme.headline1,
                    ),
                  ),
                  Text(
                    textDescription,
                    textAlign: TextAlign.center,
                    style: themeData.textTheme.bodyText1,
                  ),
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end ,
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: DEFAULT_PADDING),
                  child: CButton(
                    text: "Hi, Astroplant",
                    colorText: Colors.black,
                    colorBackground: COLOR_GREEN,
                    fontSize: 18,
                    height: 56,
                    borderRadius: BorderRadius.circular(28),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => RegistrationScreen()),
                      );
                    },
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginScreen()),
                    );
                    },
                  child: Text(
                    logIn,
                    style: themeData.textTheme.headline3.copyWith(color: COLOR_GREY_MEDIUM),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}