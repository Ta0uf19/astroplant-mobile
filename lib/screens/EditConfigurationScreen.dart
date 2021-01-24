import 'package:app/components/CBottomNav.dart';
import 'package:app/components/CButton.dart';
import 'package:app/components/CCard.dart';
import 'package:app/components/CColumnText.dart';
import 'package:app/constants.dart';
import 'package:app/screens/EditRulesScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../CustomIcons.dart';

class EditConfigurationScreen extends StatefulWidget {
  @override
  _EditConfigurationScreenState createState() =>
      _EditConfigurationScreenState();
}

class _EditConfigurationScreenState extends State<EditConfigurationScreen> {
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
        title: Text("Edit Configuration"),
      ),
      body: ListView.builder(
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
                  Padding(
                    padding: const EdgeInsets.only(bottom: DEFAULT_PADDING),
                    child: CCard(
                      //height: 100,
                      body: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Description",
                            style: themeData.textTheme.subtitle1
                                .copyWith(color: COLOR_WHITE),
                          ),
                          SizedBox(
                            height: DEFAULT_PADDING_SMALL,
                          ),
                          Expanded(
                            child: Text(
                              "Beta testing phase, it is important to regularly check you are running the late, kit software. Please check you are running the latest version",
                              style: themeData.textTheme.subtitle2,
                              textAlign: TextAlign.justify,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 4,
                            ),
                          ),
                        ],
                      ),
                      colorBackground: Color.fromRGBO(29, 29, 29, 1),
                      onPressed: () {},
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: DEFAULT_PADDING_SMALL),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Peripherals",
                          style: themeData.textTheme.headline3,
                        ),
                        CButton(
                          width: 55,
                          height: 25,
                          padding: EdgeInsets.all(5),
                          text: "Add",
                          textStyle: themeData.textTheme.headline5
                              .copyWith(color: COLOR_BLACK),
                          colorText: COLOR_BLACK,
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
                    itemCount: 4,
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
                            suffixWidget: GestureDetector(
                              child: Container(
                                alignment: Alignment.topRight,
                                margin: EdgeInsets.only(top: 10, right: 5),
                                child: SvgPicture.asset(
                                  "assets/icons/menu.svg",
                                  width: 20,
                                  height: 20,
                                ),
                              ),
                              onTap: () {
                                print("onTap called.");
                              },
                            )),
                      );
                    },
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.only(bottom: DEFAULT_PADDING_SMALL),
                    child: Text(
                      "More",
                      textAlign: TextAlign.start,
                      style: themeData.textTheme.headline3,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: DEFAULT_PADDING_SMALL),
                    child: CButton(
                      padding: EdgeInsets.all(5),
                      text: "Edit rules",
                      colorText: COLOR_WHITE,
                      colorBackground: COLOR_BLACK,
                      borderColor: COLOR_WHITE,
                      borderWidth: 1,
                      borderRadius: BorderRadius.circular(28),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => EditRulesScreen()),
                        );
                      },
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: DEFAULT_PADDING_SMALL),
                    child: CButton(
                      padding: EdgeInsets.all(5),
                      text: "Delete Configuration",
                      colorText: COLOR_WHITE,
                      colorBackground: COLOR_BLACK,
                      borderColor: Colors.red,
                      borderWidth: 1,
                      borderRadius: BorderRadius.circular(28),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
