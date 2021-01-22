import 'package:app/components/CButton.dart';
import 'package:app/components/CTextInput.dart';
import 'package:app/constants.dart';
import 'package:app/screens/ConfigurationScreen.dart';
import 'package:app/screens/HomeScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool status = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
    final ThemeData themeData = Theme.of(context);

    return Scaffold(
      backgroundColor: COLOR_BLACK,
      appBar: AppBar(
        elevation: 0,
      ),
      body: Container(
        width: size.width,
        padding: EdgeInsets.only(
            left: DEFAULT_PADDING_SIDES,
            right: DEFAULT_PADDING_SIDES,
            top: DEFAULT_PADDING,
            bottom: DEFAULT_PADDING
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: DEFAULT_PADDING*3),
                    child: Text(
                      "Log In",
                      style: themeData.textTheme.headline1,
                    ),
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: DEFAULT_PADDING_SMALL),
                        child: CTextInput(
                          textHint: "Email",
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: DEFAULT_PADDING_SMALL),
                        child: CTextInput(textHint: "Password", isPasswordType: true),
                      ),
                      GestureDetector(
                        onTap: () {

                        },
                        child: Container(
                          alignment: Alignment.centerRight,
                          padding: EdgeInsets.only(right: 5),
                          child: Text(
                            "FORGOT PASSWORD ?",
                            style: themeData.textTheme.bodyText2.copyWith(fontWeight: FontWeight.w700,),
                          ),
                        ),
                      ),
                    ],
                  ),

                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end ,
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: DEFAULT_PADDING),
                  child: CButton(
                    text: "Sign In",
                    colorText: Colors.black,
                    colorBackground: COLOR_GREEN,
                    borderRadius: BorderRadius.circular(28),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ConfigurationScreen()),
                      );
                    },
                  ),
                ),
                Text(
                  "By signing in, you are agreeing to our Terms of Service and Privacy Policy",
                  textAlign: TextAlign.center,
                  style: themeData.textTheme.bodyText2,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}