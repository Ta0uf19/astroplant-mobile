import 'package:app/stores/auth/register_store.dart';
import 'package:app/stores/store_state.dart';
import 'package:app/ui/constants.dart';
import 'package:app/ui/screens/auth/login.dart';
import 'package:app/ui/widgets/cbutton.dart';
import 'package:app/ui/widgets/ctext_input.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';

class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  // Store that contains all the data and the logic we will need in this page
  RegisterStore _registerStore;

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
    _registerStore ??= Provider.of<RegisterStore>(context);
    _disposers ??= [
      reactionOnErrorMessage(),
      reactionOnIsCreated(),
    ];
  }

  // Navigate whenever the bool isLogged equal to true
  ReactionDisposer reactionOnIsCreated() {
    return reaction(
          (_) => _registerStore.isCreated,
          (bool isCreated) {
        if (isCreated) {
          print('user is created');
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => LoginScreen()),
                  (Route<dynamic> route) => false);
        } else {
          print('fail creating user');
        }
      },
    );
  }

  // Show whenever an error is caught, SnackBar appear, showing the error message
  ReactionDisposer reactionOnErrorMessage() {
    return reaction(
          (_) => _registerStore.errorMessage,
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
    return Stack(
      //mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        buildLoading(),
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
                  padding: const EdgeInsets.only(bottom: CPadding.defaultSmall),
                  child: buildUsernameInput(),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: CPadding.defaultSmall),
                  child: buildEmailInput(),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: CPadding.defaultSmall),
                  child: buildPasswordInput(),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: CPadding.defaultSmall),
                  child: buildConfirmPasswordInput(),
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
                child: buildButtonSubmit(),
              ),
              Text(
                'By creating an account, you are agreeing to our Terms of Service and Privacy Policy',
                textAlign: TextAlign.center,
                style: themeData.textTheme.bodyText2,
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget buildUsernameInput() {
    return Observer(
      builder: (_) {
        return CTextInput(
          textHint: 'Username',
          onChanged: (value) {
            _registerStore.username = value;
          },
        );
      },
    );
  }

  Widget buildEmailInput() {
    return Observer(
      builder: (_) {
        return CTextInput(
          textHint: 'Email',
          onChanged: (value) {
            _registerStore.email = value;
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
            _registerStore.password = value;
          },
        );
      },
    );
  }

  Widget buildConfirmPasswordInput() {
    return Observer(
      builder: (_) {
        return CTextInput(
          textHint: 'Confirm password',
          isPasswordType: true,
          onChanged: (value) {
            _registerStore.confirmPassword = value;
          },
        );
      },
    );
  }

  Widget buildButtonSubmit() {
    return CButton(
      text: 'Create an account',
      textStyle: themeData.textTheme.headline3.copyWith(color: CColors.black),
      colorBackground: CColors.primary,
      height: 56,
      borderRadius: BorderRadius.circular(28),
      onPressed: () => submitRegisterForm(context),
    );
  }

  Widget buildLoading() {
    return Observer(
      builder: (_) {
        if (_registerStore.state == StoreState.loading) {
          return Center(child: CircularProgressIndicator());
        }
        // here we can add on success, to show user that he's logging successfully
        return Container();
      },
    );
  }

  void submitRegisterForm(BuildContext context) {
    final store = Provider.of<RegisterStore>(context);
    store.errorMessage='';
    store.doCreateAccount();
  }
}
