import 'package:app/stores/users/auth_form_store.dart';
import 'package:app/ui/constants.dart';
import 'package:app/ui/widgets/cbutton.dart';
import 'package:app/ui/widgets/ctext_input.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';

import '../home.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  AuthFormStore _authFormStore;
  List<ReactionDisposer> _disposers;
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _authFormStore ??= Provider.of<AuthFormStore>(context);
    _disposers ??= [
      reaction(
        (_) => _authFormStore.errorMessage,
        (String message) {
          _scaffoldKey.currentState.showSnackBar(
            SnackBar(
              content: Text(message),
            ),
          );
        },
      ),
      reaction(
        (_) => _authFormStore.isLogged,
        (bool isLogged) {
          if(isLogged){
          print('is logged');
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => HomeScreen()),
              (Route<dynamic> route) => false);
        }else{
           print('fail logging');
          }
          },
      ),
    ];
  }

  @override
  void dispose() {
    _disposers.forEach((d) => d());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);

    return Scaffold(
      key: _scaffoldKey,
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
        child: Observer(
          builder: (_) {
            switch (_authFormStore.state) {
              case StoreState.initial:
                return buildInitialInput();
              case StoreState.loading:
                return buildLoading();
              case StoreState.loaded:
                return buildInitialInput();
              default:
                return Container();
            }
          },
        ),
      ),
    );
  }

  Widget buildInitialInput() {
    return Center(
      child: Stack(
        children: [
          Column(
            children: [
              Container(
                alignment: Alignment.topCenter,
                margin: EdgeInsets.only(bottom: CPadding.defaultPadding * 3),
                child: Text(
                  'Log In',
                  style: themeData.textTheme.headline1,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: CPadding.defaultSmall),
                child: TextField(
                  onChanged: (value) {
                    _authFormStore.user.username = value;
                    _authFormStore.user.password = value;
                    print('TextField test');
                    //print(_authFormStore.user.username);
                  },
                  decoration: InputDecoration(
                    labelText: 'Username',
                    hintText: 'Pick a username',
                    errorStyle: TextStyle(
                        color: CColors.white, fontWeight: FontWeight.w600),
                  ),
                  style: TextStyle(
                      color: CColors.white, fontWeight: FontWeight.w600),
                ),
              ),
              Padding(
                  padding: const EdgeInsets.only(bottom: CPadding.defaultSmall),
                  child:
                      CTextInput(textHint: 'Password', isPasswordType: true)),
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
                      text: 'Sign In',
                      textStyle: themeData.textTheme.headline3
                          .copyWith(color: CColors.black),
                      colorBackground: CColors.primary,
                      height: 56,
                      borderRadius: BorderRadius.circular(28),
                      onPressed: () {
                        submitLoginForm(context);
                        //print(_authFormStore.toString());
                      }
                      /*async {

                        var user = await authFormStore.login(
                            loginController.text, loginController.text);
                        if (user == null) return;

                        await Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomeScreen()),
                            (Route<dynamic> route) => false);
                      },*/
                      ),
                ),
                Text(
                  'By signing in, you are agreeing to our Terms of Service and Privacy Policy',
                  textAlign: TextAlign.center,
                  style: themeData.textTheme.bodyText2,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildLoading() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  void submitLoginForm(BuildContext context) {
    final store = Provider.of<AuthFormStore>(context);
    store.doLogin();
  }
}
