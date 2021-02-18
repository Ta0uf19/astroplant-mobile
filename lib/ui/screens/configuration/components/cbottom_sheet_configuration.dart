import 'package:app/ui/widgets/cbutton.dart';
import 'package:app/ui/widgets/ccard.dart';
import 'package:app/ui/widgets/ccolumn_text.dart';
import 'package:app/ui/widgets/ctext_input.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../../../constants.dart';

class CBottomSheetConfiguration {
  static void showBottomSheetSelectPeripherals(context) {
    var themeData = Theme.of(context);
    var size = MediaQuery.of(context).size;
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
                  margin: EdgeInsets.only(bottom: CPadding.defaultSmall),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Add new peripheral',
                    style: themeData.textTheme.headline3
                        .copyWith(color: CColors.black),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: CPadding.defaultSmall),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Please select the type of peripheral to add.',
                    style: themeData.textTheme.headline4
                        .copyWith(color: CColors.black),
                  ),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: ClampingScrollPhysics(),
                  itemCount: 12,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.only(bottom: CPadding.defaultSmall),
                      child: CCard(
                        height: 100,
                        borderRadius: 7,
                        body: Row(
                          children: [
                            CColumnText(
                              title: 'Virtual temperature sensor',
                              subTitle: 'A virtual temperature sensor using the environment simulation.',
                              description: 'AstroPlant Virtual - Temperature',
                              colorText: CColors.black,
                            ),
                          ],
                        ),
                        colorBackground: CColors.white,
                        onPressed: () {
                          Navigator.pop(context);
                          CBottomSheetConfiguration.showBottomSheetConfigurePeripherals(context);
                        },
                      ),
                    );
                  },
                ),
              ],
            ),
          )),
    );
  }

  static void showBottomSheetConfigurePeripherals(context) {
    var themeData = Theme.of(context);
    var size = MediaQuery.of(context).size;
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
                  margin: EdgeInsets.only(bottom: CPadding.defaultSmall),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Add new peripheral',
                    style: themeData.textTheme.headline3
                        .copyWith(color: CColors.black),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: CPadding.defaultSmall),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Peripheral',
                    style: themeData.textTheme.headline4
                        .copyWith(color: CColors.black),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: CPadding.defaultSmall),
                  alignment: Alignment.centerLeft,
                  child: CTextInput(
                    textHint: 'Name',
                    backgroundColor: CColors.greyLight,
                    textColor: CColors.black,
                    onChanged: (value) {
                      //description = value;
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: CPadding.defaultSmall),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Configuration',
                    style: themeData.textTheme.headline4
                        .copyWith(color: CColors.black),
                  ),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: ClampingScrollPhysics(),
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.only(bottom: CPadding.defaultSmall),
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(bottom: CPadding.defaultSmall),
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Configuration1',
                              style: themeData.textTheme.headline4
                                  .copyWith(color: CColors.black),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(bottom: CPadding.defaultSmall),
                            alignment: Alignment.centerLeft,
                            child: CTextInput(
                              textHint: 'Configuration1',
                              backgroundColor: CColors.greyLight,
                              textColor: CColors.black,
                              onChanged: (value) {
                                //description = value;
                              },
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
                CButton(
                  height: 56,
                  text: 'Add peripheral',
                  colorBackground: CColors.greyDark,
                  textStyle: themeData.textTheme.headline3
                      .copyWith(color: CColors.white),
                  borderRadius: BorderRadius.circular(28),
                  onPressed: () async {
                  },
                ),
              ],
            ),
          )),
    );
  }


}
