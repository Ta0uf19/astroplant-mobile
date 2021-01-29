import 'package:app/components/cbottom_nav.dart';
import 'package:app/components/cbutton.dart';
import 'package:app/components/ccard.dart';
import 'package:app/components/ccolumn_text.dart';
import 'package:app/components/cheader.dart';
import 'package:app/util/constants.dart';
import 'package:app/screens/configuration/configuration.dart';
import 'package:app/screens/configuration/edit_rules.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../custom_icons.dart';

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
      appBar: CHeader.buildAppBarWithCButton(context: context,title: "Edit Configuration"),
      body: ListView.builder(
          itemCount: 1,
          itemBuilder: (BuildContext context, int block) {
            return Container(
              width: size.width,
              padding: EdgeInsets.only(
                left: CPadding.defaultSidesSmall,
                right: CPadding.defaultSidesSmall,
                top: CPadding.defaultSmall,
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: CPadding.defaultPadding),
                    child: CCard(
                      //height: 100,
                      body: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Description",
                            style: themeData.textTheme.subtitle1
                                .copyWith(color: CColors.white),
                          ),
                          SizedBox(
                            height: CPadding.defaultSmall,
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
                    margin: EdgeInsets.only(bottom: CPadding.defaultSmall),
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
                              .copyWith(color: CColors.black),
                          colorBackground: CColors.primary,
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
                        margin: EdgeInsets.only(bottom: CPadding.defaultSmall),
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
                                child: btnMenu
                              ),
                              onTap: () {
                                print("onTap called.");
                              },
                            )
                        ),
                      );
                    },
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.only(bottom: CPadding.defaultSmall),
                    child: Text(
                      "More",
                      textAlign: TextAlign.start,
                      style: themeData.textTheme.headline3,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: CPadding.defaultSmall),
                    child: CButton(
                      height: 56,
                      padding: EdgeInsets.all(5),
                      text: "Edit rules",
                      colorBackground: CColors.black,
                      borderColor: CColors.white,
                      textStyle: themeData.textTheme.headline3.copyWith(color: CColors.white),
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
                    margin: EdgeInsets.only(bottom: CPadding.defaultSmall),
                    child: CButton(
                      height: 56,
                      padding: EdgeInsets.all(5),
                      text: "Delete Configuration",
                      colorBackground: CColors.black,
                      textStyle: themeData.textTheme.headline3.copyWith(color: CColors.white),
                      borderColor: Colors.red,
                      borderWidth: 1,
                      borderRadius: BorderRadius.circular(28),
                      onPressed: () {
                        showDeleteConfigurationDialog(context,themeData);
                      },
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }

  showDeleteConfigurationDialog(BuildContext context, ThemeData themeData) {
    // set up the button
    Widget okButton = FlatButton(
      child: Text("Yes, I'm sure"),
      onPressed: () {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
              builder: (context) => ConfigurationScreen()),
                (Route<dynamic> route) => false
        );
      },
    );

    Widget cancelButton = FlatButton(
      child: Text("Cancel"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text(
        "Delete",
        style: themeData.textTheme.headline3.copyWith(
          color: CColors.black,
        ),
      ),
      content: Text(
        "Are you sure you want to permanently remove this configuration ?",
        style: themeData.textTheme.subtitle1.copyWith(
          color: CColors.black,
        ),
        textAlign: TextAlign.center,
      ),
      actions: [
        cancelButton,
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }


  Widget btnMenu = PopupMenuButton<String>(
    onSelected: (value) {
      choiceAction(value);
    },
    child: SvgPicture.asset(
      "assets/icons/menu.svg",
      width: 20,
      height: 20,
    ),
    itemBuilder: (BuildContext context) {
      return Choices.choices.map((String choice) {
        return PopupMenuItem<String>(
          value: choice,
          child: Text(choice),
        );
      }).toList();
    },
  );

  static void choiceAction(String choice) {
    if (choice == Choices.Settings) {
      print('Settings');
    } else if (choice == Choices.Subscribe) {
      print('Subscribe');
    } else if (choice == Choices.SignOut) {
      print('SignOut');
    }
  }
}
class Choices {
  static const String Subscribe = 'Subscribe';
  static const String Settings = 'Settings';
  static const String SignOut = 'Sign out';

  static const List<String> choices = <String>[Subscribe, Settings, SignOut];
}
