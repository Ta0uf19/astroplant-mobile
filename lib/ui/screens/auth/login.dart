import 'package:app/ui/widgets/cbutton.dart';
import 'package:app/ui/widgets/ctext_input.dart';
import 'package:app/ui/screens/home.dart';
import 'package:app/ui/constants.dart';
import 'package:app/ui/screens/configuration/configuration.dart';
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
    Size size = MediaQuery.of(context).size;
    final ThemeData themeData = Theme.of(context);

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
            bottom: CPadding.defaultPadding),
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  alignment: Alignment.topCenter,
                  margin: EdgeInsets.only(bottom: CPadding.defaultPadding * 3),
                  child: Text(
                    "Log In",
                    style: themeData.textTheme.headline1,
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(bottom: CPadding.defaultSmall),
                  child: CTextInput(
                    textHint: "Email",
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(bottom: CPadding.defaultSmall),
                  child: CTextInput(
                      textHint: "Password", isPasswordType: true),
                ),
                /*GestureDetector(
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
            ),*/
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
                      text: "Sign In",
                      textStyle: themeData.textTheme.headline3
                          .copyWith(color: CColors.black),
                      colorBackground: CColors.primary,
                      height: 56,
                      borderRadius: BorderRadius.circular(28),
                      onPressed: () {
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HomeScreen()),
                                (Route<dynamic> route) => false
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
