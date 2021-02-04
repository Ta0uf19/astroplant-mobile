// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_form_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AuthFormStore on _AuthFormStore, Store {
  Computed<StoreState> _$stateComputed;

  @override
  StoreState get state => (_$stateComputed ??=
          Computed<StoreState>(() => super.state, name: '_AuthFormStore.state'))
      .value;

  final _$userAtom = Atom(name: '_AuthFormStore.user');

  @override
  User get user {
    _$userAtom.reportRead();
    return super.user;
  }

  @override
  set user(User value) {
    _$userAtom.reportWrite(value, super.user, () {
      super.user = value;
    });
  }

  final _$isLoggedAtom = Atom(name: '_AuthFormStore.isLogged');

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

  final _$authenticationTokensAtom =
      Atom(name: '_AuthFormStore.authenticationTokens');

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
      Atom(name: '_AuthFormStore._futureAuthenticationTokens');

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

  final _$errorMessageAtom = Atom(name: '_AuthFormStore.errorMessage');

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

  final _$doLoginAsyncAction = AsyncAction('_AuthFormStore.doLogin');

  @override
  Future<dynamic> doLogin() {
    return _$doLoginAsyncAction.run(() => super.doLogin());
  }

  @override
  String toString() {
    return '''
user: ${user},
isLogged: ${isLogged},
authenticationTokens: ${authenticationTokens},
errorMessage: ${errorMessage},
state: ${state}
    ''';
  }
}