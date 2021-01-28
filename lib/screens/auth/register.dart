import 'package:app/components/cbutton.dart';
import 'package:app/components/ctext_input.dart';
import 'package:app/util/constants.dart';
import 'package:app/screens/auth/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  bool status = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
    ThemeData themeData = Theme.of(context);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: COLOR_BLACK,
      appBar: AppBar(
        elevation: 0,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: EdgeInsets.only(
            left: DEFAULT_PADDING_SIDES,
            right: DEFAULT_PADDING_SIDES,
            top: DEFAULT_PADDING,
            bottom: DEFAULT_PADDING
        ),
        child: Stack(
          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ListView(
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: DEFAULT_PADDING * 3),
                  child: Text(
                    "Join the community",
                    textAlign: TextAlign.center,
                    style: themeData.textTheme.headline1,
                  ),
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          bottom: DEFAULT_PADDING_SMALL),
                      child: CTextInput(
                        textHint: "Username",
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          bottom: DEFAULT_PADDING_SMALL),
                      child: CTextInput(textHint: "Email",),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          bottom: DEFAULT_PADDING_SMALL),
                      child: CTextInput(
                          textHint: "Password", isPasswordType: true),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          bottom: DEFAULT_PADDING_SMALL),
                      child: CTextInput(textHint: "Confirm Password ...",
                          isPasswordType: true),
                    ),

                  ],
                ),

              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: DEFAULT_PADDING),
                    child: CButton(
                      text: "Create an account",
                      textStyle: themeData.textTheme.headline3.copyWith(
                          color: COLOR_BLACK),
                      colorBackground: COLOR_GREEN,
                      height: 56,
                      borderRadius: BorderRadius.circular(28),
                      onPressed: () {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(builder: (context) =>
                                LoginScreen()),
                                (Route<dynamic> route) => false
                        );
                      },
                    ),
                  ),
                  Text(
                    "By creating an account, you are agreeing to our Terms of Service and Privacy Policy",
                    textAlign: TextAlign.center,
                    style: themeData.textTheme.bodyText2,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}