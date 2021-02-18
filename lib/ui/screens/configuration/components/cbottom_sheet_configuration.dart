
import 'package:app/ui/widgets/cbutton.dart';
import 'package:app/ui/widgets/ccard.dart';
import 'package:app/ui/widgets/ccolumn_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../../../constants.dart';

class CBottomSheetConfiguration{

  static void showBottomSheetAddPeripherals(context) {
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
                    'List of kits',
                    style: themeData.textTheme.headline3
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
                            SvgPicture.asset(
                              'assets/icons/kit.svg',
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            CColumnText(
                              title: 'Kit #251',
                              subTitle: 'Rabat, Morocco',
                              description: 'Some text for the description',
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
                Container(
                  margin: EdgeInsets.only(bottom: CPadding.defaultSmall),
                  child: CButton(
                    height: 100,
                    padding: EdgeInsets.all(7),
                    text: 'Create new Kit',
                    textStyle: themeData.textTheme.headline3
                        .copyWith(color: CColors.greyMedium),
                    colorBackground: Colors.transparent,
                    suffixIcon: Icon(
                      Icons.add,
                      size: 36,
                      color: CColors.greyMedium,
                    ),
                    prefixIcon: SvgPicture.asset(
                      'assets/icons/kit_empty.svg',
                      width: 50,
                      height: 50,
                    ),
                    borderWidth: 1,
                    borderColor: CColors.greyLight,
                    borderRadius: BorderRadius.circular(8),
                    onPressed: () {},
                  ),
                ),
                CButton(
                  height: 56,
                  text: 'Sign Out',
                  colorBackground: CColors.greyDark,
                  textStyle: themeData.textTheme.headline3
                      .copyWith(color: CColors.white),
                  borderRadius: BorderRadius.circular(28),
                  onPressed: ()  {
                  },
                ),
              ],
            ),
          )),
    );
  }


}