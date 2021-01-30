import 'package:app/ui/widgets/ccard.dart';
import 'package:app/ui/widgets/ccolumn_text.dart';
import 'package:app/ui/widgets/cheader.dart';
import 'package:app/ui/widgets/ctext_input.dart';
import 'package:app/ui/widgets/ctoggle_switch.dart';
import 'package:app/ui/constants.dart';
import 'package:app/ui/screens/configuration/edit_configuration.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ConfigurationScreen extends StatefulWidget {
  @override
  _ConfigurationScreenState createState() => _ConfigurationScreenState();
}

class _ConfigurationScreenState extends State<ConfigurationScreen> {
  bool status = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    ThemeData themeData = Theme.of(context);
    return Scaffold(
      backgroundColor: CColors.black,
      appBar: CHeader.buildAppBarWithCButton(context: context, title: "Configuration"),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showAddConfigurationDialog(context, themeData);
        },
        child: Icon(Icons.add),
      ),
      body: Container(
        width: size.width,
        padding: EdgeInsets.only(
          left: CPadding.defaultSidesSmall,
          right: CPadding.defaultSidesSmall,
          top: CPadding.defaultSmall,
        ),
        child: ListView.builder(
          itemCount: 4,
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.only(bottom: CPadding.defaultSmall),
              child: CCard(
                borderRadius: 7,
                height: 100,
                body: Row(
                  children: [
                    SvgPicture.asset(
                      'assets/icons/configuration.svg',
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    CColumnText(
                      title: "Configuration",
                      subTitle: "Identifier : #127",
                      description: "Never used",
                      colorText: CColors.white,
                    ),
                  ],
                ),
                colorBackground: Color.fromRGBO(29, 29, 29, 1),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => EditConfigurationScreen()),
                  );
                },
                suffixWidget: Container(
                  padding: EdgeInsets.all(CPadding.defaultSmall),
                  alignment: Alignment.center,
                  child: CToggleSwitch(
                      value: status,
                      width: 40,
                      height: 25,
                      toggleSize: 15,
                      onToggle: (val) {
                        setState(() {
                          status = val;
                        });
                      }),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  showAddConfigurationDialog(BuildContext context, ThemeData themeData) {
    // set up the button
    Widget okButton = FlatButton(
      child: Text("Create"),
      onPressed: () {},
    );

    //set up text field
    Widget descriptionText = CTextInput(
      textHint: "Description",
      backgroundColor: CColors.greyLight,
      textColor: CColors.black,
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text(
        "My title",
        style: themeData.textTheme.headline3.copyWith(
          color: CColors.black,
        ),
      ),
      content: descriptionText,
      actions: [
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

}
