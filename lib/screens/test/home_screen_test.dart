import 'package:app/components/cbottom_nav.dart';
import 'package:app/components/cbutton.dart';
import 'package:app/components/ccard.dart';
import 'package:app/components/ccolumn_text.dart';
import 'package:app/components/cheader.dart';
import 'package:app/components/ctext_input.dart';
import 'package:app/components/ctoggle_switch.dart';
import 'package:app/util/constants.dart';
import 'package:app/screens/test/ccard_implementation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:app/custom_icons.dart';


class HomeScreenTest extends StatefulWidget {
  @override
  _HomeScreenTestState createState() => _HomeScreenTestState();
}

class _HomeScreenTestState extends State<HomeScreenTest> {
  bool status = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    ThemeData themeData = Theme.of(context);

  return Scaffold(      backgroundColor: Colors.black,
      appBar: CHeader.buildAppBarWithCButton(context: context, title: "Configuration"),

      bottomNavigationBar: CBottomNav(
        items: [
          CBottomNavItem(CustomIcons.dashboard),
          CBottomNavItem(CustomIcons.commands),
          CBottomNavItem(CustomIcons.settings),
        ],
        iconStyle: IconStyle(size: 23),
      ),

      /*AppBar(
        elevation: 0,
        leading: IconButton(
          icon: SvgPicture.asset('assets/icons/menu.svg'),
          onPressed: () {},
        ),
      ),*/
      //appbar = HeaderMenu
      body: Column(
        children: <Widget>[
          //HeaderWithSearch(size: size),
          Container(
            width: size.width,
            padding: EdgeInsets.only(
                left: CPadding.defaultSidesSmall,
                right: CPadding.defaultSidesSmall,
                top: CPadding.defaultSidesSmall),
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
                    textStyle: themeData.textTheme.headline3.copyWith(color: CColors.black),
                    colorBackground: CColors.primary,
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
                    textStyle: themeData.textTheme.headline3.copyWith(color: CColors.black),
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
                    textStyle: themeData.textTheme.headline3.copyWith(color: CColors.black),
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
                    textStyle: themeData.textTheme.headline3.copyWith(color: CColors.black),
                    colorBackground: CColors.primary,
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
