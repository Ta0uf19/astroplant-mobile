
import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../configuration.dart';

class CDialog{
  static void showDeleteConfigurationDialog(BuildContext context, ThemeData themeData) {
    // set up the button
    Widget okButton = FlatButton(
      child: Text("Yes, I'm sure"),
      onPressed: () {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
                builder: (context) => ConfigurationScreen()),
                (Route<dynamic> route) => false
        );
      },
    );

    Widget cancelButton = FlatButton(
      child: Text('Cancel'),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );

    // set up the AlertDialog
    var alert = AlertDialog(
      title: Text(
        'Delete',
        style: themeData.textTheme.headline3.copyWith(
          color: CColors.black,
        ),
      ),
      content: Text(
        'Are you sure you want to permanently remove this configuration ?',
        style: themeData.textTheme.subtitle1.copyWith(
          color: CColors.black,
        ),
        textAlign: TextAlign.center,
      ),
      actions: [
        cancelButton,
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