import 'package:app/components/cbottom_nav.dart';
import 'package:app/components/ccard.dart';
import 'package:app/components/ccolumn_text.dart';
import 'package:app/components/cheader.dart';
import 'package:app/components/ctoggle_switch.dart';
import 'package:app/constants.dart';
import 'package:app/screens/configuration/edit_configuration.dart';
import 'package:app/screens/dashboard/dashboard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../custom_icons.dart';


class ConfigurationScreen extends StatefulWidget {
  @override
  _ConfigurationScreenState createState() => _ConfigurationScreenState();
}

class _ConfigurationScreenState extends State<ConfigurationScreen> {
  bool status = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    ThemeData themeData = Theme.of(context);
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: CHeader.buildAppBarWithCButton(context: context,title: "Configuration"),

      bottomNavigationBar: CBottomNav(
        items: [
          CBottomNavItem(CustomIcons.dashboard),
          CBottomNavItem(CustomIcons.commands),
          CBottomNavItem(CustomIcons.settings),
        ],
        iconStyle: IconStyle(size: 23),
        index: 2,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ToggleWidgetScreen()),
          );
        },
        child: Icon(Icons.add),
      ) ,
      body: Container(
        width: size.width,
        padding: EdgeInsets.only(
            left: DEFAULT_PADDING_SIDES_SMALL,
            right: DEFAULT_PADDING_SIDES_SMALL,
            top: DEFAULT_PADDING_SMALL,
        ),
        child:  ListView.builder(
          itemCount: 4,
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.only(bottom: DEFAULT_PADDING_SMALL),
              child: CCard(
                borderRadius: 7,
                height: 100,
                body: Row(
                  children: [
                    SvgPicture.asset('assets/icons/configuration.svg',),
                    SizedBox(width: 20,),
                    CColumnText(
                      title: "Configuration",
                      subTitle: "Identifier : #127",
                      description: "Never used",
                      colorText: Colors.white,
                    ),
                  ],
                ),
                colorBackground: Color.fromRGBO(29, 29, 29, 1),
                onPressed: () {
                  Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => EditConfigurationScreen()),
                );},
                suffixWidget: Container(
                  padding: EdgeInsets.all(DEFAULT_PADDING_SMALL),
                  alignment: Alignment.center,
                  child: CToggleSwitch(
                      value: status,
                      width: 40,
                      height: 25,
                      toggleSize: 15,
                      onToggle: (val) {
                        setState(() {
                          status = val;
                        });
                      }),

                  ),
                ),
            );
          },
        ),
      ),
    );
  }

}
