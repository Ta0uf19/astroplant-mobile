import 'package:app/data/auth/auth_repository.dart';
import 'package:app/di/injector_provider.dart';
import 'package:app/models/auth/authentication_tokens.dart';
import 'package:app/models/auth/user.dart';
import 'package:app/stores/store_state.dart';
import 'package:mobx/mobx.dart';

part 'login_store.g.dart';

class LoginStore = _LoginStore with _$LoginStore;

abstract class _LoginStore with Store {
  final AuthRepository _authRepository = inject<AuthRepository>();

  /// Response objects
  @observable
  User user;

  @observable
  ObservableFuture<User> _user;

  /// State helper objects
  @observable
  bool isLogged;

  @observable
  String errorMessage;

  @computed
  StoreState get loginState {
    if (_user == null ||
        _user.status == FutureStatus.rejected) {
      return StoreState.initial;
    }
    return _user.status == FutureStatus.fulfilled
        ? StoreState.loaded
        : StoreState.loading;
  }

  @action
  Future getCurrentUser() async{
    isLogged = false;
    try {
      _user =
          ObservableFuture(_authRepository.getInfo());
      user = await _user;
      isLogged = true;
      print('is logged : true');
      return user;
    } on Exception catch (e) {
      errorMessage = e.toString().replaceFirst(RegExp(r'Exception: '), '');
      print('is logged : false, error : $errorMessage');
    }
  }

  @action
  Future doLogout() async{
    try {
      await _authRepository.logout();
      isLogged = false;
      user = null;
    } on Exception catch (e) {
      errorMessage = e.toString().replaceFirst(RegExp(r'Exception: '), '');
    }
  }

  @action
  Future doLogin(String username, String password) async {
    errorMessage = '';
    isLogged = false;

    // To validate inputs of the form
    errorMessage = checkLoginInputForm(username,password);

    if (errorMessage.isNotEmpty) return;

    try {
      _user =
          ObservableFuture(_authRepository.login(username, password));
      user = await _user;
      isLogged = true;
      return user;
    } on Exception catch (e) {
      isLogged = false;
      errorMessage = e.toString().replaceFirst(RegExp(r'Exception: '), '');
    }
  }

  String checkLoginInputForm(String username,String password) {
    var errors = '';

    var usernameErrors = errorsOnUsername(username);
    var passwordErrors = errorsOnPassword(password);

    errors += usernameErrors.isNotEmpty ? usernameErrors + '\n' : '';
    errors += passwordErrors.isNotEmpty ? passwordErrors + '\n' : '';

    return errors;
  }

  String errorsOnUsername(String username) {
    return username == null || username.isEmpty
        ? 'Username cannot be blank'
        : '';
  }

  String errorsOnPassword(String password) {
    return password == null || password.isEmpty
        ? 'Password cannot be blank'
        : '';
  }


}
