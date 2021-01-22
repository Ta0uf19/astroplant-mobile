import 'package:app/components/CBottomNav.dart';
import 'package:app/components/CCard.dart';
import 'package:app/components/CColumnText.dart';
import 'package:app/components/CToggleSwitch.dart';
import 'package:app/constants.dart';
import 'package:app/screens/EditConfigurationScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../CustomIcons.dart';


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
        onPressed: () {  },
        child: Icon(Icons.add),
      ) ,
      appBar: AppBar(
        elevation: 0,
        title: Text("Configurations",style: themeData.textTheme.headline2 ,),
      ),
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
                    Image.asset('assets/icons/configuration.png',),
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
                onPressed: () {Navigator.push(
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
