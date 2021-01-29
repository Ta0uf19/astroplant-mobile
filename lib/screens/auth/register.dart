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
      backgroundColor: CColors.black,
      appBar: AppBar(
        elevation: 0,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: EdgeInsets.only(
            left: CPadding.defaultSides,
            right: CPadding.defaultSides,
            top: CPadding.defaultPadding,
            bottom: CPadding.defaultPadding
        ),
        child: Stack(
          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ListView(
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: CPadding.defaultPadding * 3),
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
                          bottom: CPadding.defaultSmall),
                      child: CTextInput(
                        textHint: "Username",
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          bottom: CPadding.defaultSmall),
                      child: CTextInput(textHint: "Email",),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          bottom: CPadding.defaultSmall),
                      child: CTextInput(
                          textHint: "Password", isPasswordType: true),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          bottom: CPadding.defaultSmall),
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
                    margin: EdgeInsets.only(bottom: CPadding.defaultPadding),
                    child: CButton(
                      text: "Create an account",
                      textStyle: themeData.textTheme.headline3.copyWith(
                          color: CColors.black),
                      colorBackground: CColors.primary,
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