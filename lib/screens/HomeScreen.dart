import 'package:app/components/CButton.dart';
import 'package:app/components/CToggleSwitch.dart';
import 'package:app/components/CTextInput.dart';
import 'package:app/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

const COLOR_GREEN = Color.fromRGBO(53, 239, 127, 1.0);

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool status = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;

    return Scaffold(
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
                textColor: Colors.lightGreenAccent,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CTextInput(
                  textHint: "Password",
                  textColor: Colors.white10,
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
                }),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CButton(
                text: "Hi, Astroplant",
                colorText: Colors.black,
                colorBackground: COLOR_GREEN,
                borderRadius: BorderRadius.circular(28),
                onPressed: () {},
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CButton(
                text: "Edit rules",
                colorText: Colors.black,
                borderColor: Colors.black,
                colorBackground: Colors.transparent,
                borderRadius: BorderRadius.circular(28),
                onPressed: () {},
              ),
            ),
            Container(
              margin: EdgeInsets.only(right: 140),
              padding: const EdgeInsets.all(8.0),
              child: CButton(
                text: "Add",
                colorText: Colors.black,
                suffixIcon: Icon(Icons.add),
                borderRadius: BorderRadius.circular(8),
                onPressed: () {},
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 140),
              padding: const EdgeInsets.all(8.0),
              child: CButton(
                text: "Kit1 : AFC58",
                colorText: Colors.black,
                colorBackground: COLOR_GREEN,
                fontSize: 16,
                height: 40,
                borderRadius: BorderRadius.only(
                    bottomLeft: const Radius.circular(40.0),
                    topLeft: const Radius.circular(40.0)),
                prefixIcon: Icon(
                    Icons.autorenew,
                    color: Colors.black
                ),
                onPressed: () { },
              ),
            ),
          ],
        ),
      ),
    ],
    ),
    );
  }
}