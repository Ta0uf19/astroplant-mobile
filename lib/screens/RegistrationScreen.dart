import 'package:app/components/CButton.dart';
import 'package:app/components/CTextInput.dart';
import 'package:app/constants.dart';
import 'package:app/screens/LoginScreen.dart';
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
      backgroundColor: Colors.black,
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
                      "Join the community",
                      textAlign: TextAlign.center,
                      style: themeData.textTheme.headline1,
                    ),
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: DEFAULT_PADDING_SMALL),
                        child: CTextInput(
                          textHint: "Username",
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: DEFAULT_PADDING_SMALL),
                        child: CTextInput(textHint: "Email",),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: DEFAULT_PADDING_SMALL),
                        child: CTextInput(textHint: "Password", isPasswordType: true),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: DEFAULT_PADDING_SMALL),
                        child: CTextInput(textHint: "Confirm Password ...", isPasswordType: true),
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
                    text: "Create an account",
                    colorText: Colors.black,
                    colorBackground: COLOR_GREEN,
                    borderRadius: BorderRadius.circular(28),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginScreen()),
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
            )
          ],
        ),
      ),
    );
  }
}