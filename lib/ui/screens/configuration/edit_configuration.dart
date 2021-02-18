import 'package:app/stores/kit/kit_store.dart';
import 'package:app/ui/screens/configuration/components/cdialog.dart';
import 'package:app/ui/screens/configuration/components/cbottom_sheet_configuration.dart';
import 'package:app/ui/screens/configuration/components/peripheral_menu.dart';
import 'package:app/ui/widgets/cbottom_nav.dart';
import 'package:app/ui/widgets/cbutton.dart';
import 'package:app/ui/widgets/ccard.dart';
import 'package:app/ui/widgets/ccolumn_text.dart';
import 'package:app/ui/widgets/cheader.dart';
import 'package:app/ui/constants.dart';
import 'package:app/ui/screens/configuration/configuration.dart';
import 'package:app/ui/screens/configuration/edit_rules.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';

import '../../custom_icons.dart';

class EditConfigurationScreen extends StatefulWidget {

  // Declare a field that holds the configuration.
  final int indexConfiguration;

  // In the constructor, require a configuration.
  EditConfigurationScreen({Key key, @required this.indexConfiguration}) : super(key: key);

  @override
  _EditConfigurationScreenState createState() =>
      _EditConfigurationScreenState(indexConfiguration: indexConfiguration);
}

class _EditConfigurationScreenState extends State<EditConfigurationScreen> {

  // Declare a field that holds the configuration.
  final int indexConfiguration;

  // In the constructor, require a configuration.
  _EditConfigurationScreenState({Key key, @required this.indexConfiguration});

  // Store that contains all the data and the logic we will need in this page
  KitStore _kitStore;

  // To store reactions
  List<ReactionDisposer> _disposers;

  /// To use the same context as the main widget in an external widget,
  /// in our case we will use the same context to shaw the external SnackBar
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  /// Reaction : A method that will be called whenever the subject change

  // Load reactions and store them in _disposers
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _kitStore ??= Provider.of<KitStore>(context);
    _disposers ??= [
    ];

  }

  // Destroy reactions when the page is removed from the tree permanently
  @override
  void dispose() {
    _disposers.forEach((d) => d());
    super.dispose();
  }

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
      appBar: CHeader.buildAppBarWithCButton(context: context,title: 'Edit Configuration'),
      // we used ListView instead of scrollableChild to be able to do nested list
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
                            'Description',
                            style: themeData.textTheme.subtitle1
                                .copyWith(color: CColors.white),
                          ),
                          SizedBox(
                            height: CPadding.defaultSmall,
                          ),
                          Expanded(
                            child: Text(
                              _kitStore.configurations[indexConfiguration].description,
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
                          'Peripherals',
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
                            CBottomSheetConfiguration.showBottomSheetSelectPeripherals(context);
                            },
                        ),
                      ],
                    ),
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    itemCount: _kitStore.configurations[indexConfiguration].peripherals.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.only(bottom: CPadding.defaultSmall),
                        child: CCard(
                            height: 100,
                            borderRadius: 7,
                            body: Row(
                              children: [
                                CColumnText(
                                  title: _kitStore.configurations[indexConfiguration].peripherals[index].name,
                                  subTitle: 'Identifier : #${_kitStore.configurations[indexConfiguration].peripherals[index].id}',
                                  description: _kitStore.peripheralDefinition[_kitStore.configurations[indexConfiguration].peripherals[index].peripheralDefinitionId].name,
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
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.only(bottom: CPadding.defaultSmall),
                    child: Text(
                      'More',
                      textAlign: TextAlign.start,
                      style: themeData.textTheme.headline3,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: CPadding.defaultSmall),
                    child: CButton(
                      height: 56,
                      padding: EdgeInsets.all(5),
                      text: 'Edit rules',
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
                      text: 'Delete Configuration',
                      colorBackground: CColors.black,
                      textStyle: themeData.textTheme.headline3.copyWith(color: CColors.white),
                      borderColor: Colors.red,
                      borderWidth: 1,
                      borderRadius: BorderRadius.circular(28),
                      onPressed: () {
                        CDialog.showDeleteConfigurationDialog(context,themeData);
                      },
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }


  Widget btnMenu = PopupMenuButton<String>(
    onSelected: (value) {
      PeripheralMenu.choiceAction(value);
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




}

