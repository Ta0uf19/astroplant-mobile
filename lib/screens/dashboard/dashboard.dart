import 'dart:developer';

import 'package:app/components/cbutton.dart';
import 'package:app/components/ccard_metric.dart';
import 'package:app/components/cheader.dart';
import 'package:app/components/ctoggle_widget.dart';
import 'package:app/components/cline_chart.dart';
import 'package:app/util/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    ThemeData themeData = Theme.of(context);
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: CHeader.buildAppBarWithCButton(context: context, title: "Dashboard"),
        body: SingleChildScrollView(
            child: Column(children: <Widget>[
          Container(
              width: size.width,
              padding: EdgeInsets.only(
                  left: CPadding.DEFAULT_PADDING_SIDES_SMALL,
                  right: CPadding.DEFAULT_PADDING_SIDES_SMALL,
                  top: CPadding.DEFAULT_PADDING_SMALL),
              child: Column(children: [
                Container(
                  child: Text(
                      "Realtime", style: themeData.textTheme.headline3
                  ),
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.only(bottom: CPadding.DEFAULT_PADDING_SMALL),
                ),
                Container(
                  height: 260,
                  margin: EdgeInsets.only(bottom: CPadding.DEFAULT_PADDING),
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      child: Text(
                          "Air Co²",
                          style: themeData.textTheme.headline3,
                          textAlign: TextAlign.end,
                      ),
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.only(bottom: CPadding.DEFAULT_PADDING_SMALL),
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
                      ],
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
