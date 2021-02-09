import 'package:app/di/http_client.dart';
import 'package:app/di/injector_provider.dart';
import 'package:app/models/auth/user.dart';
import 'package:app/repositories/api/endpoints.dart';

class UsersApi{

  /// injecting dio instance
  final HttpClient _http = inject<HttpClient>();

  /// Create  user
  Future<void> createUser(String username, String password, String emailAddress) async {
    try {
      await _http.post(Endpoints.createUserUrl,body: {'username': username, 'password': password, 'emailAddress': emailAddress});
      return;
    } catch (e) {
      print(e.toString());
      rethrow;
    }
  }

  /// Returns user's details
  Future<User> userDetails(String username) async {
    try {
      final res = await _http.get(Endpoints.userDetailsUrl.expand({'username': username}));
      return User.fromJson(res.data);
    } catch (e) {
      print(e.toString());
      rethrow;
    }
  }

  /// TODO Returns list of user's kit
  Future<void> usersKitMembershipsUrl(String username) async {
    try {
      final res = await _http.get(Endpoints.usersKitMembershipsUrl.expand({'username': username}));
      return ;
    } catch (e) {
      print(e.toString());
      rethrow;
    }
  }



}