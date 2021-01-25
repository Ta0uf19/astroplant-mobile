import 'package:app/components/CBottomNav.dart';
import 'package:app/components/CButton.dart';
import 'package:app/components/CCard.dart';
import 'package:app/components/CColumnText.dart';
import 'package:app/components/CHeader.dart';
import 'package:app/constants.dart';
import 'package:app/screens/WelcomeScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

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
      appBar: CHeader.buildAppBarWithCButton(context: context, title: "Config1 Rules"),
      body: ListView.builder(
          physics: ClampingScrollPhysics(),
          itemCount: 1,
          itemBuilder: (BuildContext context, int block) {
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
                          textStyle: themeData.textTheme.headline5
                              .copyWith(color: COLOR_BLACK),
                          colorBackground: COLOR_GREEN,
                          suffixIcon: Icon(
                            Icons.add,
                            size: 16,
                          ),
                          borderRadius: BorderRadius.circular(8),
                          onPressed: () {
                            showBottomSheetSelectPeripherals(title: "List of inputs");
                          },
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
                          suffixWidget:  GestureDetector(
                            child: Container(
                                alignment: Alignment.topRight,
                                margin: EdgeInsets.only(top: 10,right: 5),
                                child: SvgPicture.asset(
                                  "assets/icons/menu.svg",
                                  width: 20,
                                  height: 20,
                                ),
                            ),
                            onTap: () {
                              print("onTap called.");
                            },
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
                          textStyle: themeData.textTheme.headline5
                              .copyWith(color: COLOR_BLACK),
                          colorBackground: COLOR_GREEN,
                          suffixIcon: Icon(
                            Icons.add,
                            size: 16,
                          ),
                          borderRadius: BorderRadius.circular(8),
                          onPressed: () {
                            showBottomSheetSelectPeripherals(title: "List of outputs");
                          },
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
                          suffixWidget:  GestureDetector(
                            child: Container(
                              alignment: Alignment.topRight,
                              margin: EdgeInsets.only(top: 10,right: 5),
                              child: SvgPicture.asset(
                                "assets/icons/menu.svg",
                                width: 20,
                                height: 20,
                              ),
                            ),
                            onTap: () {
                              print("onTap called.");
                            },
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
                          textStyle: themeData.textTheme.headline5
                              .copyWith(color: COLOR_BLACK),
                          colorBackground: COLOR_GREEN,
                          suffixIcon: Icon(
                            Icons.add,
                            size: 16,
                          ),
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
                          suffixWidget:  GestureDetector(
                            child: Container(
                              alignment: Alignment.topRight,
                              margin: EdgeInsets.only(top: 10,right: 5),
                              child: SvgPicture.asset(
                                "assets/icons/menu.svg",
                                width: 20,
                                height: 20,
                              ),
                            ),
                            onTap: () {
                              print("onTap called.");
                            },
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            );
          }),
    );
  }

  void showBottomSheetSelectPeripherals({title = "List of peripherals"}) {
    Size size = MediaQuery.of(context).size;
    ThemeData themeData = Theme.of(context);
    showBarModalBottomSheet(
      bounce: true,
      context: context,
      builder: (context) => SingleChildScrollView(
          controller: ModalScrollController.of(context),
          child: Container(
            width: size.width,
            padding: EdgeInsets.only(
                left: DEFAULT_PADDING_SIDES_SMALL,
                right: DEFAULT_PADDING_SIDES_SMALL,
                top: DEFAULT_PADDING,
                bottom: DEFAULT_PADDING),
            child: Column(
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.only(bottom: DEFAULT_PADDING_SMALL),
                  child: Text(
                    title,
                    style: themeData.textTheme.headline3
                        .copyWith(color: COLOR_BLACK),
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.only(bottom: DEFAULT_PADDING_SMALL),
                  child: Text(
                    "Choose a peripheral to add",
                    style: themeData.textTheme.subtitle2
                        .copyWith(color: COLOR_BLACK),
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
                              colorText: COLOR_BLACK,
                            ),
                          ],
                        ),
                        colorBackground: COLOR_WHITE,
                        onPressed: () {},
                      ),
                    );
                  },
                ),
              ],
            ),
          )),
    );
  }

}
