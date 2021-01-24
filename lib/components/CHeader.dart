import 'package:app/components/CButton.dart';
import 'package:app/components/CToggleSwitch.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


// StatelessWidget
class CHeader {

  static AppBar buildAppBarWithCToggle({String title = ""}) {
    return AppBar(
      title: Text(title),
      actions: <Widget>[
        Container(
          margin: EdgeInsets.only(right: 18),
          child: Text("Activate",style: TextStyle(fontSize: 22,fontWeight: FontWeight.w500) ,),
          alignment: Alignment.center,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: CToggleSwitch(
            width: 50,
            height: 20,
            value: true,
            onToggle:(value) => true,
          ),
        )
      ],
    );
  }

  static AppBar buildAppBarWithCButton({String title = ""}) {
    return AppBar(
      title: Text(title),
      actions: <Widget>[
        Container(
          width: 150,
          height: 50,
          child: CButton(
            text: "Kit1 : AFC58",
            colorText: Colors.black,
            colorBackground: COLOR_GREEN,
            fontSize: 16,
            borderRadius: BorderRadius.only(
                bottomLeft: const Radius.circular(40.0),
                topLeft: const Radius.circular(40.0)),
            prefixIcon: Icon(Icons.autorenew, color: Colors.black),
            onPressed: () {},
          ),
        )
      ],
    );
  }


}
