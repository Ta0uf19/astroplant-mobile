import 'package:app/components/cbutton.dart';
import 'package:app/components/ccard.dart';
import 'package:app/components/ccolumn_text.dart';
import 'package:app/components/ctoggle_switch.dart';
import 'package:app/constants.dart';
import 'package:app/screens/welcome_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

// StatelessWidget
class CHeader {
  static AppBar buildAppBarWithCToggle({String title = ""}) {
    return AppBar(
      title: Text(title),
      actions: <Widget>[
        Container(
          margin: EdgeInsets.only(right: 18),
          child: Text(
            "Activate",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
          ),
          alignment: Alignment.center,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: CToggleSwitch(
            width: 50,
            height: 20,
            value: true,
            onToggle: (value) => true,
          ),
        )
      ],
    );
  }

  static AppBar buildAppBarWithCButton({BuildContext context, String title = ""}) {
    return AppBar(
      title: Text(title),
      actions: <Widget>[
        Container(
          padding: EdgeInsets.only(top: 6, bottom: 6),
          child: CButton(
            text: "Kit1 : AFC58",
            textStyle: TextStyle(
                color: COLOR_BLACK, fontWeight: FontWeight.w700, fontSize: 15),
            colorBackground: COLOR_GREEN,
            borderRadius: BorderRadius.only(
                bottomLeft: const Radius.circular(40.0),
                topLeft: const Radius.circular(40.0)),
            prefixIcon: Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(right: 10),
                child: SvgPicture.asset(
                  'assets/icons/exchange.svg',
                )),
            onPressed: () {
              showBottomSheetSelectKit(context: context);
            },
          ),
        )
      ],
    );
  }

  static void showBottomSheetSelectKit({BuildContext context}) {
    ThemeData themeData = Theme.of(context);
    Size size = MediaQuery.of(context).size;
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
                  margin: EdgeInsets.only(bottom: DEFAULT_PADDING_SMALL),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "List of kits",
                    style: themeData.textTheme.headline3
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
                            SvgPicture.asset(
                              'assets/icons/kit.svg',
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            CColumnText(
                              title: "Kit #251",
                              subTitle: "Rabat, Morocco",
                              description: "Some text for the description",
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
                Container(
                  margin: EdgeInsets.only(bottom: DEFAULT_PADDING_SMALL),
                  child: CButton(
                    height: 100,
                    padding: EdgeInsets.all(7),
                    text: "Create new Kit",
                    textStyle: themeData.textTheme.headline3
                        .copyWith(color: COLOR_GREY_MEDIUM),
                    colorBackground: Colors.transparent,
                    suffixIcon: Icon(
                      Icons.add,
                      size: 36,
                      color: COLOR_GREY_MEDIUM,
                    ),
                    prefixIcon: SvgPicture.asset(
                      "assets/icons/kit_empty.svg",
                      width: 50,
                      height: 50,
                    ),
                    borderWidth: 1,
                    borderColor: COLOR_GREY_LIGHT,
                    borderRadius: BorderRadius.circular(8),
                    onPressed: () {},
                  ),
                ),
                CButton(
                  height: 56,
                  text: "Sign Out",
                  colorBackground: COLOR_GREY_DARK,
                  textStyle: themeData.textTheme.headline3
                      .copyWith(color: COLOR_WHITE),
                  borderRadius: BorderRadius.circular(28),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => WelcomeScreen()),
                    );
                  },
                ),
              ],
            ),
          )),
    );
  }




}
