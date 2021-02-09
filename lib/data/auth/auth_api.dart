import 'package:app/data/http_client.dart';
import 'package:app/di/injector_provider.dart';
import 'package:app/models/auth/authentication_tokens.dart';
import 'package:app/models/auth/user.dart';
import 'package:app/data/endpoints.dart';

class AuthApi {
  /// injecting dio instance
  final HttpClient _http = inject<HttpClient>();

  /// Authenticate yourself by username and password.
  Future<AuthenticationTokens> authenticateByCredentials(String username, String password) async {
    try {
      final response = await _http.post(Endpoints.authUrl, body: {'username': username, 'password': password});
      return AuthenticationTokens.fromJson(response.data);
    } catch(e) {
      print(e.toString());
      throw Exception('Failed to login');
    }

  }

  /// Obtain an access token from a refresh token.
  Future<String> refreshToken(String refreshToken) async {
    try {
      final response = await _http.post(Endpoints.authRefreshUrl, body: {'refreshToken': refreshToken});
      return response.data;
    } catch(e) {
      print(e.toString());
      throw Exception('Failed to refresh token');
    }
  }

  /// Get user information
  Future<User> me() async {
    try {
      final response = await _http.get(Endpoints.authInfoUrl);
      return User.fromJson(response.data);
    } catch(e) {
      print(e.toString());
      throw Exception('Failed to load information data');
    }
  }
}
