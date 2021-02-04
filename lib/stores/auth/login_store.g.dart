// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LoginStore on _LoginStore, Store {
  Computed<StoreState> _$stateComputed;

  @override
  StoreState get state => (_$stateComputed ??=
          Computed<StoreState>(() => super.state, name: '_LoginStore.state'))
      .value;

  final _$usernameAtom = Atom(name: '_LoginStore.username');

  @override
  String get username {
    _$usernameAtom.reportRead();
    return super.username;
  }

  @override
  set username(String value) {
    _$usernameAtom.reportWrite(value, super.username, () {
      super.username = value;
    });
  }

  final _$passwordAtom = Atom(name: '_LoginStore.password');

  @override
  String get password {
    _$passwordAtom.reportRead();
    return super.password;
  }

  @override
  set password(String value) {
    _$passwordAtom.reportWrite(value, super.password, () {
      super.password = value;
    });
  }

  final _$authenticationTokensAtom =
      Atom(name: '_LoginStore.authenticationTokens');

  @override
  AuthenticationTokens get authenticationTokens {
    _$authenticationTokensAtom.reportRead();
    return super.authenticationTokens;
  }

  @override
  set authenticationTokens(AuthenticationTokens value) {
    _$authenticationTokensAtom.reportWrite(value, super.authenticationTokens,
        () {
      super.authenticationTokens = value;
    });
  }

  final _$_futureAuthenticationTokensAtom =
      Atom(name: '_LoginStore._futureAuthenticationTokens');

  @override
  ObservableFuture<AuthenticationTokens> get _futureAuthenticationTokens {
    _$_futureAuthenticationTokensAtom.reportRead();
    return super._futureAuthenticationTokens;
  }

  @override
  set _futureAuthenticationTokens(
      ObservableFuture<AuthenticationTokens> value) {
    _$_futureAuthenticationTokensAtom
        .reportWrite(value, super._futureAuthenticationTokens, () {
      super._futureAuthenticationTokens = value;
    });
  }

  final _$isLoggedAtom = Atom(name: '_LoginStore.isLogged');

  @override
  bool get isLogged {
    _$isLoggedAtom.reportRead();
    return super.isLogged;
  }

  @override
  set isLogged(bool value) {
    _$isLoggedAtom.reportWrite(value, super.isLogged, () {
      super.isLogged = value;
    });
  }

  final _$errorMessageAtom = Atom(name: '_LoginStore.errorMessage');

  @override
  String get errorMessage {
    _$errorMessageAtom.reportRead();
    return super.errorMessage;
  }

  @override
  set errorMessage(String value) {
    _$errorMessageAtom.reportWrite(value, super.errorMessage, () {
      super.errorMessage = value;
    });
  }

  final _$doLoginAsyncAction = AsyncAction('_LoginStore.doLogin');

  @override
  Future<dynamic> doLogin() {
    return _$doLoginAsyncAction.run(() => super.doLogin());
  }

  @override
  String toString() {
    return '''
username: ${username},
password: ${password},
authenticationTokens: ${authenticationTokens},
isLogged: ${isLogged},
errorMessage: ${errorMessage},
state: ${state}
    ''';
  }
}
