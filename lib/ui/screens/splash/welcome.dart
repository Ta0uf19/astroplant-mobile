import 'package:app/stores/auth/login_store.dart';
import 'package:app/stores/store_state.dart';
import 'package:app/ui/widgets/cbutton.dart';
import 'package:app/ui/constants.dart';
import 'package:app/ui/screens/auth/login.dart';
import 'package:app/ui/screens/auth/register.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';

import '../home.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {

  // Store that contains all the data and the logic we will need in this page
  LoginStore _loginStore;

  // To store reactions
  List<ReactionDisposer> _disposers;

  // Load reactions and store them in _disposers
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _loginStore ??= Provider.of<LoginStore>(context);
    _disposers ??= [
      reactionOnIsLogged(),
    ];
  }

  // Navigate whenever the bool isLogged equal to true
  ReactionDisposer reactionOnIsLogged() {
    return reaction(
          (_) => _loginStore.isLogged,
          (bool isLogged) {
        if (isLogged) {
          print('is logged');
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => HomeScreen()),
                  (Route<dynamic> route) => false);
        } else {
          print('fail logging');
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final themeData = Theme.of(context);

    final textDescription =
        'Educational citizen science project with the European Space Agency to engage a new generation of space farmers, collect data and ideas for agriculture on Mars';
    final appName = 'Astroplant';
    final logIn = 'I already have an account';

    getCurrentUser(context);

    return Scaffold(
      backgroundColor: CColors.black,
      appBar: AppBar(
        elevation: 0,
      ),
      body: Container(
        width: size.width,
        padding: EdgeInsets.only(
            left: CPadding.defaultSides,
            right: CPadding.defaultSides,
            top: CPadding.defaultPadding,
            bottom: CPadding.defaultPadding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                      width: 100,
                      height: 100,
                      margin: EdgeInsets.only(bottom: CPadding.defaultPadding),
                      child: Image.asset(
                        'assets/icons/logo.png',
                      )),
                  Container(
                    margin: EdgeInsets.only(bottom: CPadding.defaultPadding * 2),
                    child: Text(
                      appName.toUpperCase(),
                      style: themeData.textTheme.headline1,
                    ),
                  ),
                  Text(
                    textDescription,
                    textAlign: TextAlign.center,
                    style: themeData.textTheme.bodyText1,
                  ),
                  buildLoading(),
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: CPadding.defaultPadding),
                  child: CButton(
                    text: 'Hi, Astroplant',
                    textStyle: themeData.textTheme.headline3
                        .copyWith(color: CColors.black),
                    colorBackground: CColors.primary,
                    height: 56,
                    borderRadius: BorderRadius.circular(28),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RegistrationScreen()),
                      );
                    },
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginScreen()),
                    );
                  },
                  child: Text(
                    logIn,
                    style: themeData.textTheme.headline3
                        .copyWith(color: CColors.greyMedium),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildLoading() {
    return Observer(
      name: 'Loading',
      builder: (_) {
        if (_loginStore.loginState == StoreState.loading) {
          return Center(child: CircularProgressIndicator());
        }
        // here we can add on success, to show user that he's logging successfully
        return Container();
      },
    );
  }

  void getCurrentUser(BuildContext context) {
    final store = Provider.of<LoginStore>(context);
    store.getCurrentUser();
  }

}

