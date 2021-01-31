
import 'package:app/di/http_client.dart';
import 'package:app/di/injector_provider.dart';
import 'package:app/models/authentication_tokens.dart';
import 'package:app/repositories/api/user_authentication_api.dart';

class AuthRepository {
  final HttpClient _http = inject<HttpClient>();

  /// To implement : create account / user auth (see di/http_client.dart if interceptors needed auth_token)
  /// register Factory in injector_provider
  Future<AuthenticationTokens> getTokens(String username, String password) {
    _http.refreshToken();
    return UserAuthenticationApi(username,password).post();
  }

}