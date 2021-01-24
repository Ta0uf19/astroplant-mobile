import 'package:app/components/CBottomNav.dart';
import 'package:app/components/CButton.dart';
import 'package:app/components/CCard.dart';
import 'package:app/components/CColumnText.dart';
import 'package:app/components/CTextInput.dart';
import 'package:app/components/CToggleSwitch.dart';
import 'package:app/constants.dart';
import 'package:app/screens/CCardImplementation.dart';
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

    ThemeData themeData = Theme.of(context);
    return Scaffold(
      backgroundColor: Colors.black,
      bottomNavigationBar: CBottomNav(
        items: [
          CBottomNavItem(CustomIcons.dashboard),
          CBottomNavItem(CustomIcons.commands),
          CBottomNavItem(CustomIcons.settings),
        ],
        iconStyle: IconStyle(size: 23),
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
                top: kDefaultPadding),
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
                  child: CTextInput(textHint: "Password", isPasswordType: true),
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
                    suffixIcon: Icon(Icons.ac_unit),
                    prefixIcon: Icon(Icons.access_time),
                    textStyle: themeData.textTheme.headline3.copyWith(color: COLOR_BLACK),
                    colorBackground: COLOR_GREEN,
                    borderRadius: BorderRadius.circular(28),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => CCardImplementation()),
                      );
                    },
                  ),
                ),
                CCard(
                  height:100 ,
                  body: Row(
                    children: [
                      Icon(Icons.account_balance_sharp,color:Colors.green,size: 50,),
                      SizedBox(width: 20,),
                      CColumnText(
                        title: "Temp",
                        subTitle: "Identifier : #127",
                        description: "Virtual temperature sensor",
                        colorText: Colors.white,
                        spaceBetween: 8,
                      ),
                    ],
                  ),
                  colorBackground: Color.fromRGBO(29, 29, 29, 1),
                  onPressed: () {
                    Scaffold.of(context).showSnackBar(SnackBar(
                      content: const Text('onPressed CCard'),
                    ));
                  },
                  suffixWidget: Padding(
                    padding: const EdgeInsets.only(right :8.0),
                    child: CToggleSwitch(
                        value: status,
                        width: 45,
                        height: 30,
                        toggleSize: 15,
                        onToggle: (val) {
                          setState(() {
                            status = val;
                          });
                        }),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CButton(
                    text: "Edit rules",
                    textStyle: themeData.textTheme.headline3.copyWith(color: COLOR_BLACK),
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
                    textStyle: themeData.textTheme.headline3.copyWith(color: COLOR_BLACK),
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
                    textStyle: themeData.textTheme.headline3.copyWith(color: COLOR_BLACK),
                    colorBackground: COLOR_GREEN,
                    height: 40,
                    borderRadius: BorderRadius.only(
                        bottomLeft: const Radius.circular(40.0),
                        topLeft: const Radius.circular(40.0)),
                    prefixIcon: Icon(Icons.autorenew, color: Colors.black),
                    onPressed: () {},
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
