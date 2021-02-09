import 'package:app/stores/auth/login_store.dart';
import 'package:app/stores/store_state.dart';
import 'package:app/ui/constants.dart';
import 'package:app/ui/widgets/cbutton.dart';
import 'package:app/ui/widgets/ctext_input.dart';
import 'package:app/ui/screens/home.dart';
import 'package:app/ui/constants.dart';
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
  // Store that contains all the data and the logic we will need in this page
  LoginStore _loginStore;

  // To store reactions
  List<ReactionDisposer> _disposers;

  /// To use the same context as the main widget in an external widget,
  /// in our case we will use the same context to shaw the external SnackBar
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  /// Reaction : A method that will be called whenever the subject change

  // Load reactions and store them in _disposers
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _loginStore ??= Provider.of<LoginStore>(context);
    _disposers ??= [
      reactionOnErrorMessage(),
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

  // Show whenever an error is caught, SnackBar appear, showing the error message
  ReactionDisposer reactionOnErrorMessage() {
    return reaction(
      (_) => _loginStore.errorMessage,
      (String message) {
        if (message.isNotEmpty) {
          _scaffoldKey.currentState.showSnackBar(
            SnackBar(
              content: Text(message),
            ),
          );
        }
      },
    );
  }

  // Destroy reactions when the page is removed from the tree permanently
  @override
  void dispose() {
    _disposers.forEach((d) => d());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
        child: buildForm(),
      ),
    );
  }

  Widget buildForm() {
    return Center(
      child: Stack(
        children: [
          buildLoading(),
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
                child: buildUsernameInput(),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: CPadding.defaultSmall),
                child: buildPasswordInput(),
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
                    child: buildButtonSubmit()),
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

  Widget buildUsernameInput() {
    return Observer(
      builder: (_) {
        return CTextInput(
          textHint: 'Username',
          onChanged: (value) {
            _loginStore.username = value;
          },
        );
      },
    );
  }

  Widget buildPasswordInput() {
    return Observer(
      builder: (_) {
        return CTextInput(
          textHint: 'Password',
          isPasswordType: true,
          onChanged: (value) {
            _loginStore.password = value;
          },
        );
      },
    );
  }

  Widget buildButtonSubmit() {
    return CButton(
        text: 'Sign In',
        textStyle: themeData.textTheme.headline3.copyWith(color: CColors.black),
        colorBackground: CColors.primary,
        height: 56,
        borderRadius: BorderRadius.circular(28),
        onPressed: () {
          submitLoginForm(context);
        });
  }

  Widget buildLoading() {
    return Observer(
      builder: (_) {
        if (_loginStore.state == StoreState.loading) {
          return Center(child: CircularProgressIndicator());
        }
        // here we can add on success, to show user that he's logging successfully
        return Container();
      },
    );
  }

  void submitLoginForm(BuildContext context) {
    final store = Provider.of<LoginStore>(context);
    store.errorMessage='';
    store.doLogin();
  }
}
