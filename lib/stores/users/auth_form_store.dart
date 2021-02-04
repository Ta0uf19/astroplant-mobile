import 'package:app/di/injector_provider.dart';
import 'package:app/models/auth/authentication_tokens.dart';
import 'package:app/repositories/auth_repository.dart';
import 'package:mobx/mobx.dart';

part 'auth_form_store.g.dart';

class AuthFormStore = _AuthFormStore with _$AuthFormStore;

enum StoreState { initial, loading, loaded }

abstract class _AuthFormStore with Store {
  final AuthRepository _authRepository = inject<AuthRepository>();

  @observable
  String username;

  @observable
  String password;

  @observable
  bool isLogged;

  @observable
  AuthenticationTokens authenticationTokens;

  @observable
  ObservableFuture<AuthenticationTokens> _futureAuthenticationTokens;

  @observable
  String errorMessage;

  @computed
  StoreState get state {
    if (_futureAuthenticationTokens == null ||
        _futureAuthenticationTokens.status == FutureStatus.rejected) {
      return StoreState.initial;
    }
    return _futureAuthenticationTokens.status == FutureStatus.fulfilled
        ? StoreState.loaded
        : StoreState.loading;
  }

  @action
  Future doLogin() async {
    errorMessage = '';
    isLogged = false;

    // To validate inputs of the form
    errorMessage = checkInputFormErrors();

    if(errorMessage.isNotEmpty ) return;

    try {
      _futureAuthenticationTokens =
          ObservableFuture(_authRepository.login(username, password));
      authenticationTokens = await _futureAuthenticationTokens;
      isLogged = true;
      return authenticationTokens;
    } on Exception catch (e) {
      isLogged = false;
      errorMessage = e.toString();
    }
  }

  String checkInputFormErrors() {
    var errors = '';

    var usernameErrors = errorsOnUsername();
    var passwordErrors = errorsOnPassword();

    errors += usernameErrors.isNotEmpty ? usernameErrors+'\n' : '';
    errors += passwordErrors.isNotEmpty ? passwordErrors+'\n' : '';

    return errors;
  }

  String errorsOnPassword() {
    return password == null || password.isEmpty ? 'Password cannot be blank' : '';
  }

  String errorsOnUsername() {
    return username == null || username.isEmpty ? 'Username cannot be blank' : '';
  }
}
