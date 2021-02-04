import 'package:app/di/injector_provider.dart';
import 'package:app/models/auth/authentication_tokens.dart';
import 'package:app/models/auth/user.dart';
import 'package:app/repositories/auth_repository.dart';
import 'package:mobx/mobx.dart';

part 'auth_form_store.g.dart';

class AuthFormStore = _AuthFormStore with _$AuthFormStore;

enum StoreState { initial, loading, loaded }

abstract class _AuthFormStore with Store {
  final AuthRepository _authRepository = inject<AuthRepository>();

  @observable
  User user;

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
    try {
      errorMessage = null;
      isLogged = false;
      _futureAuthenticationTokens =
          ObservableFuture(_authRepository.login('dtestd', 'dtestd'));
      authenticationTokens = await _futureAuthenticationTokens;
      isLogged = true;
      return authenticationTokens;
    } catch (e) {
      isLogged = false;
      errorMessage = 'doLogin catch error';
    }
  }
}
