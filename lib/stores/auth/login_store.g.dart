// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LoginStore on _LoginStore, Store {
  Computed<StoreState> _$loginStateComputed;

  @override
  StoreState get loginState =>
      (_$loginStateComputed ??= Computed<StoreState>(() => super.loginState,
              name: '_LoginStore.loginState'))
          .value;

  final _$userAtom = Atom(name: '_LoginStore.user');

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

  final _$_userAtom = Atom(name: '_LoginStore._user');

  @override
  ObservableFuture<User> get _user {
    _$_userAtom.reportRead();
    return super._user;
  }

  @override
  set _user(ObservableFuture<User> value) {
    _$_userAtom.reportWrite(value, super._user, () {
      super._user = value;
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

  final _$getCurrentUserAsyncAction = AsyncAction('_LoginStore.getCurrentUser');

  @override
  Future<dynamic> getCurrentUser() {
    return _$getCurrentUserAsyncAction.run(() => super.getCurrentUser());
  }

  final _$doLogoutAsyncAction = AsyncAction('_LoginStore.doLogout');

  @override
  Future<dynamic> doLogout() {
    return _$doLogoutAsyncAction.run(() => super.doLogout());
  }

  final _$doLoginAsyncAction = AsyncAction('_LoginStore.doLogin');

  @override
  Future<dynamic> doLogin(String username, String password) {
    return _$doLoginAsyncAction.run(() => super.doLogin(username, password));
  }

  @override
  String toString() {
    return '''
user: ${user},
isLogged: ${isLogged},
errorMessage: ${errorMessage},
loginState: ${loginState}
    ''';
  }
}
