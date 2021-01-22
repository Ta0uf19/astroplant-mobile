import 'package:app/components/CBottomNav.dart';
import 'package:app/components/CButton.dart';
import 'package:app/components/CCard.dart';
import 'package:app/components/CColumnText.dart';
import 'package:app/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../CustomIcons.dart';


class EditRulesScreen extends StatefulWidget {
  @override
  _EditRulesScreenState createState() => _EditRulesScreenState();
}

class _EditRulesScreenState extends State<EditRulesScreen> {
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
      appBar: AppBar(
        elevation: 0,
        title: Text("Config1 Rules"),

      ),
      body: ListView.builder(
          itemCount: 1,
          itemBuilder: (BuildContext context,int block){
            return Container(
              width: size.width,
              padding: EdgeInsets.only(
                left: DEFAULT_PADDING_SIDES_SMALL,
                right: DEFAULT_PADDING_SIDES_SMALL,
                top: DEFAULT_PADDING_SMALL,
              ),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: DEFAULT_PADDING_SMALL),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Inputs",
                          style: themeData.textTheme.headline3,
                        ),
                        CButton(
                          width: 55,
                          height: 25,
                          padding: EdgeInsets.all(5),
                          text: "Add",
                          textStyle : themeData.textTheme.headline5.copyWith(color: COLOR_BLACK),
                          colorText: COLOR_BLACK,
                          colorBackground: COLOR_GREEN,
                          suffixIcon: Icon(Icons.add,size: 16,),
                          borderRadius: BorderRadius.circular(8),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    itemCount: 2,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.only(bottom: DEFAULT_PADDING_SMALL),
                        child: CCard(
                          height: 100,
                          borderRadius: 7,
                          body: Row(
                            children: [
                              CColumnText(
                                title: "Temp",
                                subTitle: "Identifier : #127",
                                description: "Virtual temperature sensor",
                                colorText: Colors.white,
                              ),
                            ],
                          ),
                          colorBackground: Color.fromRGBO(29, 29, 29, 1),
                          onPressed: () {},
                          suffixWidget: Container(
                              alignment: Alignment.topRight,
                              child: IconButton(
                                icon: Icon(Icons.zoom_out_map, color : COLOR_WHITE),
                                onPressed: () {  },

                              )

                          ),
                        ),
                      );
                    },
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: DEFAULT_PADDING_SMALL),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Outputs",
                          style: themeData.textTheme.headline3,
                        ),
                        CButton(
                          width: 55,
                          height: 25,
                          padding: EdgeInsets.all(5),
                          text: "Add",
                          textStyle : themeData.textTheme.headline5.copyWith(color: COLOR_BLACK),
                          colorText: COLOR_BLACK,
                          colorBackground: COLOR_GREEN,
                          suffixIcon: Icon(Icons.add,size: 16,),
                          borderRadius: BorderRadius.circular(8),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    itemCount: 1,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.only(bottom: DEFAULT_PADDING_SMALL),
                        child: CCard(
                          height: 100,
                          borderRadius: 7,
                          body: Row(
                            children: [
                              CColumnText(
                                title: "Temp",
                                subTitle: "Identifier : #127",
                                description: "Virtual temperature sensor",
                                colorText: Colors.white,
                              ),
                            ],
                          ),
                          colorBackground: Color.fromRGBO(29, 29, 29, 1),
                          onPressed: () {},
                          suffixWidget: Container(
                              alignment: Alignment.topRight,
                              child: IconButton(
                                icon: Icon(Icons.zoom_out_map, color : COLOR_WHITE),
                                onPressed: () {  },

                              )

                          ),
                        ),
                      );
                    },
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: DEFAULT_PADDING_SMALL),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Rules",
                          style: themeData.textTheme.headline3,
                        ),
                        CButton(
                          width: 55,
                          height: 25,
                          padding: EdgeInsets.all(5),
                          text: "Add",
                          textStyle : themeData.textTheme.headline5.copyWith(color: COLOR_BLACK),
                          colorText: COLOR_BLACK,
                          colorBackground: COLOR_GREEN,
                          suffixIcon: Icon(Icons.add,size: 16,),
                          borderRadius: BorderRadius.circular(8),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.only(bottom: DEFAULT_PADDING_SMALL),
                        child: CCard(
                          borderRadius: 7,
                          height: 100,
                          body: Row(
                            children: [
                              CColumnText(
                                title: "Temp",
                                subTitle: "Identifier : #127",
                                description: "Virtual temperature sensor",
                                colorText: Colors.white,
                              ),
                            ],
                          ),
                          colorBackground: Color.fromRGBO(29, 29, 29, 1),
                          onPressed: () {},
                          suffixWidget: Container(
                              alignment: Alignment.topRight,
                              child: IconButton(
                                icon: Icon(Icons.zoom_out_map, color : COLOR_WHITE),
                                onPressed: () {  },

                              )

                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            );
          }
      ),
    );
  }
}
