
import 'package:app/models/authentication_tokens.dart';
import 'package:app/repositories/api/user_authentication_api.dart';

class AuthRepository {

  /// To implement : create account / user auth (see di/http_client.dart if interceptors needed auth_token)
  /// register Factory in injector_provider
  Future<AuthenticationTokens> getConfiguration(String username, String password) {
    return UserAuthenticationApi(username,password).post();
  }

}