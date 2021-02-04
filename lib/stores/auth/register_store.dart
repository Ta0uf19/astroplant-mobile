import 'package:app/di/injector_provider.dart';
import 'package:app/repositories/users_repository.dart';
import 'package:app/stores/store_state.dart';
import 'package:mobx/mobx.dart';
import 'package:validators/validators.dart';

part 'register_store.g.dart';

class RegisterStore = _RegisterStore with _$RegisterStore;

abstract class _RegisterStore with Store {
  final UserRepository _userRepository = inject<UserRepository>();

  /// Form fields
  @observable
  String username;

  @observable
  String email;

  @observable
  String password;

  @observable
  String confirmPassword;

  /// Response objects
  @observable
  ObservableFuture<void> _futureCreatedAccount;

  /// State helper objects
  @observable
  bool isCreated;

  @observable
  String errorMessage;

  @computed
  StoreState get state {
    if (_futureCreatedAccount == null ||
        _futureCreatedAccount.status == FutureStatus.rejected) {
      return StoreState.initial;
    }
    return _futureCreatedAccount.status == FutureStatus.fulfilled
        ? StoreState.loaded
        : StoreState.loading;
  }

  @action
  Future doCreateAccount() async {
    errorMessage = '';
    isCreated = false;

    // To validate inputs of the form
    errorMessage = checkInputFormErrors();
    if (errorMessage.isNotEmpty) return;

    try {
      _futureCreatedAccount = ObservableFuture(
          _userRepository.createUser(username, password, email));
      await _futureCreatedAccount;
      isCreated = true;
      return;
    } on Exception catch (e) {
      isCreated = false;
      errorMessage = e.toString().replaceFirst(RegExp(r'Exception: '), '');
    }
  }

  String checkInputFormErrors() {
    var errors = '';

    var usernameErrors = errorsOnUsername();
    var emailErrors = errorsOnEmail();
    var passwordErrors = errorsOnPassword();
    var confirmPasswordErrors = errorsOnConfirmPassword();

    errors += usernameErrors.isNotEmpty ? usernameErrors + '\n' : '';
    errors += emailErrors.isNotEmpty ? emailErrors + '\n' : '';
    errors += passwordErrors.isNotEmpty ? passwordErrors + '\n' : '';
    if (passwordErrors.isEmpty) {
      errors +=
          confirmPasswordErrors.isNotEmpty ? confirmPasswordErrors + '\n' : '';
    }

    return errors;
  }

  String errorsOnUsername() {
    return username == null || username.isEmpty
        ? 'Username cannot be blank'
        : '';
  }

  String errorsOnEmail() {
    if (email == null || email.isEmpty) {
      return 'Email cannot be blank';
    }
    return isEmail(email) ? '' : 'Email is not valid';
  }

  String errorsOnPassword() {
    return password == null || password.isEmpty
        ? 'Password cannot be blank'
        : '';
  }

  String errorsOnConfirmPassword() {
    if (confirmPassword == null || confirmPassword.isEmpty) {
      return 'Confirm password field cannot be blank';
    }
    if (errorsOnPassword().isNotEmpty) return '';
    return confirmPassword != password ? 'The two passwords don\'t match' : '';
  }
}
