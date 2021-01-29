import 'dart:developer';
import 'package:app/ui/components/cbutton.dart';
import 'package:app/ui/components/ccard_peripheral.dart';
import 'package:app/ui/components/cheader.dart';
import 'package:app/ui/components/ctoggle_widget.dart';
import 'package:app/ui/components/cline_chart.dart';
import 'package:app/ui/constants.dart';
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
                  left: CPadding.defaultSidesSmall,
                  right: CPadding.defaultSidesSmall,
                  top: CPadding.defaultSmall),
              child: Column(children: [
                Container(
                  child: Text(
                      "Realtime", style: themeData.textTheme.headline3
                  ),
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.only(bottom: CPadding.defaultSmall),
                ),
                Container(
                  height: 260,
                  margin: EdgeInsets.only(bottom: CPadding.defaultPadding),
                  child: ListView(
                    // This next line does the trick.
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      CToggleWidget(onPressed: (index) { log("card pressed $index "); }, children: [
                        CCardPeripheral(
                          title: "Air Co² Sensor",
                          subtitle: "Carbon concentration",
                          measure: "550",
                          unit: "ppm",
                          onPressed: () {},
                        ),
                        CCardPeripheral(
                          title: "Temperature",
                          subtitle: "Temperature",
                          measure: "18",
                          unit: "°C",
                          onPressed: () {},
                        ),
                        CCardPeripheral(
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
                      padding: EdgeInsets.only(bottom: CPadding.defaultSmall),
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
