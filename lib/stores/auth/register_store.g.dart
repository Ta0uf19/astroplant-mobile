// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$RegisterStore on _RegisterStore, Store {
  Computed<StoreState> _$stateComputed;

  @override
  StoreState get state => (_$stateComputed ??=
          Computed<StoreState>(() => super.state, name: '_RegisterStore.state'))
      .value;

  final _$usernameAtom = Atom(name: '_RegisterStore.username');

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

  final _$emailAtom = Atom(name: '_RegisterStore.email');

  @override
  String get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  final _$passwordAtom = Atom(name: '_RegisterStore.password');

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

  final _$confirmPasswordAtom = Atom(name: '_RegisterStore.confirmPassword');

  @override
  String get confirmPassword {
    _$confirmPasswordAtom.reportRead();
    return super.confirmPassword;
  }

  @override
  set confirmPassword(String value) {
    _$confirmPasswordAtom.reportWrite(value, super.confirmPassword, () {
      super.confirmPassword = value;
    });
  }

  final _$_futureCreatedAccountAtom =
      Atom(name: '_RegisterStore._futureCreatedAccount');

  @override
  ObservableFuture<void> get _futureCreatedAccount {
    _$_futureCreatedAccountAtom.reportRead();
    return super._futureCreatedAccount;
  }

  @override
  set _futureCreatedAccount(ObservableFuture<void> value) {
    _$_futureCreatedAccountAtom.reportWrite(value, super._futureCreatedAccount,
        () {
      super._futureCreatedAccount = value;
    });
  }

  final _$isCreatedAtom = Atom(name: '_RegisterStore.isCreated');

  @override
  bool get isCreated {
    _$isCreatedAtom.reportRead();
    return super.isCreated;
  }

  @override
  set isCreated(bool value) {
    _$isCreatedAtom.reportWrite(value, super.isCreated, () {
      super.isCreated = value;
    });
  }

  final _$errorMessageAtom = Atom(name: '_RegisterStore.errorMessage');

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

  final _$doLoginAsyncAction = AsyncAction('_RegisterStore.doLogin');

  @override
  Future<dynamic> doLogin() {
    return _$doLoginAsyncAction.run(() => super.doLogin());
  }

  @override
  String toString() {
    return '''
username: ${username},
email: ${email},
password: ${password},
confirmPassword: ${confirmPassword},
isCreated: ${isCreated},
errorMessage: ${errorMessage},
state: ${state}
    ''';
  }
}
