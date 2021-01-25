import 'dart:developer';

import 'package:app/components/cbottom_nav.dart';
import 'package:app/components/cbutton.dart';
import 'package:app/components/ccard_metric.dart';
import 'package:app/components/ctoggle_widget.dart';
import 'package:app/components/cline_chart.dart';
import 'package:app/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:app/custom_icons.dart';

class ToggleWidgetScreen extends StatelessWidget {
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
        body: SingleChildScrollView(
            child: Column(children: <Widget>[
          Container(
              width: size.width,
              padding: EdgeInsets.only(
                  left: kDefaultPadding,
                  right: kDefaultPadding,
                  top: kDefaultPadding),
              child: Column(children: [
                SizedBox(
                  height: 260,
                  child: ListView(
                    // This next line does the trick.
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      CToggleWidget(onPressed: (index) { log("card pressed $index "); }, children: [
                        CCardMetric(
                          title: "Air Co² Sensor",
                          subtitle: "Carbon concentration",
                          measure: "550",
                          unit: "ppm",
                          onPressed: () {},
                        ),
                        CCardMetric(
                          title: "Temperature",
                          subtitle: "Temperature",
                          measure: "18",
                          unit: "°C",
                          onPressed: () {},
                        ),
                        CCardMetric(
                          title: "Air Co² Sensor",
                          subtitle: "Carbon concentration",
                          measure: "550",
                          unit: "ppm",
                          onPressed: () {},
                        ),
                      ]),
                    ],
                  ),
                ),
                CToggleWidget(
                  onPressed: (index) {
                    log("button pressed " + index.toString());
                  },
                  defaultSelectedIndex: 0,
                  spacePadding: 13,
                  children: [
                    CButton(
                      textStyle: themeData.textTheme.headline3.copyWith(fontSize: 14),
                      borderRadius: BorderRadius.circular(5),
                      text: "Month",
                      onPressed: () {
                        log("pressed 0");
                      },
                      disabled: true,
                    ),
                    CButton(
                      textStyle: themeData.textTheme.headline3.copyWith(fontSize: 14),
                      text: "Year",
                      onPressed: () {
                        log("pressed 1");
                      },
                      borderRadius: BorderRadius.circular(5),
                      disabled: true,
                    ),
                    CButton(
                      textStyle: themeData.textTheme.headline3.copyWith(fontSize: 14),
                      text: "Hi, Astroplant",
                      onPressed: () {
                        log("pressed 3.");
                      },
                      borderRadius: BorderRadius.circular(5),
                      disabled: true,
                    ),
                  ],
                ),
                CLineChart(),


                // CToggleWidget(children: [
                //   CCardMetric(
                //     title: "Air Co² Sensor",
                //     subtitle: "Carbon concentration",
                //     measure: "550",
                //     unit: "ppm",
                //     onPressed: () {  },
                //   ),
                //   CCardMetric(
                //     title: "Air Co² Sensor",
                //     subtitle: "Carbon concentration",
                //     measure: "550",
                //     unit: "ppm",
                //     onPressed: () { log("card pressed!"); },
                //   ),
                // ]),
              ]))
        ])));
  }
}
