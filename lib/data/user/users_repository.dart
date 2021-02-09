import 'package:app/di/injector_provider.dart';
import 'package:app/models/auth/user.dart';
import 'package:app/data/user/users_api.dart';

class UserRepository{

  final UsersApi _api = inject<UsersApi>();

  /// Create a new user
  Future<void> createUser(String username, String password, String emailAddress) async {
    return await _api.createUser(username,password,emailAddress);
  }

  /// Returns user's details
  Future<User> userDetails(String username) async {
    return await _api.userDetails(username);
  }

  /// TODO Returns list of user's kit
  Future<void> usersKitMembershipsUrl(String username) async {
    return await _api.usersKitMembershipsUrl(username);
  }


}