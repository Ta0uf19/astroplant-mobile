import 'package:app/components/cbottom_nav.dart';
import 'package:app/components/ccard.dart';
import 'package:app/components/ccolumn_text.dart';
import 'package:app/components/cheader.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:app/custom_icons.dart';
import 'package:app/util/constants.dart';

class CommandScreen extends StatefulWidget {
  @override
  _CommandScreen createState() => _CommandScreen();
}

class _CommandScreen extends State<CommandScreen> {
  bool status = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    ThemeData themeData = Theme.of(context);

    return Scaffold(
      backgroundColor: Colors.black,
      appBar:
          CHeader.buildAppBarWithCButton(context: context, title: "Commands"),
      body: ListView.builder(
          itemCount: 1,
          itemBuilder: (BuildContext context, int block) {
            return Container(
              width: size.width,
              padding: EdgeInsets.only(
                left: CPadding.DEFAULT_PADDING_SIDES_SMALL,
                right: CPadding.DEFAULT_PADDING_SIDES_SMALL,
                top: CPadding.DEFAULT_PADDING_SMALL,
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: CPadding.DEFAULT_PADDING),
                    child: CCard(
                      //height: 100,
                      body: Column(
                        children: [
                          CColumnText(
                            title: "Kit1",
                            subTitle: "version : 4.2.1",
                            description: "Kit uptime 2 hours",
                            colorText: Colors.white,
                          ),
                        ],
                      ),
                      colorBackground: Color.fromRGBO(29, 29, 29, 1),
                      onPressed: () {},
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: CPadding.DEFAULT_PADDING_SMALL),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Command Peripherals",
                          style: themeData.textTheme.headline3,
                        ),
                        SizedBox(
                          height: CPadding.DEFAULT_PADDING_SMALL,
                        ),
                        Text(
                          "Please choose the peripheral to send a command to.",
                          style: themeData.textTheme.subtitle2,
                          textAlign: TextAlign.justify,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 4,
                        ),
                      ],
                    ),
                  ),
                  GridView.count(
                      shrinkWrap: true,
                      primary: false,
                      padding: const EdgeInsets.all(20),
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      crossAxisCount: 2,
                      children: <Widget>[
                        CCard(
                          width: size.width / 2 - 3 * CPadding.DEFAULT_PADDING_SMALL,
                          body: CColumnText(
                            title: "Temp",
                            subTitle: "Identifier : #127",
                            description: "Virtual temperature sensor",
                            colorText: Colors.white,
                          ),
                          colorBackground: Color.fromRGBO(29, 29, 29, 1),
                          onPressed: () {},
                        ),
                        CCard(
                          width: size.width / 2 - 3 * CPadding.DEFAULT_PADDING_SMALL,
                          body: CColumnText(
                            title: "Temp",
                            subTitle: "Identifier : #127",
                            description: "Virtual temperature sensor",
                            colorText: Colors.white,
                          ),
                          colorBackground: Color.fromRGBO(29, 29, 29, 1),
                          onPressed: () {},
                        ),
                        CCard(
                          width: size.width / 2 - 3 * CPadding.DEFAULT_PADDING_SMALL,
                          body: CColumnText(
                            title: "Temp",
                            subTitle: "Identifier : #127",
                            description: "Virtual temperature sensor",
                            colorText: Colors.white,
                          ),
                          colorBackground: Color.fromRGBO(29, 29, 29, 1),
                          onPressed: () {},
                        ),
                        CCard(
                          width: size.width / 2 - 3 * CPadding.DEFAULT_PADDING_SMALL,
                          body: CColumnText(
                            title: "Temp",
                            subTitle: "Identifier : #127",
                            description: "Virtual temperature sensor",
                            colorText: Colors.white,
                          ),
                          colorBackground: Color.fromRGBO(29, 29, 29, 1),
                          onPressed: () {},
                        ),
                      ])
                ],
              ),
            );
          }),
    );
  }
}
