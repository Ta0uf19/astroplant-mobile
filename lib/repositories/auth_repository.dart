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
    await pref.setString('refresh_token', result.refreshToken);
    return result;
  }

  /// Obtain an access token from a refresh token.
  Future<String> refreshToken() async {
    // getting shared pref instance
    var pref = await SharedPreferences.getInstance();
    var refreshToken = pref.getString('refresh_token');
    if(refreshToken == null) {
      throw Exception('Failed to refresh access token, you need to login again');
    }
    var newToken = await _api.refreshToken(refreshToken);
    // set new token
    await pref.setString('auth_token', newToken);
    return newToken;
  }

  /// Your user information.
  Future<User> getInfo() async {
    return await _api.me();
  }

  /// Logout
  void logout() async {
    var pref = await SharedPreferences.getInstance();
    await pref.remove('auth_token');
    await pref.remove('refresh_token');
  }

}