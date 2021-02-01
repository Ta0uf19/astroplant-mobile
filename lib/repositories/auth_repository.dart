import 'package:app/di/injector_provider.dart';
import 'package:app/models/auth/authentication_tokens.dart';
import 'package:app/models/auth/user.dart';
import 'package:app/repositories/api/auth_api.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepository {

  final AuthApi _api = inject<AuthApi>();

  /// Login by username and password.
  Future<AuthenticationTokens> login(String username, String password) async {
    var result = await _api.authenticateByCredentials(username, password);
    // set auth token
    var pref = await SharedPreferences.getInstance();
    await pref.setString('auth_token', result.accessToken);
    return result;
  }

  /// Your user information.
  Future<User> getInfo() async {
    return await _api.me();
  }


  // Logout
  void logout() async {
    // set auth token
    var pref = await SharedPreferences.getInstance();
    await pref.remove('auth_token');
  }

}