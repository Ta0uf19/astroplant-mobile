import 'package:app/ui/widgets/cbottom_nav.dart';
import 'package:app/ui/widgets/cbutton.dart';
import 'package:app/ui/widgets/ccard.dart';
import 'package:app/ui/widgets/ccolumn_text.dart';
import 'package:app/ui/widgets/cheader.dart';
import 'package:app/ui/constants.dart';
import 'package:app/ui/custom_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class EditRulesScreen extends StatefulWidget {
  @override
  _EditRulesScreenState createState() => _EditRulesScreenState();
}

class _EditRulesScreenState extends State<EditRulesScreen> {
  bool status = false;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var themeData = Theme.of(context);

    return Scaffold(
      backgroundColor: CColors.black,
      bottomNavigationBar: CBottomNav(
        items: [
          CBottomNavItem(CustomIcons.dashboard),
          CBottomNavItem(CustomIcons.commands),
          CBottomNavItem(CustomIcons.settings),
        ],
        iconStyle: IconStyle(size: 23),
        index: 2,
      ),
      appBar: CHeader.buildAppBarWithCButton(
          context: context, title: 'Config1 Rules'),
      body: ListView.builder(
          physics: ClampingScrollPhysics(),
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
                  Container(
                    margin: EdgeInsets.only(bottom: CPadding.defaultSmall),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Inputs',
                          style: themeData.textTheme.headline3,
                        ),
                        CButton(
                          width: 55,
                          height: 25,
                          padding: EdgeInsets.all(5),
                          text: 'Add',
                          textStyle: themeData.textTheme.headline5
                              .copyWith(color: CColors.black),
                          colorBackground: CColors.primary,
                          suffixIcon: Icon(
                            Icons.add,
                            size: 16,
                          ),
                          borderRadius: BorderRadius.circular(8),
                          onPressed: () {
                            showBottomSheetSelectPeripherals(
                                title: 'List of inputs');
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
                        margin: EdgeInsets.only(bottom: CPadding.defaultSmall),
                        child: CCard(
                            height: 100,
                            borderRadius: 7,
                            body: Row(
                              children: [
                                CColumnText(
                                  title: 'Temp',
                                  subTitle: 'Identifier : #127',
                                  description: 'Virtual temperature sensor',
                                  colorText: CColors.white,
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
                                print('onTap called.');
                              },
                            )
                        ),
                      );
                    },
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: CPadding.defaultSmall),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Outputs',
                          style: themeData.textTheme.headline3,
                        ),
                        CButton(
                          width: 55,
                          height: 25,
                          padding: EdgeInsets.all(5),
                          text: 'Add',
                          textStyle: themeData.textTheme.headline5
                              .copyWith(color: CColors.black),
                          colorBackground: CColors.primary,
                          suffixIcon: Icon(
                            Icons.add,
                            size: 16,
                          ),
                          borderRadius: BorderRadius.circular(8),
                          onPressed: () {
                            showBottomSheetSelectPeripherals(
                                title: 'List of outputs');
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
                        margin: EdgeInsets.only(bottom: CPadding.defaultSmall),
                        child: CCard(
                          height: 100,
                          borderRadius: 7,
                          body: Row(
                            children: [
                              CColumnText(
                                title: 'Temp',
                                subTitle: 'Identifier : #127',
                                description: 'Virtual temperature sensor',
                                colorText: CColors.white,
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
                              print('onTap called.');
                            },
                          ),
                        ),
                      );
                    },
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: CPadding.defaultSmall),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Rules',
                          style: themeData.textTheme.headline3,
                        ),
                        CButton(
                          width: 55,
                          height: 25,
                          padding: EdgeInsets.all(5),
                          text: 'Add',
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
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.only(bottom: CPadding.defaultSmall),
                        child: CCard(
                          borderRadius: 7,
                          height: 100,
                          body: Row(
                            children: [
                              CColumnText(
                                title: 'Temp',
                                subTitle: 'Identifier : #127',
                                description: 'Virtual temperature sensor',
                                colorText: CColors.white,
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
                              print('onTap called.');
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

  void showBottomSheetSelectPeripherals({title = 'List of peripherals'}) {
    var size = MediaQuery.of(context).size;
    var themeData = Theme.of(context);
    showBarModalBottomSheet(
      bounce: true,
      context: context,
      builder: (context) => SingleChildScrollView(
          controller: ModalScrollController.of(context),
          child: Container(
            width: size.width,
            padding: EdgeInsets.only(
                left: CPadding.defaultSidesSmall,
                right: CPadding.defaultSidesSmall,
                top: CPadding.defaultPadding,
                bottom: CPadding.defaultPadding),
            child: Column(
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.only(bottom: CPadding.defaultSmall),
                  child: Text(
                    title,
                    style: themeData.textTheme.headline3
                        .copyWith(color: CColors.black),
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.only(bottom: CPadding.defaultSmall),
                  child: Text(
                    'Choose a peripheral to add',
                    style: themeData.textTheme.subtitle2
                        .copyWith(color: CColors.black),
                  ),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: ClampingScrollPhysics(),
                  itemCount: 2,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.only(bottom: CPadding.defaultSmall),
                      child: CCard(
                        height: 100,
                        borderRadius: 7,
                        body: Row(
                          children: [
                            CColumnText(
                              title: 'Temp',
                              subTitle: 'Identifier : #127',
                              description: 'Virtual temperature sensor',
                              colorText: CColors.black,
                            ),
                          ],
                        ),
                        colorBackground: CColors.white,
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

  Widget btnMenu = PopupMenuButton<String>(
    onSelected: (value) {
      choiceAction(value);
    },
    child: SvgPicture.asset(
      'assets/icons/menu.svg',
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
