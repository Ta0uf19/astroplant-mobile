import 'package:app/di/http_client.dart';
import 'package:app/di/injector_provider.dart';
import 'package:app/models/authentication_tokens.dart';
import 'package:app/repositories/api/endpoints.dart';

class UserAuthenticationApi {

  /// injecting dio instance
  final HttpClient _http = inject<HttpClient>();

  ///final UserAuthenticationApi userAuthenticationApi = inject<UserAuthenticationApi>(param1: 5);

  String _endpoint;
  String username;
  String password;

  UserAuthenticationApi(String username, String password) {

    this.username = username;
    this.password = password;

    /// add parameter to the url
    _endpoint = Endpoints.authenticateUrl;
  }

  /// Returns list of configuration of a kit in response
  Future<AuthenticationTokens> post() async {
    try {
      final res = await _http.post(_endpoint,body : {"username": username, "password": password});
      return AuthenticationTokens.fromJson(res.data);
    } catch (e) {
      print(e.toString());
      rethrow;
    }
  }

}